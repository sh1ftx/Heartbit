#!/bin/bash

# ==============================================================================
# CONFIG.SH - INSTALADOR UNIVERSAL E ROBUSTO
# ==============================================================================
# Esse script foi feito para ser executado por QUALQUER USUÁRIO, em QUALQUER
# SISTEMA OPERACIONAL (Linux - Debian/Arch e Windows via WSL ou Git Bash),
# automatizando todo o ambiente de execução do projeto de Machine Learning.
#
# Ele verifica, instala e configura tudo: Python, pip, venv, bibliotecas e
# executa o main.py. Possui checagens, mensagens e perguntas interativas.
#
# ==============================================================================
# AUTOR: Gerado por IA (ChatGPT) - Versão Premium de Configuração
# ==============================================================================

set -e

#!/bin/bash

# ==============================================================================
# CONFIG.SH - INSTALADOR UNIVERSAL E ROBUSTO DO PROJETO: HEARTBIT
# ==============================================================================
# 🧬 Heartbit analisa dados de saúde cardiovascular para revelar padrões
#     e prever riscos com inteligência e precisão
# ==============================================================================

# Função para exibir o nome do projeto em ASCII art
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

# Exibir logo no início
show_logo


# Função de cabeçalho bonito
function print_header() {
  echo -e "\n\033[1;34m================================================================================"
  echo -e "        $1"
  echo -e "================================================================================\033[0m"
}

# Função para mensagens de progresso
function print_step() {
  echo -e "\033[1;32m[PASSO] $1\033[0m"
}

# Função para mensagens de alerta
function print_warn() {
  echo -e "\033[1;33m[AVISO] $1\033[0m"
}

# Função para mensagens de erro
function print_error() {
  echo -e "\033[1;31m[ERRO] $1\033[0m"
}

# Função para perguntas interativas
function ask_user() {
  read -p "$1 (s/n): " choice
  case "$choice" in
    s|S ) return 0 ;;
    n|N ) return 1 ;;
    * ) echo "Opção inválida." && ask_user "$1" ;;
  esac
}

# -----------------------------
# Detectar o sistema operacional
# -----------------------------
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
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
  OS="windows"
  PM="choco"
else
  print_error "Sistema operacional não reconhecido: $OSTYPE"
  exit 1
fi

echo "Sistema detectado: $OS"

# -----------------------------
# Checar e instalar Python
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
print_header "Configurando ambiente virtual..."

if [ ! -d "venv" ]; then
  python3 -m venv venv
  echo "Ambiente virtual criado."
else
  echo "Ambiente virtual já existe."
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
print_header "Instalando dependências..."

requirements=$(cat <<EOF
cloudpickle==3.1.1
contourpy==1.3.2
cycler==0.12.1
fonttools==4.57.0
joblib==1.4.2
kiwisolver==1.4.8
llvmlite==0.44.0
matplotlib==3.10.1
narwhals==1.36.0
numba==0.61.2
numpy==2.2.5
packaging==25.0
pandas==2.2.3
pillow==11.2.1
plotly==6.0.1
pyparsing==3.2.3
python-dateutil==2.9.0.post0
pytz==2025.2
scikit-learn==1.6.1
scipy==1.15.2
seaborn==0.13.2
shap==0.47.2
six==1.17.0
slicer==0.0.8
threadpoolctl==3.6.0
tqdm==4.67.1
typing_extensions==4.13.2
tzdata==2025.2
EOF
)

echo "$requirements" > requirements.txt
pip install -r requirements.txt

# -----------------------------
# Executar main.py
# -----------------------------
print_header "Executando o projeto (main.py)..."

if [ -f "main.py" ]; then
  python main.py
else
  print_error "Arquivo main.py não encontrado no diretório atual."
  exit 1
fi