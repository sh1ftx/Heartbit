import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from plotly.subplots import make_subplots
import plotly.graph_objects as go
import plotly.io as pio
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier

# Forçar renderização no navegador (útil no VS Code)
pio.renderers.default = "browser"

# Carregar dados
df_cardio = pd.read_csv("../database/cardio_train.csv", sep=";", index_col=0)

# =============================
# Gráfico de variáveis contínuas (boxplots)
# =============================
fig_cont = make_subplots(
    rows=4, cols=1,
    subplot_titles=[
        "Idade (anos)", "Peso (kg)",
        "Pressão Sistólica", "Pressão Diastólica"
    ]
)

fig_cont.add_trace(go.Box(x=df_cardio["age"] / 365, name="Idade (anos)"), row=1, col=1)
fig_cont.add_trace(go.Box(x=df_cardio["weight"], name="Peso (kg)"), row=2, col=1)
fig_cont.add_trace(go.Box(x=df_cardio["ap_hi"], name="Pressão Sistólica"), row=3, col=1)
fig_cont.add_trace(go.Box(x=df_cardio["ap_lo"], name="Pressão Diastólica"), row=4, col=1)

fig_cont.update_layout(height=900, title="Distribuição das Variáveis Contínuas")
fig_cont.show()

# =============================
# Gráfico de variáveis categóricas (barras)
# =============================
fig_cat = make_subplots(
    rows=2, cols=3,
    subplot_titles=[
        "Gênero", "Colesterol", "Glicose",
        "Fumante", "Alcoólatra", "Atividade Física"
    ]
)

# Gênero
gender_counts = df_cardio["gender"].value_counts().sort_index()
fig_cat.add_trace(go.Bar(x=["Mulher", "Homem"], y=gender_counts.values, name="Gênero"), row=1, col=1)

# Colesterol
chol_labels = ["Normal", "Acima do normal", "Muito acima do normal"]
chol_counts = df_cardio["cholesterol"].value_counts().sort_index()
fig_cat.add_trace(go.Bar(x=chol_labels, y=chol_counts.values, name="Colesterol"), row=1, col=2)

# Glicose
gluc_labels = ["Normal", "Acima do normal", "Muito acima do normal"]
gluc_counts = df_cardio["gluc"].value_counts().sort_index()
fig_cat.add_trace(go.Bar(x=gluc_labels, y=gluc_counts.values, name="Glicose"), row=1, col=3)

# Fumante
smoke_counts = df_cardio["smoke"].value_counts().sort_index()
fig_cat.add_trace(go.Bar(x=["Não Fumante", "Fumante"], y=smoke_counts.values, name="Fumante"), row=2, col=1)

# Alcoólatra
alco_counts = df_cardio["alco"].value_counts().sort_index()
fig_cat.add_trace(go.Bar(x=["Não Alcoólatra", "Alcoólatra"], y=alco_counts.values, name="Álcool"), row=2, col=2)

# Atividade Física
active_counts = df_cardio["active"].value_counts().sort_index()
fig_cat.add_trace(go.Bar(x=["Não Ativo", "Ativo"], y=active_counts.values, name="Atividade Física"), row=2, col=3)

fig_cat.update_layout(height=800, title="Distribuições das Variáveis Categóricas")
fig_cat.show()

# =============================
# Distribuição da variável "cardio" (Doença cardiovascular)
# =============================
cardio_counts = df_cardio["cardio"].value_counts().sort_index()
cardio_labels = ["Sem Doença", "Com Doença"]

fig_cardio = go.Figure(data=[go.Pie(
    labels=cardio_labels,
    values=cardio_counts.values,
    hole=0.4,
    textinfo='label+percent'
)])
fig_cardio.update_layout(title="Distribuição de Diagnóstico Cardiovascular")
fig_cardio.show()

# =============================
# Heatmap de correlação
# =============================
plt.figure(figsize=(14, 10))
sns.heatmap(df_cardio.corr(), annot=True, cmap="RdYlGn", fmt=".2f")
plt.title("Matriz de Correlação")
plt.tight_layout()
plt.show()

# =============================
# Criação de modelo de ML
# =============================

del df_cardio["id"]

y = df_cardio["cardio"]
X = df_cardio.loc[:, df_cardio.columns != 'cardio']

# =============================
# Criação da floresta aleatoria
# E treinamento do modelo
# =============================

x_train, x_test, y_train, y_test = train_test_split(X, Y, test_size=0.33, random_state=42)

ml_model = RandomForestClassifier()
ml_model.fit(x_train, y_train)
RandomForestClassifier()

ml_model.predict(x_test.iloc[0].values.reshape(1, -1))
array([1])
y_test.iloc(0)
predictions = ml_model

