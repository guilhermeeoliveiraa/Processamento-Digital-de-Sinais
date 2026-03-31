# Resumo Teórico – Sinais e Sistemas Discretos

## 1. Sinais Contínuos e Discretos

Um **sinal** é uma função matemática que representa a variação de uma grandeza física ao longo do tempo, como temperatura, tensão elétrica ou velocidade.

* **Sinal contínuo**: definido para todos os instantes de tempo. É típico de fenômenos naturais.
  Ex: `x(t)`

* **Sinal discreto**: definido apenas em instantes específicos, geralmente obtidos por amostragem de um sinal contínuo.
  Ex: `x[n]`

A relação entre eles ocorre através da **amostragem**, processo essencial para digitalização de sinais:

```
x[n] = x(nT)
```

onde `T` é o período de amostragem. Quanto menor `T`, maior a fidelidade do sinal digital em relação ao original.

---

## 2. Sequências Elementares

As sequências elementares são fundamentais porque permitem representar sinais complexos por combinação.

### 🔹 Impulso discreto (delta de Kronecker)

```
δ[n] = 1, se n = 0
δ[n] = 0, se n ≠ 0
```

O impulso é usado para analisar sistemas, pois qualquer sinal pode ser decomposto como soma de impulsos.

---

### 🔹 Degrau unitário

```
u[n] = 1, se n ≥ 0
u[n] = 0, se n < 0
```

Representa o “ligar” de um sistema em determinado instante. Muito usado para modelar entradas abruptas.

---

### 🔹 Exponencial discreta

```
x[n] = a^n
```

Descreve crescimento ou decaimento ao longo do tempo. Muito comum em sistemas físicos e eletrônicos.

---

## 3. Operações com Sinais

Essas operações permitem manipular sinais para análise e processamento.

* **Deslocamento no tempo**

  * `x[n - n0]` → atraso (evento ocorre depois)
  * `x[n + n0]` → avanço (evento ocorre antes)

* **Inversão temporal**

  * `x[-n]` → espelha o sinal no eixo do tempo

* **Escalonamento de amplitude**

  * `a * x[n]` → altera a intensidade do sinal

Essas operações são amplamente usadas em filtragem e análise de sistemas.

---

## 4. Energia e Potência

Esses conceitos permitem classificar sinais quanto à sua intensidade ao longo do tempo.

### 🔹 Energia de um sinal

```
E = Σ |x[n]|²
```

Representa a quantidade total de “energia” acumulada. Sinais com energia finita geralmente são transitórios.

---

### 🔹 Potência média

```
P = lim (1 / (2N + 1)) Σ |x[n]|²
```

Indica a energia média por unidade de tempo. Sinais periódicos geralmente possuem potência finita.

* Sinal de **energia** → energia finita
* Sinal de **potência** → potência finita

---

## 5. Sistemas Discretos

Um sistema é um modelo matemático que transforma um sinal de entrada em um sinal de saída:

```
y[n] = T{x[n]}
```

Sistemas representam dispositivos reais, como filtros digitais, sensores ou controladores.

---

## 6. Classificação dos Sistemas

A classificação permite entender o comportamento do sistema e prever sua resposta.

### 🔹 6.1 Com ou sem memória

* **Sem memória**: a saída depende apenas do valor atual da entrada
  `y[n] = x[n]`

* **Com memória**: depende de valores passados ou futuros
  `y[n] = x[n-1]`

Sistemas reais quase sempre possuem memória.

---

### 🔹 6.2 Linearidade

Um sistema é linear se respeita o princípio da superposição:

```
T{a*x1[n] + b*x2[n]} = a*T{x1[n]} + b*T{x2[n]}
```

Isso significa que a resposta a várias entradas é a soma das respostas individuais.

---

### 🔹 6.3 Causalidade

* **Causal**: depende apenas do presente ou passado (implementável em tempo real)
* **Não causal**: depende do futuro (não realizável fisicamente em tempo real)

Exemplos:

```
y[n] = x[n-1]  → causal
y[n] = x[n+1]  → não causal
```

---

### 🔹 6.4 Invariância no Tempo

Um sistema é invariante no tempo se seu comportamento não muda com o tempo:

```
x[n - n0] → y[n - n0]
```

Ou seja, atrasar a entrada provoca o mesmo atraso na saída.

---

### 🔹 6.5 Estabilidade (BIBO)

BIBO significa *Bounded Input, Bounded Output*.

Sistema estável:

```
entrada limitada → saída limitada
```

Isso é essencial para evitar comportamentos explosivos em sistemas reais.

---

### 🔹 6.6 Invertibilidade

Um sistema é invertível se é possível recuperar a entrada original a partir da saída.

Isso é importante em aplicações como reconstrução de sinais.

---

## 7. Aplicações em Engenharia

Os conceitos de sinais e sistemas são amplamente utilizados em:

* sensores industriais (temperatura, vibração)
* sistemas embarcados
* processamento de áudio e rádio
* controle de motores e automação

Exemplo prático:

* sensor → gera sinal discreto
* sistema → processa (filtragem, amplificação)
* saída → sinal tratado para tomada de decisão

---

## 8. Problema Norteador

Um sensor real pode ser modelado como:

```
x[n] = A * sin(ωn) + ruído
```

Esse modelo combina:

* componente útil (senoide)
* ruído (interferência)

Para processar corretamente esse sinal, é necessário analisar:

* **causalidade** → funcionamento em tempo real
* **estabilidade** → evitar saídas divergentes
* **linearidade** → facilitar análise e projeto
* **invariância no tempo** → garantir consistência

---

## ✔️ Conclusão

A modelagem de sinais discretos permite representar fenômenos físicos no domínio digital de forma precisa.
A análise das propriedades dos sistemas garante que o processamento seja confiável, estável e aplicável em sistemas reais, sendo essencial para aplicações modernas em engenharia.
