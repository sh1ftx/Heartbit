#!/bin/bash

# ==============================================================================

# Esse script foi feito para ser executado por QUALQUER USUÁRIO, em QUALQUER
# SISTEMA OPERACIONAL (Linux - Debian/Arch e Windows via WSL ou Git Bash),
# automatizando todo o ambiente de execução do projeto de Machine Learning.
#
# 🧬 Heartbit analisa dados de saúde cardiovascular para revelar padrões
#     e prever riscos com inteligência e precisão

# ==============================================================================
# CONFIG.SH - INSTALADOR UNIVERSAL E ROBUSTO DO PROJETO: HEARTBIT
# ==============================================================================
# 🧬 Heartbit analisa dados de saúde cardiovascular para revelar padrões
#     e prever riscos com inteligência e precisão
# ==============================================================================

set -e

# Criar pasta de logs
mkdir -p logs
LOGFILE="logs/install.log"
exec > >(tee -i $LOGFILE)
exec 2>&1

# -----------------------------
# Funções utilitárias
# -----------------------------

function show_logo() {
cat << "EOF"

 _   _                _     _     _ _   
| | | | ___  __ _  __| |___| |__ (_) |_ 
| |_| |/ _ \/ _` |/ _` / __| '_ \| | __|
|  _  |  __/ (_| | (_| \__ \ | | | | |_ 
|_| |_|\___|\__,_|\__,_|___/_| |_|_|\__|

🧬 Heartbit analisa dados de saúde cardiovascular para revelar padrões
    e prever riscos com inteligência e precisão

EOF
}

function print_header() {
  echo -e "\n\033[1;34m================================================================================"
  echo -e "        $1"
  echo -e "================================================================================\033[0m"
}

function print_step() {
  echo -e "\033[1;32m[PASSO] $1\033[0m"
}

function print_warn() {
  echo -e "\033[1;33m[AVISO] $1\033[0m"
}

function print_error() {
  echo -e "\033[1;31m[ERRO] $1\033[0m"
}

function ask_user() {
  read -p "$1 (s/n): " choice
  case "$choice" in
    s|S ) return 0 ;;
    n|N ) return 1 ;;
    * ) echo "Opção inválida." && ask_user "$1" ;;
  esac
}

# -----------------------------
# Início
# -----------------------------
show_logo

# Detectar sistema operacional
print_header "Detectando Sistema Operacional..."

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  if [ -f /etc/debian_version ]; then
    OS="debian"
    PM="sudo apt"
  elif [ -f /etc/arch-release ]; then
    OS="arch"
    PM="sudo pacman -Sy"
  else
    print_error "Distribuição Linux não suportada automaticamente."
    exit 1
  fi
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
  OS="windows"
  PM="choco"
else
  print_error "Sistema operacional não reconhecido: $OSTYPE"
  exit 1
fi

echo "Sistema detectado: $OS"

# -----------------------------
# Instalar Python se necessário
# -----------------------------
print_header "Verificando o Python..."

if ! command -v python3 &> /dev/null; then
  print_warn "Python3 não encontrado."
  if ask_user "Deseja instalar o Python3 agora?"; then
    if [ "$OS" = "debian" ]; then
      $PM update
      $PM install python3 python3-pip python3-venv -y
    elif [ "$OS" = "arch" ]; then
      $PM python python-pip python-virtualenv --noconfirm
    elif [ "$OS" = "windows" ]; then
      if ! command -v choco &> /dev/null; then
        print_error "Chocolatey não instalado. Instale o Chocolatey manualmente: https://chocolatey.org/install"
        exit 1
      fi
      $PM install python -y
    fi
  else
    print_error "Instalação do Python cancelada."
    exit 1
  fi
else
  echo "Python já instalado."
fi

# -----------------------------
# Criar ambiente virtual
# -----------------------------
print_header "Criando ambiente virtual..."

if [ ! -d "venv" ]; then
  python3 -m venv venv
  echo "Ambiente virtual criado."
fi

source venv/bin/activate || source venv/Scripts/activate

# -----------------------------
# Atualizar pip
# -----------------------------
print_step "Atualizando pip..."
pip install --upgrade pip

# -----------------------------
# Instalar dependências
# -----------------------------
print_header "Instalando dependências do projeto..."

cat > requirements.txt <<EOF
cloudpickle==3.1.1
pandas==2.2.3
matplotlib==3.10.1
seaborn==0.13.2
scikit-learn==1.6.1
shap==0.47.2
plotly==6.0.1
tqdm==4.67.1
numpy==2.2.5
EOF

pip install -r requirements.txt

# -----------------------------
# Instalar DVC e MLflow
# -----------------------------
print_header "Instalando DVC e MLflow..."
pip install dvc[gs,s3] mlflow

# -----------------------------
# Instalar Jupyter (opcional)
# -----------------------------
if ask_user "Deseja instalar o Jupyter Notebook?"; then
  print_step "Instalando Jupyter..."
  pip install notebook jupyterlab
else
  print_step "Instalação do Jupyter ignorada."
fi

# -----------------------------
# Criar .env
# -----------------------------
print_header "Gerando arquivo .env..."
cat > .env <<EOF
# Arquivo .env do Heartbit
DATASET_PATH=./database/cardio_train.csv
EOF
echo ".env criado com sucesso."

# -----------------------------
# Executar o projeto
# -----------------------------
print_header "Executando o projeto..."

MAIN_FILE=$(find . -type f -name "main.py" | head -n 1)

if [ -z "$MAIN_FILE" ]; then
  print_error "Arquivo main.py não encontrado."
  exit 1
else
  MAIN_FILE_ABS=$(realpath "$MAIN_FILE")
  echo -e "\033[1;34mExecutando: $MAIN_FILE_ABS\033[0m"
  python_exec=$(command -v python3 || command -v python)
  "$python_exec" "$MAIN_FILE_ABS"
fi
