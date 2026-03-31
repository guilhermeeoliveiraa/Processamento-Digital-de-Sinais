import random
import math
import matplotlib.pyplot as plt

# =========================
# Parâmetros
# =========================
N = 200
fs = 50
T = 1 / fs

# =========================
# Geração do sinal
# =========================
sinal = []
tempo = []

for n in range(N):
    t = n * T
    tempo.append(t)
    
    # Sinal base (lento)
    base = 10 + 2 * math.sin(0.1 * n)
    
    # Drift (variação lenta)
    drift = 0.01 * n
    
    # Ruído
    ruido = random.uniform(-2, 2)
    
    valor = base + drift + ruido
    sinal.append(valor)

# =========================
# Filtro média móvel
# =========================
filtrado_mm = []
janela = 5

for n in range(N):
    soma = 0
    count = 0
    
    for k in range(janela):
        if n - k >= 0:
            soma += sinal[n - k]
            count += 1
    
    filtrado_mm.append(soma / count)

# =========================
# Filtro média móvel ponderada
# =========================
filtrado_mp = []

pesos = [1, 2, 3, 4, 5]  # mais peso para amostras recentes

for n in range(N):
    soma = 0
    soma_pesos = 0
    
    for k in range(len(pesos)):
        if n - k >= 0:
            soma += sinal[n - k] * pesos[k]
            soma_pesos += pesos[k]
    
    filtrado_mp.append(soma / soma_pesos)

# =========================
# Estatísticas
# =========================
def media(v):
    return sum(v) / len(v)

def variancia(v):
    m = media(v)
    return sum((x - m) ** 2 for x in v) / len(v)

print("Média sinal original:", media(sinal))
print("Variância sinal original:", variancia(sinal))

print("Média filtrado MM:", media(filtrado_mm))
print("Variância filtrado MM:", variancia(filtrado_mm))

print("Média filtrado MP:", media(filtrado_mp))
print("Variância filtrado MP:", variancia(filtrado_mp))

# =========================
# GRÁFICOS
# =========================

plt.figure()
plt.title("Sinal Original")
plt.plot(tempo, sinal)
plt.xlabel("Tempo (s)")
plt.ylabel("Amplitude")
plt.grid()
plt.savefig("Estudo-Digido-Parte-1/resultados/embarcado_original.png")

plt.figure()
plt.title("Filtro Média Móvel")
plt.plot(tempo, sinal, linestyle='dashed')
plt.plot(tempo, filtrado_mm)
plt.xlabel("Tempo (s)")
plt.ylabel("Amplitude")
plt.grid()
plt.savefig("Estudo-Digido-Parte-1/resultados/embarcado_mm.png")

plt.figure()
plt.title("Filtro Média Móvel Ponderada")
plt.plot(tempo, sinal, linestyle='dashed')
plt.plot(tempo, filtrado_mp)
plt.xlabel("Tempo (s)")
plt.ylabel("Amplitude")
plt.grid()
plt.savefig("Estudo-Digido-Parte-1/resultados/embarcado_mp.png")

plt.show()