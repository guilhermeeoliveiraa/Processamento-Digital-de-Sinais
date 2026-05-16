% ----------------------------
% Sinal de entrada (curto)
% ----------------------------
N = 16;
n = 0:N-1;

f0 = 0.2;
x = sin(2*pi*f0*n);

% ----------------------------
% DFT manual (definição)
% X[k] = sum_{n=0}^{N-1} x[n] * exp(-j*2πkn/N)
% ----------------------------
X_dft = zeros(1, N);

for k = 0:N-1
    for m = 0:N-1
        X_dft(k+1) = X_dft(k+1) + x(m+1) * exp(-1j*2*pi*k*m/N);
    end
end

% ----------------------------
% FFT (função nativa)
% ----------------------------
X_fft = fft(x);

% ----------------------------
% Frequência normalizada
% ----------------------------
f = (0:N-1)/N;

% ----------------------------
% Gráficos
% ----------------------------
figure;

subplot(3,1,1);
stem(n, x, 'filled');
title('Sinal no Domínio do Tempo');
xlabel('n'); ylabel('x[n]');
grid on;

subplot(3,1,2);
stem(f, abs(X_dft), 'r', 'filled');
title('DFT (implementação direta)');
xlabel('Frequência Normalizada'); ylabel('|X[k]|');
grid on;

subplot(3,1,3);
stem(f, abs(X_fft), 'b', 'filled');
title('FFT (função nativa)');
xlabel('Frequência Normalizada'); ylabel('|X[k]|');
grid on;
