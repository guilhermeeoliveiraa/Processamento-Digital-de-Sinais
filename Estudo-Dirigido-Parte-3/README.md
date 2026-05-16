# 📡 Estudo Dirigido - Parte 3

## Análise no Domínio da Frequência

## 🎯 Objetivo

Desenvolver a compreensão da análise espectral de sinais discretos por meio de simulações computacionais, explorando a relação entre o domínio do tempo e o domínio da frequência. Utilizar a FFT para identificar componentes espectrais, interpretar frequências dominantes e analisar fenômenos como aliasing, janelamento, resolução espectral e influência do ruído, conectando os conceitos teóricos com aplicações práticas em engenharia.

---

## 📁 Estrutura do Repositório

### 📂 `/teoria`

Contém:

* `README.md`

#### ✔️ Conteúdo:

* conceitos de domínio do tempo e da frequência  
* Transformada de Fourier (DTFT e DFT)  
* algoritmo FFT e sua importância  
* Transformada-Z e estabilidade de sistemas  
* fenômeno de aliasing  
* conceito de janelamento e vazamento espectral  

📌 Base teórica necessária para interpretação dos resultados experimentais.

---

### 📂 `/simulacoes`

Contém:

* `questao-01.m` até `questao-10.m`
* `README.md`

#### ✔️ Conteúdo:

* geração de sinais discretos  
* análise no domínio do tempo  
* cálculo e interpretação da FFT  
* identificação de frequências dominantes  
* análise de múltiplas componentes espectrais  
* simulação de aliasing  
* aplicação de janelas (Hamming/Hann)  
* sinais com ruído  
* implementação manual da DFT  
* análise de sistemas discretos  

📌 Desenvolvimento prático das questões propostas.

---

### 📂 `/resultados`

Contém:

* gráficos gerados nas simulações  
* `README.md` com análises

#### ✔️ Conteúdo:

* interpretação dos espectros obtidos  
* comparação entre sinais no tempo e na frequência  
* análise dos efeitos de aliasing e janelamento  
* influência do número de amostras na resolução espectral  
* identificação de frequências e harmônicos  
* impacto do ruído na análise  

📌 Consolidação dos resultados e conexão entre teoria e prática.

---

## 🛠 Ferramenta

Simulações realizadas no Octave.