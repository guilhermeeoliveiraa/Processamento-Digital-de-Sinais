% ----------------------------
% Parâmetros
% ----------------------------
N = 256;
n = 0:N-1;

f0 = 0.10;        % frequência fundamental (normalizada)
A1 = 1;           % amplitude fundamental

A2 = 0.5;         % amplitude harmônica

% ----------------------------
% Sinal fundamental + 2ª harmônica
% ----------------------------
x1 = A1 * sin(2*pi*f0*n);
x2 = A2 * sin(2*pi*(2*f0)*n);  % harmônica (2*f0)

x = x1 + x2;

% ----------------------------
% FFT
% ----------------------------
X = fft(x);
f = (0:N-1)/N;

% Espectro centrado
X_shift = fftshift(abs(X))/N;
f_shift = (-N/2:N/2-1)/N;

% ----------------------------
% Gráficos
% ----------------------------
figure;

subplot(2,1,1);
plot(n, x);
title('Sinal no Domínio do Tempo (fundamental + harmônica)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(f_shift, X_shift, 'LineWidth', 1.5);
title('Espectro de Magnitude (FFT)');
xlabel('Frequência normalizada');
ylabel('|X(f)|');
grid on;
