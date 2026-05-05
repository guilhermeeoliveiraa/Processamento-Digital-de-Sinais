# Atividade 6 – Análise de Estabilidade e Causalidade

## Para cada sistema abaixo, discuta se ele é causal e se pode ser considerado estável. Justifique cada resposta com base nos conceitos estudados.

### a) y[n] = x[n] + x[n-1]

- **Causal:** ✔  
O sistema depende apenas do valor presente (x[n]) e passado (x[n-1]) da entrada, nunca de valores futuros.  

- **Estável:** ✔  
Se a entrada for limitada (|x[n]| ≤ M), então a saída será |y[n]| ≤ |x[n]| + |x[n-1]| ≤ 2M, ou seja, também limitada. Logo, é BIBO estável.

---

### b) y[n] = x[n+1]

- **Causal:** ✘  
O sistema depende de um valor futuro da entrada (x[n+1]), o que viola a definição de causalidade.  

- **Estável:** ✔  
Se a entrada for limitada, a saída também será, pois apenas desloca o sinal no tempo. Não há amplificação.

---

### c) h[n] = (0.5)^n · u[n]

- **Causal:** ✔  
A presença de u[n] (degrau unitário) garante que h[n] = 0 para n < 0, ou seja, o sistema não depende do futuro.  

- **Estável:** ✔  
A soma dos valores absolutos da resposta ao impulso é finita:
Σ |h[n]| = Σ (0.5)^n → converge (série geométrica).  
Logo, o sistema é BIBO estável.

---

### d) h[n] = 2^n · u[n]

- **Causal:** ✔  
Novamente, u[n] garante que o sistema só depende de valores presentes e passados.  

- **Estável:** ✘  
A soma dos valores absolutos diverge:
Σ |h[n]| = Σ 2^n → cresce sem limite.  
Logo, o sistema não é BIBO estável, pois a saída pode crescer indefinidamente mesmo com entrada limitada.