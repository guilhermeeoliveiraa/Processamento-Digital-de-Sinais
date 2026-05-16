# Resumo Teórico – Análise Espectral de Sinais Discretos

## 1. Domínio do Tempo e Domínio da Frequência

Um sinal discreto pode ser analisado de duas formas complementares:

* **Domínio do tempo**: mostra como o sinal varia ao longo das amostras  
  Ex: `x[n]`

* **Domínio da frequência**: mostra quais frequências compõem o sinal e suas intensidades  

Enquanto o domínio do tempo descreve o comportamento temporal, o domínio da frequência revela a **estrutura espectral** do sinal, permitindo identificar componentes como frequências dominantes, harmônicos e ruído.

---

## 2. Transformada de Fourier em Tempo Discreto (DTFT)

A DTFT é uma ferramenta que permite representar um sinal discreto como uma função contínua da frequência:

```
X(e^{jω}) = Σ x[n] e^{-jωn}
```

Ela fornece uma descrição completa do conteúdo espectral do sinal.

Características importantes:

* Representação **contínua em frequência**
* Periodicidade de `2π`
* Fundamental para análise teórica de sistemas

A DTFT é amplamente utilizada para entender como sinais e sistemas se comportam no domínio da frequência.

---

## 3. Transformada Discreta de Fourier (DFT)

A DFT é a versão discreta da DTFT, utilizada em aplicações computacionais:

```
X[k] = Σ x[n] e^{-j2πkn/N}
```

onde:
* `N` é o número de amostras
* `k` representa os índices de frequência

Características:

* Representação **discreta em frequência**
* Permite análise numérica de sinais
* Base para processamento digital

A DFT é utilizada em praticamente todas as aplicações de análise espectral.

---

## 4. FFT (Fast Fourier Transform)

A FFT é um algoritmo eficiente para calcular a DFT.

* Reduz o custo computacional de:
  * `O(N²)` → DFT direta  
  * para `O(N log N)` → FFT  

Isso torna possível:

* processamento em tempo real  
* análise de sinais em sistemas embarcados  
* aplicações em áudio, telecomunicações e instrumentação  

A FFT é uma das ferramentas mais importantes do processamento digital de sinais.

---

## 5. Interpretação Espectral

O espectro de um sinal mostra:

* quais frequências estão presentes  
* a intensidade de cada componente  

Para sinais reais:

* o espectro é **simétrico**
* aparecem componentes em:
  * frequência positiva
  * frequência negativa (espelhada)

Exemplo:

Uma senoide:

```
x[n] = sin(2πf0 n)
```

gera picos em:

* `+f0`
* `-f0` (ou `1 - f0` na DFT)

---

## 6. Transformada-Z

A Transformada-Z é uma generalização da Transformada de Fourier:

```
X(z) = Σ x[n] z^{-n}
```

Ela permite:

* analisar sistemas no plano complexo  
* estudar estabilidade  
* determinar causalidade  
* analisar resposta de sistemas  

---

### 🔹 Estabilidade (BIBO)

Um sistema é estável se:
entrada limitada → saída limitada


Na Transformada-Z, isso depende da **região de convergência (ROC)**.

---

## 7. Aliasing

O aliasing ocorre quando a taxa de amostragem é insuficiente para representar corretamente o sinal.

Condição fundamental:
```
fs ≥ 2fmax
```

Se não for respeitada:

* frequências se sobrepõem  
* ocorre distorção irreversível  
* o espectro fica incorreto  

---

### 🔹 Interpretação Física

Frequências altas “se disfarçam” como frequências mais baixas.

Isso compromete totalmente a análise do sinal.

---

## 8. Janelamento

Na prática, analisamos sinais de duração finita.

Isso causa:

* descontinuidades no sinal  
* vazamento espectral  

O janelamento consiste em multiplicar o sinal por uma função janela:

Exemplos:

* janela de Hamming  
* janela de Hann  

---

### 🔹 Efeito do Janelamento

* reduz vazamento espectral  
* melhora visualização do espectro  
* altera largura dos picos  

---

## 9. Resolução Espectral

A capacidade de distinguir frequências próximas depende do número de amostras:

```
Δf = 1 / N
```

* maior `N` → melhor resolução  
* menor `N` → espectro mais “grosseiro”  

---

## 10. Aplicações em Engenharia

A análise espectral é usada em:

* análise de vibração em máquinas  
* processamento de áudio  
* telecomunicações  
* diagnóstico de falhas  
* sistemas embarcados  

Exemplo:

* máquina vibrando → gera sinal  
* FFT → identifica frequências  
* análise → detecta falhas mecânicas  

---

## 11. Problema Norteador

Um sinal real pode ser representado como:

```
x[n] = componente útil + ruído
```

A análise espectral permite:

* identificar frequências relevantes  
* separar sinal de ruído  
* entender o comportamento do sistema  

---

## ✔️ Conclusão

A análise no domínio da frequência permite compreender como a informação de um sinal está distribuída entre diferentes componentes espectrais.

Ferramentas como DTFT, DFT e FFT tornam possível analisar sinais de forma eficiente, enquanto conceitos como aliasing e janelamento são fundamentais para garantir resultados corretos.

Esses conhecimentos são essenciais para aplicações modernas em engenharia, especialmente em sistemas que dependem da identificação e interpretação de frequências.