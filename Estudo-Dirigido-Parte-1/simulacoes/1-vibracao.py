import math
import random
import matplotlib.pyplot as plt

# =========================
# Parâmetros do sinal
# =========================
A = 1.0
f1 = 5          # frequência fundamental
f2 = 10         # harmônico
T = 0.01
N = 300

tempo = []
sinal = []

# =========================
# Geração do sinal
# =========================
for n in range(N):
    t = n * T
    tempo.append(t)
    
    # Fundamental
    vib1 = A * math.sin(2 * math.pi * f1 * t)
    
    # Harmônico (desalinhamento)
    vib2 = 0.5 * math.sin(2 * math.pi * f2 * t)
    
    # Modulação de amplitude (variação mecânica)
    mod = (1 + 0.3 * math.sin(0.5 * t))
    
    # Ruído
    ruido = random.uniform(-0.3, 0.3)
    
    # Falhas (impactos)
    falha = 0
    if n % 50 == 0:
        falha = random.uniform(1, 2)
    
    x = mod * (vib1 + vib2) + ruido + falha
    sinal.append(x)

# =========================
# Energia do sinal
# =========================
energia = sum(x**2 for x in sinal)

print("Energia do sinal:", energia)

# =========================
# DFT (Transformada Discreta de Fourier manual)
# =========================
frequencias = []
espectro = []

for k in range(N // 2):
    real = 0
    imag = 0
    
    for n in range(N):
        angle = 2 * math.pi * k * n / N
        real += sinal[n] * math.cos(angle)
        imag -= sinal[n] * math.sin(angle)
    
    magnitude = math.sqrt(real**2 + imag**2)
    espectro.append(magnitude)
    frequencias.append(k / (N * T))

# =========================
# GRÁFICOS
# =========================

plt.figure()
plt.title("Sinal de Vibração no Tempo")
plt.plot(tempo, sinal)
plt.xlabel("Tempo (s)")
plt.ylabel("Amplitude")
plt.grid()
plt.savefig("Estudo-Digido-Parte-1/resultados/vibracao_tempo.png")

plt.figure()
plt.title("Espectro de Frequência (DFT)")
plt.plot(frequencias, espectro)
plt.xlabel("Frequência (Hz)")
plt.ylabel("Magnitude")
plt.grid()
plt.savefig("Estudo-Digido-Parte-1/resultados/vibracao_fft.png")

plt.show()

# =========================
# Saída parcial
# =========================
print("Primeiras amostras:", sinal[:10])