import math
import random
import matplotlib.pyplot as plt

# =========================
# Parâmetros
# =========================
T0 = 25        # temperatura inicial
Tf = 100       # temperatura alvo
k = 0.05       # constante térmica
N = 200
fs = 1         # 1 amostra por segundo

temperatura_real = []
temperatura_medida = []
tempo = []

# =========================
# Simulação do sistema térmico
# =========================
for n in range(N):
    t = n / fs
    tempo.append(t)
    
    # Variação ambiente (lenta)
    ambiente = 25 + 2 * math.sin(0.05 * n)
    
    # Modelo exponencial
    Tn = Tf - (Tf - ambiente) * math.exp(-k * n)
    
    # Perturbação externa (ex: abrir forno)
    if 80 < n < 100:
        Tn -= 10
    
    temperatura_real.append(Tn)
    
    # Ruído do sensor
    ruido = random.uniform(-1.5, 1.5)
    temperatura_medida.append(Tn + ruido)

# =========================
# Derivada discreta (taxa de variação)
# =========================
derivada = [0]

for n in range(1, N):
    dT = (temperatura_real[n] - temperatura_real[n-1]) * fs
    derivada.append(dT)

# =========================
# Filtro média móvel
# =========================
filtrado = []
janela = 5

for n in range(N):
    soma = 0
    count = 0
    
    for k in range(janela):
        if n - k >= 0:
            soma += temperatura_medida[n - k]
            count += 1
    
    filtrado.append(soma / count)

# =========================
# GRÁFICOS
# =========================

plt.figure()
plt.title("Temperatura Real vs Medida")
plt.plot(tempo, temperatura_real)
plt.plot(tempo, temperatura_medida)
plt.xlabel("Tempo (s)")
plt.ylabel("Temperatura (°C)")
plt.grid()
plt.savefig("Estudo-Digido-Parte-1/resultados/termico_real_vs_medido.png")

plt.figure()
plt.title("Temperatura Filtrada")
plt.plot(tempo, temperatura_medida, linestyle='dashed')
plt.plot(tempo, filtrado)
plt.xlabel("Tempo (s)")
plt.ylabel("Temperatura (°C)")
plt.grid()
plt.savefig("Estudo-Digido-Parte-1/resultados/termico_filtrado.png")

plt.figure()
plt.title("Taxa de Variação da Temperatura")
plt.plot(tempo, derivada)
plt.xlabel("Tempo (s)")
plt.ylabel("°C/s")
plt.grid()
plt.savefig("Estudo-Digido-Parte-1/resultados/termico_derivada.png")

plt.show()

# =========================
# Saída parcial
# =========================
print("Temperatura real:", temperatura_real[:10])
print("Temperatura medida:", temperatura_medida[:10])
print("Temperatura filtrada:", filtrado[:10])