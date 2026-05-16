N = 512;
n = 0:N-1;

f0 = 0.12;

% sinal útil
s = sin(2*pi*f0*n);

% ruído aditivo
w = 0.6 * randn(1, N);

% sinal total
x = s + w;

% FFT
X = fft(x);
f = (0:N-1)/N;

% espectro centrado
Xc = fftshift(abs(X))/N;
fc = (-N/2:N/2-1)/N;

% gráficos
figure;

subplot(2,1,1);
plot(n, x);
title('Sinal no domínio do tempo');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(fc, Xc);
title('Espectro de magnitude (FFT)');
xlabel('Frequência normalizada');
ylabel('|X(f)|');
grid on;
