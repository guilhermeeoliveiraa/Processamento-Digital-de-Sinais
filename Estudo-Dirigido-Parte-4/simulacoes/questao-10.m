pkg load signal

% ----------------------------------------------------------
% Parâmetros
% ----------------------------------------------------------
Fs = 100;           % Frequência de amostragem (Hz)
T = 1/Fs;
t = 0:T:10-T;

% ----------------------------------------------------------
% Sinal original do sensor
% (medição lenta de temperatura ou pressão)
% ----------------------------------------------------------
sinal_limpo = 2*sin(2*pi*1*t);

% ----------------------------------------------------------
% Ruído de alta frequência
% ----------------------------------------------------------
ruido = 0.5*sin(2*pi*20*t);

% Sinal medido pelo sensor
sinal_ruidoso = sinal_limpo + ruido;

% ----------------------------------------------------------
% Projeto do filtro passa-baixa FIR
% ----------------------------------------------------------
fc = 5;                 % Frequência de corte (Hz)
ordem = 50;

b = fir1(ordem, fc/(Fs/2), "low");

% Aplicação do filtro
sinal_filtrado = filter(b,1,sinal_ruidoso);

% ----------------------------------------------------------
% FFT
% ----------------------------------------------------------
N = length(t);

Xr = abs(fft(sinal_ruidoso))/N;
Xf = abs(fft(sinal_filtrado))/N;

f = (0:N-1)*(Fs/N);

% ----------------------------------------------------------
% Sinais no tempo
% ----------------------------------------------------------
figure;

subplot(3,1,1);
plot(t,sinal_limpo);
grid on;
title('Sinal Original');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t,sinal_ruidoso);
grid on;
title('Sinal com Ruído');
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
plot(f(1:N/2),2*Xr(1:N/2),'LineWidth',1.5);
grid on;
title('Espectro do Sinal com Ruído');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

subplot(2,1,2);
plot(f(1:N/2),2*Xf(1:N/2),'LineWidth',1.5);
grid on;
title('Espectro do Sinal Filtrado');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

% ----------------------------------------------------------
% Resposta em frequência
% ----------------------------------------------------------
figure;

freqz(b,1,1024,Fs);
title('Resposta em Frequência do Filtro Passa-Baixa');

% ----------------------------------------------------------
% Informações
% ----------------------------------------------------------
fprintf('\nAplicacao: filtragem de sinais de sensores\n');
fprintf('Frequencia util: 1 Hz\n');
fprintf('Ruido adicionado: 20 Hz\n');
fprintf('Frequencia de corte do filtro: %.1f Hz\n',fc);
