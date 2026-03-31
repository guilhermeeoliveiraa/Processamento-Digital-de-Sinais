# 🧪 Simulações Computacionais – Sinais Discretos em Python

---

# 🔧 1. Vibração em Máquinas Rotativas

📌 **Modelo avançado: vibração com múltiplos harmônicos, falhas mecânicas, ruído e análise espectral**

Nesta simulação, o sinal de vibração foi expandido para representar com maior fidelidade o comportamento de máquinas rotativas reais, incluindo:

* composição de **múltiplas frequências (harmônicos)**
* variação de amplitude ao longo do tempo (modulação)
* simulação de **falhas mecânicas** (impactos periódicos)
* presença de **ruído aleatório**
* cálculo de **energia do sinal**
* análise no **domínio da frequência (DFT manual)**
* visualização gráfica completa (tempo e frequência)

✔️ **Representa:**

* desbalanceamento (frequência fundamental)
* desalinhamento (harmônicos)
* desgaste mecânico e falhas em rolamentos (picos/impactos)
* ruído de medição em sensores reais

---

## 🧠 Interpretação

* A **frequência fundamental** está associada à rotação do eixo
* Os **harmônicos** indicam imperfeições mecânicas
* Os **picos abruptos** representam falhas (ex: rolamentos danificados)
* O **ruído** simula interferências reais de sensores
* A análise espectral permite identificar frequências dominantes

---

## 📈 Visualização

Os gráficos permitem:

* observar o sinal no tempo (com ruído e falhas)
* identificar padrões periódicos
* analisar o espectro de frequências (DFT)
* detectar possíveis problemas mecânicos

---

## 🚀 Aplicações práticas

* manutenção preditiva
* análise de vibração industrial
* diagnóstico de falhas mecânicas
* monitoramento de máquinas rotativas

---

# 🌡️ 2. Sensor Térmico Industrial

📌 **Modelo avançado: dinâmica térmica com ruído, perturbações e análise completa**

Nesta simulação, o sensor térmico foi modelado de forma mais realista, incluindo:

* resposta exponencial de aquecimento (modelo físico)
* **variação da temperatura ambiente**
* **perturbações externas** (ex: abertura de forno)
* **ruído de medição** (sensor real)
* cálculo da **taxa de variação da temperatura**
* aplicação de **filtro digital (média móvel)**
* análise comparativa entre sinal real e medido
* **visualização gráfica detalhada**

✔️ **Representa:**

* aquecimento de fornos industriais
* sensores térmicos (termopares, RTDs)
* sistemas de controle de temperatura
* aquisição de dados em sistemas embarcados

---

## 🧠 Interpretação

* O modelo exponencial descreve como sistemas térmicos evoluem ao longo do tempo
* O **ruído** representa imprecisões do sensor
* As **perturbações** simulam eventos reais (ex: perda de calor)
* A **derivada discreta** indica a velocidade de aquecimento
* O **filtro** melhora a qualidade da medição

---

## 📈 Visualização

Os gráficos permitem:

* comparar temperatura ideal vs medida
* observar efeitos de ruído e perturbações
* analisar a dinâmica térmica do sistema
* validar técnicas de filtragem

---

## 🚀 Aplicações práticas

* controle PID de temperatura
* sistemas embarcados industriais
* monitoramento térmico em tempo real
* automação de processos

---

# ⚡ 3. Sinais Elétricos Digitais

📌 **Modelo avançado: onda quadrada com ruído, atraso, jitter e análise de sinais digitais**

Nesta simulação, o sinal digital foi expandido para representar condições mais realistas de sistemas eletrônicos, incluindo:

* geração de **onda quadrada com duty cycle variável**
* simulação de **ruído digital (bit flip)**
* inclusão de **jitter temporal** (variação no tempo de transição)
* simulação de **atraso de propagação**
* cálculo da **taxa de bits (bit rate)**
* análise de **erros de transmissão**
* visualização gráfica do sinal

✔️ **Representa:**

* sinais de clock em sistemas digitais
* comunicação digital com interferência
* circuitos lógicos reais (não ideais)
* transmissão de dados binários

---

## 🧠 Interpretação

* A **onda quadrada** representa níveis lógicos (0 e 1)
* O **duty cycle** define o tempo em nível alto
* O **ruído digital** simula erros de transmissão
* O **jitter** representa variações no tempo de clock
* O **atraso** modela propagação em circuitos reais

---

## 📈 Visualização

Os gráficos permitem:

* observar o sinal ideal vs sinal com ruído
* identificar erros de bits
* analisar efeitos de jitter e atraso
* validar integridade do sinal digital

---

## 🚀 Aplicações práticas

* sistemas embarcados
* comunicação serial (UART, SPI, I2C)
* circuitos digitais
* redes de dados

---

# ⚙️ 4. Velocidade e Rotação de Eixos

📌 **Modelo avançado: encoder com velocidade variável, ruído e estimativa de velocidade**

Nesta simulação, o sinal de rotação é modelado de forma mais realista, considerando:

* variação de velocidade (aceleração/desaceleração)
* cálculo da posição angular ao longo do tempo
* geração de pulsos baseada em encoder
* presença de ruído (simulando interferência)
* estimativa da velocidade a partir dos pulsos
* visualização gráfica dos resultados

✔️ **Representa:**

* sensores de rotação industriais (encoders incrementais)
* sistemas de medição de velocidade angular
* controle de motores elétricos
* sistemas embarcados de aquisição de sinais

📊 **Saídas analisadas:**

* sinal de pulsos (digital)
* velocidade angular real (modelo físico)
* velocidade estimada (medição prática)

💡 **Importância prática:**

Esse tipo de modelagem é fundamental para sistemas reais, pois na prática:

* a velocidade não é constante
* existem ruídos e falhas de leitura
* a medição é feita indiretamente via pulsos
* algoritmos precisam estimar grandezas físicas a partir de sinais discretos

---

## 🧠 Interpretação

* O **encoder** converte movimento em pulsos digitais
* A **posição angular** é obtida integrando a velocidade
* A **velocidade estimada** é uma aproximação baseada nos pulsos detectados
* Diferenças entre velocidade real e estimada mostram limitações do sistema

---

## 📈 Visualização

A simulação inclui gráficos que permitem:

* observar o comportamento temporal do sinal
* comparar grandezas físicas vs. medidas digitais
* analisar efeitos de ruído no sistema

---

# 🤖 5. Sistema Embarcado (Sensor com Filtragem)

📌 **Modelo avançado: sinal com ruído + múltiplos filtros + análise estatística**

Nesta simulação, o sistema embarcado foi expandido para representar um cenário mais realista de aquisição e processamento de sinais, incluindo:

* geração de sinal com **ruído aleatório e variação lenta (drift)**
* aplicação de **múltiplos filtros digitais**

  * média móvel (suavização simples)
  * média móvel ponderada (resposta mais rápida)
* cálculo de **estatísticas do sinal**

  * média
  * variância
* comparação entre sinal original e filtrado
* **visualização gráfica completa**

✔️ **Representa:**

* leitura de sensores reais com imperfeições
* ruído eletrônico e interferências ambientais
* processamento em sistemas embarcados (microcontroladores)
* técnicas básicas de filtragem digital

---

## 🧠 Interpretação

* O sinal original contém:

  * valor base (grandeza física)
  * ruído (interferência)
  * drift (variação lenta)

* O filtro de **média móvel**:

  * reduz ruído
  * porém introduz atraso

* O filtro **ponderado**:

  * responde mais rápido a mudanças
  * mantém boa suavização

* A análise estatística permite avaliar:

  * qualidade do sinal
  * eficiência dos filtros

---

## 📈 Visualização

Os gráficos permitem:

* comparar sinal bruto vs filtrado
* observar redução de ruído
* analisar estabilidade do sistema
* validar algoritmos embarcados

---

## 🚀 Aplicação prática

Esse tipo de processamento é usado em:

* sensores de temperatura
* sensores industriais
* sistemas embarcados (ex: STM32)
* aquisição de dados em tempo real

---

# 📊 Interpretação dos Resultados

| Aplicação | Característica          |
| --------- | ----------------------- |
| Vibração  | Sinal senoidal + ruído  |
| Térmico   | Crescimento exponencial |
| Digital   | Níveis discretos (0/1)  |
| Rotação   | Pulsos periódicos       |
| Embarcado | Sinal filtrado          |

---

# ✔️ Conclusão

Essas simulações mostram como:

* fenômenos físicos → viram sinais discretos
* ruído está sempre presente em sistemas reais
* filtros são essenciais para melhorar a qualidade
* sistemas digitais processam sinais de forma eficiente

---