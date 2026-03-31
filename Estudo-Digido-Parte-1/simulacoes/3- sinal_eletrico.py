import random
import matplotlib.pyplot as plt

# =========================
# Parâmetros
# =========================
N = 100
periodo = 20
duty_cycle = 0.6   # porcentagem do tempo em nível alto

# =========================
# Sinal ideal
# =========================
tempo = list(range(N))
sinal_ideal = []

for n in range(N):
    if (n % periodo) < (periodo * duty_cycle):
        sinal_ideal.append(1)
    else:
        sinal_ideal.append(0)

# =========================
# Ruído digital (bit flip)
# =========================
sinal_ruidoso = []

for bit in sinal_ideal:
    if random.random() < 0.05:  # 5% chance de erro
        sinal_ruidoso.append(1 - bit)
    else:
        sinal_ruidoso.append(bit)

# =========================
# Jitter (deslocamento de transição)
# =========================
sinal_jitter = sinal_ruidoso.copy()

for i in range(1, N-1):
    if sinal_ruidoso[i] != sinal_ruidoso[i-1]:
        if random.random() < 0.3:
            sinal_jitter[i] = sinal_ruidoso[i-1]

# =========================
# Atraso de propagação
# =========================
delay = 2
sinal_atrasado = [0]*delay + sinal_jitter[:-delay]

# =========================
# Taxa de bits
# =========================
bit_rate = 1 / periodo
print("Bit rate:", bit_rate)

# =========================
# Taxa de erro
# =========================
erros = 0
for i in range(N):
    if sinal_ideal[i] != sinal_atrasado[i]:
        erros += 1

print("Taxa de erro:", erros / N)

# =========================
# GRÁFICOS
# =========================

# ⚡ 3. Sinais Elétricos Digitais
plt.figure()
plt.title("Sinal Digital Ideal")
plt.step(tempo, sinal_ideal, where='post')
plt.ylim(-0.5, 1.5)
plt.grid()
plt.savefig("Estudo-Digido-Parte-1/resultados/digital_ideal.png")

plt.figure()
plt.title("Sinal com Ruído e Jitter")
plt.step(tempo, sinal_jitter, where='post')
plt.ylim(-0.5, 1.5)
plt.grid()
plt.savefig("Estudo-Digido-Parte-1/resultados/digital_ruido.png")

plt.figure()
plt.title("Sinal com Atraso")
plt.step(tempo, sinal_atrasado, where='post')
plt.ylim(-0.5, 1.5)
plt.grid()
plt.savefig("Estudo-Digido-Parte-1/resultados/digital_atraso.png")

plt.show()

# =========================
# Saída parcial
# =========================
print("Ideal:", sinal_ideal[:20])
print("Atrasado:", sinal_atrasado[:20])