% ----------------------------
% Parâmetros
% ----------------------------
N = 256;                 % número de amostras
n = 0:N-1;               % índice discreto
f0 = 0.15;               % frequência da senoide (normalizada)
A = 1;                   % amplitude da senoide

% ----------------------------
% Sinal útil (senoide)
% ----------------------------
x_clean = A * sin(2*pi*f0*n);

% ----------------------------
% Ruído aditivo branco
% ----------------------------
noise = 0.8 * randn(1, N);

% ----------------------------
% Sinal contaminado
% ----------------------------
x = x_clean + noise;

% ----------------------------
% FFT
% ----------------------------
X = fft(x);
f = (0:N-1)/N;

% Espectro centrado (opcional mais claro)
X_shift = fftshift(abs(X))/N;
f_shift = (-N/2:N/2-1)/N;

% ----------------------------
% Gráficos
% ----------------------------
figure;

subplot(2,1,1);
plot(n, x, 'b'); hold on;
plot(n, x_clean, 'r', 'LineWidth', 1.2);
title('Sinal no Domínio do Tempo (com ruído)');
xlabel('n'); ylabel('Amplitude');
legend('Sinal ruidoso', 'Senoide pura');
grid on;

subplot(2,1,2);
plot(f_shift, X_shift, 'k', 'LineWidth', 1.5);
title('Espectro de Magnitude (FFT centrada)');
xlabel('Frequência Normalizada');
ylabel('|X(f)|');
grid on;
