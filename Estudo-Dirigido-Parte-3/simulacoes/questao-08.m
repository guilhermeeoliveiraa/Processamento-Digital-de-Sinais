f0 = 0.15;  % frequência normalizada

% ----------------------------
% Sinal 1 (curto)
% ----------------------------
N1 = 64;
n1 = 0:N1-1;
x1 = sin(2*pi*f0*n1);

X1 = fft(x1);
f1 = (0:N1-1)/N1;

% ----------------------------
% Sinal 2 (longo)
% ----------------------------
N2 = 256;
n2 = 0:N2-1;
x2 = sin(2*pi*f0*n2);

X2 = fft(x2);
f2 = (0:N2-1)/N2;

% ----------------------------
% Plotagem
% ----------------------------
figure;

subplot(2,2,1);
stem(n1, x1, 'filled');
title('Sinal curto (N=64)');
xlabel('n'); ylabel('x[n]');
grid on;

subplot(2,2,2);
plot(f1, abs(X1));
title('FFT - N=64');
xlabel('Frequência normalizada'); ylabel('|X(f)|');
grid on;
xlim([0 0.5]);

subplot(2,2,3);
stem(n2, x2, 'filled');
title('Sinal longo (N=256)');
xlabel('n'); ylabel('x[n]');
grid on;

subplot(2,2,4);
plot(f2, abs(X2));
title('FFT - N=256');
xlabel('Frequência normalizada'); ylabel('|X(f)|');
grid on;
xlim([0 0.5]);
