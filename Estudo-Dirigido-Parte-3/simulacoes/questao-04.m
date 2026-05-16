% ----------------------------
% Parâmetros do sinal
% ----------------------------
N = 128;              % Número de amostras
n = 0:N-1;            % Índices discretos

% Frequência normalizada não inteira em relação à FFT
% Isso provoca vazamento espectral.
f0 = 0.13;

% Sinal senoidal
x = sin(2*pi*f0*n);

% ----------------------------
% FFT sem janela
% ----------------------------
X = fft(x);

% ----------------------------
% Janela de Hamming
% ----------------------------
w = hamming(N)';      % Transposta para vetor linha
xw = x .* w;

% FFT com janela
Xw = fft(xw);

% Frequência normalizada
f = (0:N-1)/N;

% ============================================================
% PLOTAGEM
% ============================================================
figure('Name','Efeito do Janelamento','NumberTitle','off');

% Sinal original
subplot(2,2,1);
stem(n, x, 'filled');
title('Sinal Original');
xlabel('n');
ylabel('x[n]');
grid on;

% Sinal com janela
subplot(2,2,2);
stem(n, xw, 'filled');
title('Sinal com Janela de Hamming');
xlabel('n');
ylabel('x_w[n]');
grid on;

% FFT sem janela
subplot(2,2,3);
plot(f(1:N/2), abs(X(1:N/2)), 'LineWidth', 1.5);
title('FFT sem Janela');
xlabel('Frequência Normalizada');
ylabel('|X(f)|');
grid on;

% FFT com janela
subplot(2,2,4);
plot(f(1:N/2), abs(Xw(1:N/2)), 'LineWidth', 1.5);
title('FFT com Janela de Hamming');
xlabel('Frequência Normalizada');
ylabel('|X_w(f)|');
grid on;

sgtitle('Comparação do Vazamento Espectral');
