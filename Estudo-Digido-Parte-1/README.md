# 📡 Estudo Dirigido – Parte 1

## Modelagem de Sinais e Sistemas Discretos

Este repositório contém a implementação completa da atividade proposta na disciplina de **Processamento Digital de Sinais**, abordando desde os fundamentos teóricos até simulações computacionais e análise de resultados.

---

# 🎯 Objetivo Geral

O objetivo deste projeto é compreender como **fenômenos físicos reais podem ser representados como sinais discretos**, além de analisar como sistemas digitais processam essas informações.

A atividade integra:

* fundamentos matemáticos
* modelagem de sinais
* simulação computacional
* análise prática de sistemas reais

---

# 🧠 Abordagem do Projeto

O trabalho foi dividido em três partes principais:

* 📚 **Teoria** → conceitos fundamentais
* 💻 **Simulações** → modelagem computacional
* 📊 **Resultados** → análise e interpretação

Essa estrutura permite conectar diretamente a teoria com aplicações reais de engenharia.

---

# 📁 Estrutura do Repositório

## 📚 `/teoria`

Contém o arquivo:

* `README.md` com resumo teórico do que foi estudado

### ✔️ Conteúdo:

* definição de sinais contínuos e discretos
* sequências elementares (impulso, degrau, exponencial)
* operações com sinais
* energia e potência
* classificação de sistemas:

  * linearidade
  * causalidade
  * invariância no tempo
  * estabilidade (BIBO)
  * memória

📌 Essa seção fornece a base matemática necessária para entender todo o restante do projeto.

---

## 💻 `/simulacoes`

Contém:

* `README.md` com detalhes sobre as simulações
* códigos Python das simulações

### 🔧 Arquivos:

* `1-vibracao.py` → vibração em máquinas rotativas
* `2-sensor_termico.py` → comportamento térmico
* `3-sinal_eletrico.py` → sinais digitais
* `4-rotacao.py` → velocidade e rotação
* `5-sistema_embarcado.py` → filtragem de sinais

### ✔️ O que foi implementado:

Cada simulação inclui:

* geração de sinais discretos realistas
* presença de ruído
* modelagem física do fenômeno
* aplicação de técnicas de processamento
* geração de gráficos

📌 Os códigos foram desenvolvidos para representar situações reais de engenharia, como sensores industriais e sistemas embarcados.

---

## 📊 `/resultados`

Contém:

* gráficos gerados pelas simulações (`.png`)
* arquivo `README.md` com análise detalhada

### ✔️ Tipos de resultados:

* sinais no domínio do tempo
* análise no domínio da frequência
* comparação entre sinal ideal e real
* efeitos de ruído e filtragem
* estimativas de grandezas físicas

### 📌 Exemplos de gráficos:

* vibração (tempo e frequência)
* temperatura (real vs medida)
* sinais digitais (ideal vs com erro)
* rotação (real vs estimada)
* filtragem (antes e depois)

📌 Essa pasta representa a **validação prática** dos conceitos estudados.

---

# 🔬 Integração Teoria + Prática

O projeto demonstra que:

* sinais físicos podem ser modelados matematicamente
* sistemas digitais operam sobre versões discretas desses sinais
* ruídos e imperfeições são inevitáveis em sistemas reais
* técnicas de processamento (filtros, análise espectral) são essenciais

---

# 🚀 Aplicações em Engenharia

Os conceitos desenvolvidos são aplicáveis em:

* manutenção preditiva
* sistemas embarcados (ex: microcontroladores)
* automação industrial
* processamento de áudio e RF
* controle de motores e sensores

---

# 🧩 Problema Norteador

> Como representar matematicamente o comportamento temporal de um sensor real e quais propriedades estruturais devem ser analisadas para garantir o correto processamento digital desse sinal?

### ✔️ Resposta obtida:

* sensores reais podem ser modelados como sinais discretos com ruído
* é essencial analisar:

  * estabilidade
  * causalidade
  * linearidade
  * invariância no tempo

---

# ✅ Conclusão

Este projeto demonstra, de forma integrada, como:

* a teoria de sinais fundamenta a modelagem matemática
* simulações permitem validar conceitos
* a análise de resultados conecta teoria com aplicações reais

Assim, o estudante desenvolve não apenas conhecimento teórico, mas também **capacidade prática de análise e implementação**, essencial na engenharia moderna.

---

## 🎯 Resultados Esperados Alcançados

Ao final desta etapa, foi possível:

* ✔️ modelar sinais discretos;
* ✔️ identificar propriedades fundamentais de sistemas;
* ✔️ compreender a importância da estabilidade e causalidade;
* ✔️ interpretar sinais reais no contexto digital;
* ✔️ desenvolver raciocínio matemático aplicado ao processamento de sinais.

---

# 👨‍💻 Observação Final

Todos os códigos foram desenvolvidos com foco didático, como um estudo dirigido da disciplina de Processamento Digital de Sinais, evitando dependências complexas e priorizando clareza na implementação dos conceitos.

---