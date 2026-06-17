pkg load signal

% ----------------------------------------------------------
% Parâmetros
% ----------------------------------------------------------
Fs = 100;              % Frequência de amostragem (Hz)
T = 1/Fs;
t = 0:T:20-T;

% ----------------------------------------------------------
% Sinal útil
% Simula uma variável agrícola (umidade, temperatura etc.)
% ----------------------------------------------------------
sinal_util = 2*sin(2*pi*0.5*t);

% ----------------------------------------------------------
% Ruídos e interferências
% ----------------------------------------------------------
ruido_branco = 0.4*randn(size(t));

interferencia = 0.8*sin(2*pi*15*t);

sinal_medido = sinal_util + ruido_branco + interferencia;

% ----------------------------------------------------------
% Projeto do filtro FIR passa-baixa
% ----------------------------------------------------------
fc = 2;          % Hz
ordem = 80;

b = fir1(ordem, fc/(Fs/2), "low");

% ----------------------------------------------------------
% Aplicação do filtro
% ----------------------------------------------------------
sinal_filtrado = filter(b,1,sinal_medido);

% ----------------------------------------------------------
% FFT
% ----------------------------------------------------------
N = length(t);

X = abs(fft(sinal_medido))/N;
Y = abs(fft(sinal_filtrado))/N;

f = (0:N-1)*(Fs/N);

% ----------------------------------------------------------
% Sinais no tempo
% ----------------------------------------------------------
figure;

subplot(3,1,1);
plot(t,sinal_util);
grid on;
title('Sinal Util');

xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t,sinal_medido);
grid on;
title('Sinal Medido com Ruido');

xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(t,sinal_filtrado);
grid on;
title('Sinal Filtrado');

xlabel('Tempo (s)');
ylabel('Amplitude');

% ----------------------------------------------------------
% Espectros
% ----------------------------------------------------------
figure;

subplot(2,1,1);
plot(f(1:N/2),2*X(1:N/2),'LineWidth',1.5);
grid on;
title('Espectro do Sinal Medido');

xlabel('Frequencia (Hz)');
ylabel('Magnitude');

subplot(2,1,2);
plot(f(1:N/2),2*Y(1:N/2),'LineWidth',1.5);
grid on;
title('Espectro do Sinal Filtrado');

xlabel('Frequencia (Hz)');
ylabel('Magnitude');

% ----------------------------------------------------------
% Resposta em frequência
% ----------------------------------------------------------
figure;

freqz(b,1,1024,Fs);
title('Resposta em Frequencia do Filtro FIR');

% ----------------------------------------------------------
% Informações
% ----------------------------------------------------------
fprintf('\nSistema de monitoramento agricola\n');
fprintf('Frequencia do sinal util: 0.5 Hz\n');
fprintf('Interferencia adicionada: 15 Hz\n');
fprintf('Frequencia de corte: %.1f Hz\n',fc);