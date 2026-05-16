% Parâmetros
N = 128;
n = 0:N-1;

% Frequências distintas
f1 = 0.1;
f2 = 0.25;

% Sinais
x1 = sin(2*pi*f1*n);
x2 = sin(2*pi*f2*n);

% Soma dos sinais
x = x1 + x2;

% Domínio do tempo
figure;
stem(n, x, 'filled');
title('Sinal no Domínio do Tempo');
xlabel('n'); ylabel('x[n]');
grid on;

% FFT
X = fft(x);
f = (0:N-1)/N;

% Espectro
figure;
plot(f, abs(X));
title('Espectro de Magnitude (FFT)');
xlabel('Frequência Normalizada');
ylabel('|X(f)|');
grid on;
