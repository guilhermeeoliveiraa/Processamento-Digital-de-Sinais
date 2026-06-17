pkg load signal

% ----------------------------------------------------------
% Parâmetros
% ----------------------------------------------------------
Fs = 1000;          % Frequência de amostragem (Hz)
fc = 100;           % Frequência de corte (Hz)

Wn = fc/(Fs/2);

% ----------------------------------------------------------
% Filtro FIR
% ----------------------------------------------------------
ordem_fir = 50;

b_fir = fir1(ordem_fir, Wn, "low");
a_fir = 1;

% ----------------------------------------------------------
% Filtro IIR Butterworth
% ----------------------------------------------------------
ordem_iir = 4;

[b_iir, a_iir] = butter(ordem_iir, Wn, "low");

% ----------------------------------------------------------
% Resposta em frequência
% ----------------------------------------------------------
N = 2048;

[Hfir, f] = freqz(b_fir, a_fir, N, Fs);
[Hiir, ~] = freqz(b_iir, a_iir, N, Fs);

% ----------------------------------------------------------
% Magnitude (dB)
% ----------------------------------------------------------
mag_fir = 20*log10(abs(Hfir));
mag_iir = 20*log10(abs(Hiir));

% ----------------------------------------------------------
% Fase
% ----------------------------------------------------------
fase_fir = unwrap(angle(Hfir));
fase_iir = unwrap(angle(Hiir));

% ----------------------------------------------------------
% Gráfico da magnitude
% ----------------------------------------------------------
figure;

plot(f, mag_fir, 'LineWidth', 1.5);
hold on;
plot(f, mag_iir, 'LineWidth', 1.5);

grid on;
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
title('Resposta em Frequência - Magnitude');
legend('FIR','IIR Butterworth');

% ----------------------------------------------------------
% Gráfico da fase
% ----------------------------------------------------------
figure;

plot(f, fase_fir, 'LineWidth', 1.5);
hold on;
plot(f, fase_iir, 'LineWidth', 1.5);

grid on;
xlabel('Frequência (Hz)');
ylabel('Fase (rad)');
title('Resposta de Fase');
legend('FIR','IIR Butterworth');

% ----------------------------------------------------------
% Exibição das ordens
% ----------------------------------------------------------
fprintf('\n');
fprintf('Ordem do filtro FIR: %d\n', ordem_fir);
fprintf('Ordem do filtro IIR: %d\n', ordem_iir);
fprintf('Frequência de corte: %.0f Hz\n', fc);
