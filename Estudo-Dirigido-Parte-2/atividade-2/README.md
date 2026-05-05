# Atividade 2 – Cálculo Manual de Convolução

Dados:

```
x[n] = {1, 2, 1}
h[n] = {1, 1}
```

Tamanho da convolução:

```
Ny = Nx + Nh − 1
Ny = 3 + 2 − 1 = 4
```

---

## 1) Calcule manualmente a convolução y[n] = x[n] ∗ h[n].

### n = 0

```
y[0] = 1×1 = 1
```

### n = 1

```
y[1] = 2×1 + 1×1 = 3
```

### n = 2

```
y[2] = 1×1 + 2×1 = 3
```

### n = 3

```
y[3] = 1×1 = 1
```

---

## 2) Apresente o resultado em forma de sequência.

```
y[n] = {1, 3, 3, 1}
```

---

## 3) Explique o significado do resultado obtido.

O sistema soma duas amostras consecutivas da entrada:

```
y[n] = x[n] + x[n-1]
```

Isso gera um efeito de **suavização do sinal**.