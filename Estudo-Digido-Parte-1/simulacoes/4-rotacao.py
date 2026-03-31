import math
import random
import matplotlib.pyplot as plt

# =========================
# Parâmetros do sistema
# =========================
N = 200
fs = 100
T = 1 / fs

pulsos_por_volta = 20

sinal = []
tempo = []
velocidade = []

theta = 0

# =========================
# Simulação
# =========================
for n in range(N):
    t = n * T
    tempo.append(t)
    
    # Velocidade variável
    w = 2 * math.pi * (1 + 0.5 * math.sin(0.1 * n))
    velocidade.append(w)
    
    # Integra posição angular
    theta += w * T
    
    # Encoder (geração de pulsos)
    pulso = 0
    if int((theta / (2 * math.pi)) * pulsos_por_volta) % pulsos_por_volta == 0:
        pulso = 1
    
    # Ruído
    ruido = random.choice([0, 0, 0, 1])
    
    sinal.append(pulso + ruido)

# =========================
# Estimativa de velocidade
# =========================
vel_estimada = [0] * N

for n in range(1, N):
    if sinal[n] == 1:
        vel_estimada[n] = fs / pulsos_por_volta

# =========================
# Gráficos
# =========================
plt.figure()
plt.title("Sinal de Pulsos (Encoder)")
plt.plot(tempo, sinal)
plt.xlabel("Tempo (s)")
plt.ylabel("Pulso")
plt.grid()
plt.savefig("Estudo-Digido-Parte-1/resultados/rotacao_pulsos.png")

plt.figure()
plt.title("Velocidade Angular Real")
plt.plot(tempo, velocidade)
plt.xlabel("Tempo (s)")
plt.ylabel("rad/s")
plt.grid()
plt.savefig("Estudo-Digido-Parte-1/resultados/rotacao_real.png")

plt.figure()
plt.title("Velocidade Estimada")
plt.plot(tempo, vel_estimada)
plt.xlabel("Tempo (s)")
plt.ylabel("rad/s")
plt.grid()
plt.savefig("Estudo-Digido-Parte-1/resultados/rotacao_estimada.png")

plt.show()