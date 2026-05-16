% ----------------------------
% Parâmetros do sinal
% ----------------------------
f0 = 900;        % Frequência do sinal (Hz)
T  = 0.05;       % Duração do sinal (s)

% Taxas de amostragem
fs1 = 5000;      % Taxa adequada (sem aliasing)
fs2 = 1000;      % Taxa reduzida (com aliasing)

% ----------------------------
% Geração do sinal - Caso 1
% ----------------------------
t1 = 0:1/fs1:T;
x1 = sin(2*pi*f0*t1);

% FFT
N1 = length(x1);
X1 = fftshift(abs(fft(x1))/N1);
f1 = (-N1/2:N1/2-1)*(fs1/N1);

% ----------------------------
% Geração do sinal - Caso 2
% ----------------------------
t2 = 0:1/fs2:T;
x2 = sin(2*pi*f0*t2);

% FFT
N2 = length(x2);
X2 = fftshift(abs(fft(x2))/N2);
f2 = (-N2/2:N2/2-1)*(fs2/N2);

% Frequência de alias teórica
f_alias = abs(f0 - round(f0/fs2)*fs2);

fprintf('Frequência original: %.1f Hz\n', f0);
fprintf('Taxa de amostragem reduzida: %.1f Hz\n', fs2);
fprintf('Frequência observada por aliasing: %.1f Hz\n', f_alias);

% ============================================================
% PLOTAGEM
% ============================================================
figure('Name','Aliasing em Sinal Senoidal','NumberTitle','off');

% Sinal no tempo (alta taxa)
subplot(2,2,1);
plot(t1, x1, 'LineWidth', 1.5);
grid on;
title(['Sinal no tempo (f_s = ', num2str(fs1), ' Hz)']);
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 0.01]);

% Espectro (alta taxa)
subplot(2,2,2);
plot(f1, X1, 'LineWidth', 1.5);
grid on;
title('Espectro sem aliasing');
xlabel('Frequência (Hz)');
ylabel('|X(f)|');
xlim([-1500 1500]);

% Sinal no tempo (baixa taxa)
subplot(2,2,3);
stem(t2, x2, 'filled');
grid on;
title(['Sinal amostrado (f_s = ', num2str(fs2), ' Hz)']);
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 0.01]);

% Espectro (baixa taxa)
subplot(2,2,4);
plot(f2, X2, 'LineWidth', 1.5);
grid on;
title(['Espectro com aliasing (pico em ', num2str(f_alias), ' Hz)']);
xlabel('Frequência (Hz)');
ylabel('|X(f)|');
xlim([-500 500]);

sgtitle('Demonstração do Fenômeno de Aliasing');
