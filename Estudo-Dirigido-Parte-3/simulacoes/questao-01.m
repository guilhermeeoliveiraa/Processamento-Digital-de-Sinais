% Parâmetros
N = 128;
n = 0:N-1;

% Frequências normalizadas
f1 = 0.10;
f2 = 0.25;

% Sinais
x1 = sin(2*pi*f1*n);
x2 = sin(2*pi*f2*n);

% Soma dos sinais
x = x1 + x2;

% FFT
X = fft(x);
f = (0:N-1)/N;

% Gráfico único com dois subplots
figure;

% -----------------------------
% Sinal no domínio do tempo
% -----------------------------
subplot(2,1,1);
stem(n, x, 'filled');
title('Sinal no Domínio do Tempo');
xlabel('n');
ylabel('x[n]');
grid on;

% -----------------------------
% Espectro de magnitude
% -----------------------------
subplot(2,1,2);
plot(f, abs(X), 'LineWidth', 1.5);
title('Espectro de Magnitude (FFT)');
xlabel('Frequência Normalizada');
ylabel('|X(f)|');
grid on;
xlim([0 0.5]);   % Mostra até a frequência de Nyquist
