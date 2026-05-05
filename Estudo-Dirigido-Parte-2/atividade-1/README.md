# Atividade 1 – Interpretação Conceitual

### 1) O que significa afirmar que um sistema é linear e invariante no tempo?

Um sistema é **linear** quando satisfaz o princípio da superposição, que inclui:

**Aditividade**

```
x1[n] → y1[n]
x2[n] → y2[n]

x1[n] + x2[n] → y1[n] + y2[n]
```

**Homogeneidade**

```
x[n] → y[n]

a * x[n] → a * y[n]
```

Um sistema é **invariante no tempo** quando um deslocamento na entrada provoca o mesmo deslocamento na saída.

```
x[n] → y[n]

x[n-n0] → y[n-n0]
```

Isso significa que o comportamento do sistema **não muda ao longo do tempo**.

---

### 2) Por que a resposta ao impulso caracteriza completamente um sistema LTI?

Qualquer sinal discreto pode ser representado como uma soma de impulsos deslocados:

```
    x[n] = Σ (x[k] * δ[n-k])
```

Se conhecemos a resposta do sistema ao impulso `δ[n]`, então sabemos como o sistema responde a qualquer sinal.

Logo:

```
y[n] = x[n] * h[n]
```

---

### 3) Qual o significado físico da convolução?

A convolução representa a forma como o sistema **combina valores passados da entrada para produzir a saída**.

Cada amostra da entrada gera uma resposta do sistema, e todas essas respostas são somadas.

```
y[n] = Σ (x[k] * h[n-k])
```

Fisicamente isso representa o efeito da **memória do sistema**.

---

### 4) Qual o significado físico da convolução em sistemas discretos?

**Resposta transitória**

- ocorre logo após a aplicação da entrada
- depende das condições iniciais
- comportamento temporário

**Regime permanente**

- ocorre após o desaparecimento do transitório
- comportamento mais estável do sistema

---

### 5) O que se entende por sistema causal?

Um sistema é **causal** quando a saída depende apenas de:

```
x[n], x[n-1], x[n-2], ...
```

Ou seja, não depende de valores futuros.

---

### 6) O que se entende por sistema estável?

Um sistema é estável quando **entradas limitadas produzem saídas limitadas**.

Para sistemas LTI:

```
Σ |h[n]| < ∞
```