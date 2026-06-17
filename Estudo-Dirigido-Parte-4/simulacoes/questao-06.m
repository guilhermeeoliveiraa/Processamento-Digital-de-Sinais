% ----------------------------------------------------------
% Parâmetros
% ----------------------------------------------------------
Fs = 1000;
fc = 100;

Wn = fc/(Fs/2);

% ----------------------------------------------------------
% Filtro FIR
% ----------------------------------------------------------
ordem_fir = 30;

b_fir = fir1(ordem_fir, Wn, "low");
a_fir = 1;

% ----------------------------------------------------------
% Filtro IIR Butterworth
% ----------------------------------------------------------
ordem_iir = 4;

[b_iir, a_iir] = butter(ordem_iir, Wn, "low");

% ----------------------------------------------------------
% Geração do impulso discreto
% ----------------------------------------------------------
N = 100;

impulso = [1 zeros(1,N-1)];

% ----------------------------------------------------------
% Resposta ao impulso
% ----------------------------------------------------------
h_fir = filter(b_fir, a_fir, impulso);
h_iir = filter(b_iir, a_iir, impulso);

% ----------------------------------------------------------
% Gráficos
% ----------------------------------------------------------
figure;

subplot(2,1,1);
stem(0:N-1, h_fir, 'filled');
grid on;
title('Resposta ao Impulso - Filtro FIR');
xlabel('n');
ylabel('h[n]');

subplot(2,1,2);
stem(0:N-1, h_iir, 'filled');
grid on;
title('Resposta ao Impulso - Filtro IIR Butterworth');
xlabel('n');
ylabel('h[n]');

% ----------------------------------------------------------
% Comparação direta
% ----------------------------------------------------------
figure;

plot(0:N-1, h_fir, 'LineWidth', 2);
hold on;
plot(0:N-1, h_iir, 'LineWidth', 2);

grid on;
xlabel('n');
ylabel('Amplitude');
title('Comparação das Respostas ao Impulso');

legend('FIR','IIR Butterworth');

% ----------------------------------------------------------
% Informações
% ----------------------------------------------------------
fprintf('\n');
fprintf('Ordem FIR: %d\n', ordem_fir);
fprintf('Ordem IIR: %d\n', ordem_iir);
fprintf('Número de amostras analisadas: %d\n', N);
