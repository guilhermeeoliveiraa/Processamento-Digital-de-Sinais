# 🧪 Questões para Simulação em SciLab/MatLab

#### 1. Gere uma senoide discreta de frequência normalizada f0 = 0,1 e comprimento N = 128. Represente o sinal no domínio do tempo e calcule seu espectro utilizando a FFT. Identifique, no gráfico, a frequência dominante observada.

#### 2. Gere duas senoides de frequências distintas e some os sinais obtidos. Em seguida, calcule a FFT do sinal resultante e verifique se o espectro permite distinguir corretamente as duas componentes em frequência. Discuta a relação entre o domínio do tempo e o domínio da frequência.

#### 3. Considere um sinal senoidal com frequência elevada e reduza a taxa de amostragem utilizada em sua geração. Compare os espectros obtidos antes e depois da redução da taxa de amostragem. Explique o fenômeno de aliasing observado.

#### 4. Gere um sinal discreto finito e calcule sua FFT sem aplicação de janela. Em seguida, aplique uma janela de Hamming ou Hann ao mesmo sinal e recalcule o espectro. Compare os resultados e discuta o efeito do janelamento sobre o vazamento espectral.

#### 5. Considere um sinal composto por uma senoide e ruído aditivo. Gere o sinal, calcule sua FFT e analise a dificuldade de identificar a frequência principal na presença do ruído. Discuta como a análise espectral pode auxiliar na separação entre componente útil e perturbações.

#### 6. Implemente a DFT de forma direta, utilizando a definição matemática, para um sinal curto com poucas amostras. Em seguida, compare o resultado obtido com a função fft. Discuta a equivalência entre os resultados e a diferença no custo computacional.

#### 7. Considere a função de transferência discreta: H(z) = 1 / (1 − 0.8z)<sup>-1</sup>. Determine numericamente sua resposta ao impulso e represente-a graficamente. A partir do comportamento da sequência, discuta se o sistema é estável.

#### 8. Considere dois sinais com durações diferentes, mas com a mesma frequência fundamental. Calcule a FFT de ambos e compare a resolução espectral obtida. Explique a influência do número de amostras na análise em frequência.

#### 9. Gere um sinal contendo uma frequência principal e uma componente harmônica. Calcule o espectro e identifique as frequências presentes. Discuta como esse tipo de análise pode ser útil no diagnóstico de vibrações mecânicas e falhas periódicas.

#### 10. Pesquise e implemente, em SciLab ou MatLab, a análise espectral de um sinal real simples, como um áudio gravado, um sinal sintético com ruído ou uma vibração simulada. Apresente o sinal no domínio do tempo, o espectro correspondente e uma breve interpretação física dos resultados.