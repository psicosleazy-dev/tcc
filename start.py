import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_excel("dadosabertos_graduacao_quantitativo-de-alunos.xlsx")
df.head()
df.info()
df.describe()

df.hist(figsize=(10, 8))
plt.show()

# Gráficos de dispersão entre pares de variáveis
sns.pairplot(df)
plt.show()

# Verifique e trate dados ausentes
print(df.isnull().sum())