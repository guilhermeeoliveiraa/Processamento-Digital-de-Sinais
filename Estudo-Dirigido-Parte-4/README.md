# 📡 Estudo Dirigido – Parte 4

## Filtros Digitais

## 🎯 Objetivo Geral

O objetivo deste projeto é compreender os princípios de funcionamento dos **filtros digitais**, analisando como sistemas discretos podem modificar seletivamente componentes espectrais presentes em sinais reais.

A atividade integra:

* fundamentos de Processamento Digital de Sinais (PDS)
* análise de sistemas discretos
* projeto de filtros digitais
* simulação computacional
* aplicações práticas em engenharia

---

## 🧠 Abordagem do Projeto

O trabalho foi dividido em três partes principais:

* 📚 **Teoria** → conceitos fundamentais sobre filtros digitais
* 💻 **Simulações** → implementação e análise computacional
* 📊 **Resultados** → interpretação dos efeitos da filtragem

Essa estrutura permite compreender tanto os fundamentos matemáticos quanto as aplicações práticas da filtragem digital.

---

## 📁 Estrutura do Repositório

### 📚 `/teoria`

Contém:

* `README.md` com o embasamento teórico utilizado no estudo.

#### ✔️ Conteúdo

* conceitos de filtros digitais
* filtros FIR (Finite Impulse Response)
* filtros IIR (Infinite Impulse Response)
* resposta ao impulso
* resposta em frequência
* resposta de fase
* atraso de grupo
* polos e zeros
* estabilidade de sistemas discretos
* aplicações práticas de filtragem digital

📌 Esta seção apresenta os fundamentos necessários para compreender o projeto, a análise e a implementação dos filtros digitais utilizados nas simulações.

---

### 💻 `/simulacoes`

Contém os códigos-fonte desenvolvidos em GNU Octave para resolução das atividades propostas.

#### 🔧 Arquivos

* `questao-01.m` → filtro passa-baixa aplicado a um sinal composto por duas senoides
* `questao-02.m` → remoção de ruído branco utilizando filtro FIR
* `questao-03.m` → remoção de ruído utilizando filtro IIR Butterworth e comparação com FIR
* `questao-04.m` → comparação das respostas em frequência de filtros FIR e IIR
* `questao-05.m` → representação de polos e zeros de um filtro IIR e análise de estabilidade
* `questao-06.m` → análise e comparação das respostas ao impulso de filtros FIR e IIR
* `questao-07.m` → projeto de filtro passa-faixa para seleção de frequência específica
* `questao-08.m` → comparação da resposta de fase entre filtros FIR e IIR
* `questao-09.m` → cálculo e comparação do atraso de grupo em diferentes filtros digitais
* `questao-10.m` → aplicação prática de filtragem digital para remoção de ruído em sinais de sensores
* `problema-norteador.m` → solução do problema proposto envolvendo monitoramento agrícola e filtragem digital

#### ✔️ O que foi implementado

Cada simulação contempla, quando aplicável:

* geração de sinais discretos
* adição de ruídos e interferências
* projeto de filtros FIR e IIR
* análise temporal dos sinais
* análise espectral por meio da FFT
* cálculo de resposta em frequência
* análise de fase e atraso de grupo
* estudo de polos, zeros e estabilidade
* geração automática de gráficos

📌 Os códigos foram desenvolvidos para reproduzir situações encontradas em sistemas reais de comunicação, instrumentação, monitoramento e processamento digital de sinais.

---

### 📊 `/resultados`

Contém:

* `README.md` com a discussão dos resultados obtidos
* pasta `graficos/` contendo todas as figuras geradas pelas simulações

#### ✔️ Tipos de resultados apresentados

* sinais originais e filtrados
* espectros de frequência
* respostas em frequência
* respostas ao impulso
* respostas de fase
* diagramas de polos e zeros
* comparação entre filtros FIR e IIR
* análise de estabilidade
* comparação de atraso de grupo
* aplicações práticas de filtragem digital

📌 Esta pasta reúne as evidências experimentais que validam os conceitos teóricos estudados e demonstram o comportamento dos filtros digitais em diferentes cenários de aplicação.

---

## 🔬 Integração Teoria + Prática

O projeto demonstra que:

* filtros digitais podem modificar seletivamente componentes espectrais dos sinais;
* filtros FIR e IIR apresentam características distintas;
* a resposta em frequência determina quais frequências serão atenuadas ou preservadas;
* a resposta de fase influencia a forma temporal dos sinais;
* estabilidade e custo computacional são fatores fundamentais no projeto de filtros.

---

## 🚀 Aplicações em Engenharia

Os conceitos desenvolvidos são aplicáveis em:

* processamento de áudio
* telecomunicações digitais
* sistemas embarcados
* monitoramento de vibrações mecânicas
* instrumentação eletrônica
* condicionamento de sinais industriais
* redução de ruído em sensores
* pré-processamento para TinyML e Inteligência Artificial embarcada

---

## 🧩 Problema Norteador

> Como projetar e validar filtros digitais capazes de reduzir os ruídos presentes nos sinais sem comprometer as informações relevantes necessárias para a tomada de decisão?

#### ✔️ Resposta obtida:

* filtros digitais permitem reduzir interferências e ruídos de forma seletiva;
* a escolha entre FIR e IIR depende dos requisitos da aplicação;
* a estabilidade do sistema deve ser garantida;
* respostas em frequência e fase devem ser analisadas para preservar informações importantes;
* o desempenho do filtro deve ser validado por meio de simulações e análise espectral.

---

## 📖 Fundamentação Teórica

Os filtros digitais podem ser modelados como sistemas lineares invariantes no tempo (LTI), capazes de alterar o conteúdo espectral de sinais discretos.

Os filtros FIR apresentam:

* resposta ao impulso finita;
* estabilidade inerente;
* possibilidade de fase linear exata;
* maior custo computacional para alta seletividade.

Os filtros IIR apresentam:

* resposta ao impulso infinita;
* utilização de realimentação;
* maior eficiência computacional;
* necessidade de análise cuidadosa da estabilidade.

A avaliação desses sistemas é realizada por meio de:

* resposta em frequência;
* resposta de fase;
* atraso de grupo;
* localização de polos e zeros.

---

## ✅ Conclusão

Este projeto demonstra, de forma integrada, como:

* os filtros digitais são fundamentais no processamento moderno de sinais;
* a análise em frequência permite compreender o comportamento espectral dos sistemas;
* filtros FIR e IIR apresentam vantagens e limitações específicas;
* simulações computacionais auxiliam na validação dos conceitos estudados;
* técnicas de filtragem são indispensáveis em aplicações reais de engenharia.

Assim, o estudante desenvolve competências teóricas e práticas relacionadas ao projeto, implementação e avaliação de filtros digitais, habilidades essenciais para áreas como telecomunicações, automação, sistemas embarcados e processamento digital de sinais.

---

### 🎯 Resultados Esperados Alcançados

Ao final desta etapa, foi possível:

* ✔️ compreender os princípios de funcionamento dos filtros digitais;
* ✔️ diferenciar filtros FIR e IIR;
* ✔️ interpretar respostas em frequência e fase;
* ✔️ analisar estabilidade por meio de polos e zeros;
* ✔️ avaliar o atraso de grupo em diferentes filtros;
* ✔️ aplicar técnicas de filtragem em sinais reais;
* ✔️ relacionar teoria e prática em problemas de engenharia.