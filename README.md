# 🧬 Heartbit

> *Análise preditiva de dados de saúde cardiovascular com machine learning*

```
██╗  ██╗███████╗ █████╗ ██████╗ ███████╗██████╗ ██╗████████╗
██║  ██║██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗██║╚══██╔══╝
███████║█████╗  ███████║██║  ██║█████╗  ██████╔╝██║   ██║   
██╔══██║██╔══╝  ██╔══██║██║  ██║██╔══╝  ██╔══██╗██║   ██║   
██║  ██║███████╗██║  ██║██████╔╝███████╗██║  ██║██║   ██║   
╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝   ╚═╝   
```

 Heartbit analisa dados de saúde cardiovascular para revelar padrões e prever riscos com inteligência e precisão

---

![image](https://github.com/user-attachments/assets/16c0b477-cb15-41a0-8e9c-897ecf3d2f69)

---

## Índice

1. [Introdução](#1-introdução)
2. [Contexto: IA e o Futuro da Medicina](#2-contexto-ia-e-o-futuro-da-medicina)
3. [Objetivo do Projeto](#3-objetivo-do-projeto)
4. [Ferramentas e Bibliotecas Utilizadas](#4-ferramentas-e-bibliotecas-utilizadas)
5. [Dataset Utilizado](#5-dataset-utilizado)
6. [Funcionamento do Projeto: Etapa por Etapa](#6-funcionamento-do-projeto-etapa-por-etapa)
7. [Como Clonar e Executar o Projeto](#7-como-clonar-e-executar-o-projeto)
8. [Explicação dos Scripts](#8-explicação-dos-scripts)
9. [Contribuições, Licença e Contato](#9-contribuições-licença-e-contato)
10. [Referências](#10-referências)

---

## 1. Introdução

O avanço da Inteligência Artificial (IA) está remodelando o cenário da medicina moderna. Com algoritmos cada vez mais poderosos, surge a questão: *a IA vai substituir os médicos?* Embora a resposta mais aceita seja "não totalmente", é inegável que ela transformará profundamente a prática clínica. O projeto **Heartbit** propõe-se a demonstrar, de forma prática, como modelos de machine learning podem analisar dados de saúde reais e gerar previsões com alta acurácia, mantendo a interpretabilidade e confiabilidade.

---

## 2. Contexto: IA e o Futuro da Medicina

Diversos estudos apontam para uma mudança no papel dos profissionais da saúde diante da IA:

- [AI Will Not Replace Doctors, But It May Drastically Change Their Jobs](https://www.forbes.com/sites/forbestechcouncil/2022/11/18/ai-will-not-replace-doctors-but-it-may-drastically-change-their-jobs/)
- [Artificial Intelligence In Healthcare: Will AI Replace Doctors?](https://www.electronicsforu.com/technology-trends/tech-focus/artificial-intelligence-healthcare-replace-doctors)
- [Will artificial intelligence replace doctors?](https://www.aamc.org/news-insights/will-artificial-intelligence-replace-doctors)

Essas leituras sustentam que a IA atuará como assistente, ampliando capacidades médicas, otimizando diagnósticos e melhorando o atendimento ao paciente.

---

## 3. Objetivo do Projeto

O **Heartbit** busca:

- Utilizar dados reais sobre doenças cardiovasculares;
- Treinar modelos de machine learning supervisionados;
- Analisar os resultados de forma interpretável usando SHAP;
- Mostrar, de forma didática, como a IA pode colaborar na medicina preventiva.

---

## 4. Ferramentas e Bibliotecas Utilizadas

- Linguagem: **Python 3.10+**
- Ambiente: `venv`
- Bibliotecas:
  - pandas, numpy, matplotlib, seaborn
  - scikit-learn, shap, plotly
  - tqdm, joblib, cloudpickle
- Ferramentas adicionais:
  - SHAP para interpretabilidade
  - Plotly para visualizações
  - GitHub para versionamento

Veja o [config.sh](./config.sh) para instalação automatizada.

---

## 5. Dataset Utilizado

- Dataset: [Cardiovascular Disease dataset (Kaggle)](https://www.kaggle.com/sulianova/cardiovascular-disease-dataset)
- Colunas incluem idade, colesterol, pressão arterial, IMC, etc.
- Alvo (target): `cardio` (presença ou não de doença cardiovascular)

---

## 6. Funcionamento do Projeto: Etapa por Etapa

1. **Carregamento e Limpeza** do dataset com Pandas;
2. **Análise Exploratória** com Seaborn e Matplotlib;
3. **Pré-processamento**: normalização, encoding, train/test split;
4. **Treinamento** de modelos como RandomForest e XGBoost;
5. **Avaliação** com métricas: acurácia, ROC-AUC;
6. **Explicação dos Resultados** com SHAP (valores de importância de features);
7. **Visualizações interativas** com Plotly;
8. **Execução automatizada** com script bash `config.sh`.

---

## 7. Como Clonar e Executar o Projeto

### Requisitos:
- Git
- Python 3.10+
- Git Bash (Windows) ou Terminal (Linux)

```bash
# Clonar o repositório
https://github.com/sh1ftx/Heartbit.git
cd Heartbit

# Dar permissão e executar o script de instalação
chmod +x config.sh
./config.sh
```

Isso configurará todo o ambiente automaticamente e rodará o `main.py`.

---

## 8. Explicação dos Scripts

- `main.py`: ponto de entrada da aplicação, com lógica central de execução;
- `eda.py`: análise exploratória dos dados com gráficos e estatísticas básicas;
- `model.py`: definição, treino e avaliação dos modelos de ML;
- `utils.py`: funções auxiliares reutilizáveis;
- `config.sh`: automatiza o setup do ambiente com instalação de dependências.

---

## 9. Contribuições, Licença e Contato

Este projeto é open-source, licenciado sob [MIT License](LICENSE).

### Contribuições são bem-vindas:
- Crie um fork
- Crie uma branch com sua feature
- Envie um Pull Request explicando sua contribuição

---

### Sobre o autor

<div align="center">
  <img src="https://img.shields.io/badge/Linux%20User-1d232e?style=flat-square&logo=linux&logoColor=6AFFA0"/>
  <img src="https://img.shields.io/badge/Full%20Stack%20em%20andamento-1d232e?style=flat-square&logo=javascript&logoColor=6AFFA0"/>
  <img src="https://img.shields.io/badge/Cybersegurança-1d232e?style=flat-square&logo=hackthebox&logoColor=6AFFA0"/>
</div>

### Quem sou

- Estudante de **ADS (IFPI)**  
- Foco em **Back-end**, **Cybersegurança** e **IA aplicada**  
- Usuário Linux de verdade: terminal, automação, desempenho  
- Código limpo, funcional e seguro — sem firula  

### Interesses

- **Back-end** — Golang, Python, C++, APIs sólidas  
- **Cybersec** — hardening, análise de vulnerabilidades, scripts ofensivos  
- **Linux/DevOps** — Shell, Docker, CI/CD, otimização de sistemas  
- **IA** — automação inteligente, algoritmos práticos e éticos  
- **Análise de incidentes** — investigação, rastreio e defesa ativa  

### Meus objetivos

- Me firmar como dev **Full Stack**, base forte em **back-end**  
- Dominar **Golang** como stack principal  
- Criar ferramentas com **IA real e útil**  
- Escrever código **seguro, performático e escalável**  

### Stack e Ferramentas

<p align="center">
  <img src="https://img.shields.io/badge/Golang-1d232e?style=for-the-badge&logo=go&logoColor=6AFFA0" />
  <img src="https://img.shields.io/badge/Python-1d232e?style=for-the-badge&logo=python&logoColor=6AFFA0" />
  <img src="https://img.shields.io/badge/C++-1d232e?style=for-the-badge&logo=c%2B%2B&logoColor=6AFFA0" />
  <img src="https://img.shields.io/badge/JavaScript-1d232e?style=for-the-badge&logo=javascript&logoColor=6AFFA0" />
  <img src="https://img.shields.io/badge/TypeScript-1d232e?style=for-the-badge&logo=typescript&logoColor=6AFFA0" />
  <img src="https://img.shields.io/badge/React-1d232e?style=for-the-badge&logo=react&logoColor=6AFFA0" />
  <img src="https://img.shields.io/badge/TensorFlow-1d232e?style=for-the-badge&logo=tensorflow&logoColor=6AFFA0" />
  <img src="https://img.shields.io/badge/Linux-1d232e?style=for-the-badge&logo=linux&logoColor=6AFFA0" />
  <img src="https://img.shields.io/badge/Arch%20Linux-1d232e?style=for-the-badge&logo=archlinux&logoColor=6AFFA0" />
  <img src="https://img.shields.io/badge/Hyprland-1d232e?style=for-the-badge&logo=neovim&logoColor=6AFFA0" />
  <img src="https://img.shields.io/badge/Kali%20Linux-1d232e?style=for-the-badge&logo=kalilinux&logoColor=6AFFA0" />
  <img src="https://img.shields.io/badge/Fedora-1d232e?style=for-the-badge&logo=fedora&logoColor=6AFFA0" />
  <img src="https://img.shields.io/badge/Manjaro-1d232e?style=for-the-badge&logo=manjaro&logoColor=6AFFA0" />
  <img src="https://img.shields.io/badge/Docker-1d232e?style=for-the-badge&logo=docker&logoColor=6AFFA0" />
  <img src="https://img.shields.io/badge/Bash-1d232e?style=for-the-badge&logo=gnubash&logoColor=6AFFA0" />
  <img src="https://img.shields.io/badge/GitHub-1d232e?style=for-the-badge&logo=github&logoColor=6AFFA0" />
  <img src="https://img.shields.io/badge/VSCode-1d232e?style=for-the-badge&logo=visualstudiocode&logoColor=6AFFA0" />
</p>

### Contato

<p align="center">
  <a href="mailto:ivankayki72@gmail.com"><img src="https://img.shields.io/badge/Gmail-1d232e?style=for-the-badge&logo=gmail&logoColor=6AFFA0"></a>
  <a href="https://www.linkedin.com/in/kayki-de-sousa-5a33292b3/"><img src="https://img.shields.io/badge/LinkedIn-1d232e?style=for-the-badge&logo=linkedin&logoColor=6AFFA0"></a>
  <a href="https://www.twitch.tv/sh1ft7172"><img src="https://img.shields.io/badge/Twitch-1d232e?style=for-the-badge&logo=twitch&logoColor=6AFFA0"></a>
</p>

---

## 10. Referências

- Kaggle Dataset: [Cardiovascular Disease](https://www.kaggle.com/sulianova/cardiovascular-disease-dataset)
- SHAP GitHub: [SHAP - Explainable ML](https://github.com/slundberg/shap)
- Artigos:
  - [Forbes - AI & Doctors](https://www.forbes.com/sites/forbestechcouncil/2022/11/18/ai-will-not-replace-doctors-but-it-may-drastically-change-their-jobs/)
  - [Electronics4U - AI in Healthcare](https://www.electronicsforu.com/technology-trends/tech-focus/artificial-intelligence-healthcare-replace-doctors)
  - [AAMC - Will AI Replace Doctors?](https://www.aamc.org/news-insights/will-artificial-intelligence-replace-doctors)

---

### 🌐 Asimov Academy - (Esse projeto foi embasado em uma aula deles )

- Instagram: [@asimov.academy](https://www.instagram.com/asimov.academy)
- TikTok: [@asimov.academy](https://www.tiktok.com/@asimov.academy)
- GitHub: [Asimov Academy](https://github.com/asimov-academy)

---

**Projeto desenvolvido com propósito educacional e demonstração tecnológica.**

