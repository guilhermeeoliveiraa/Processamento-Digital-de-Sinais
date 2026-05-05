# Atividade 3 – Sistema descrito por Equação de Diferenças

Considere o sistema:

```
y[n] = 0.8 * y[n−1] + x[n]
```

admitindo condição inicial nula e entrada impulso:

```
x[n] = δ[n]
```

---

## 1) Determine os primeiros valores de h[n] para 0 ≤ n ≤ 5.

```
h[0] = 1
h[1] = 0.8
h[2] = 0.64
h[3] = 0.512
h[4] = 0.4096
h[5] = 0.32768
```

---

## 2) A partir da resposta ao impulso obtida, discuta se o sistema parece ser estável

### Resposta ao impulso

```
h[n] = {1, 0.8, 0.64, 0.512, 0.4096, 0.32768}
```

### Estabilidade

Como:

```
|0.8| < 1
```

a resposta decai exponencialmente.

Portanto o sistema é **estável**.

---

## 3) Verifique se o sistema é causal.

O sistema depende apenas de:

```
y[n-1] e x[n]
```

Logo ele é **causal**.