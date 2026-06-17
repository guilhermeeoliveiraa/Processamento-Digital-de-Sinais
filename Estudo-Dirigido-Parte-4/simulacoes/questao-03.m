pkg load signal

% ----------------------------------------------------------
% Parâmetros do sinal
% ----------------------------------------------------------
Fs = 1000;              % Frequência de amostragem (Hz)
T = 1/Fs;
t = 0:T:1-T;

% ----------------------------------------------------------
% Sinal original
% ----------------------------------------------------------
f0 = 50;                % Frequência do sinal útil

x = sin(2*pi*f0*t);

% ----------------------------------------------------------
% Adição de ruído branco
% ----------------------------------------------------------
ruido = 0.5*randn(size(t));

x_ruidoso = x + ruido;

% ----------------------------------------------------------
% Filtro FIR
% ----------------------------------------------------------
ordem_FIR = 80;
fc = 100;

b_fir = fir1(ordem_FIR, fc/(Fs/2), "low");

y_fir = filter(b_fir,1,x_ruidoso);

% ----------------------------------------------------------
% Filtro IIR Butterworth
% ----------------------------------------------------------
ordem_IIR = 5;

[b_iir,a_iir] = butter(ordem_IIR, fc/(Fs/2));

y_iir = filter(b_iir,a_iir,x_ruidoso);

% ----------------------------------------------------------
% FFT
% ----------------------------------------------------------
N = length(x);

X = abs(fft(x_ruidoso))/N;
Yfir = abs(fft(y_fir))/N;
Yiir = abs(fft(y_iir))/N;

f = (0:N-1)*(Fs/N);

% ----------------------------------------------------------
% Sinais no tempo
% ----------------------------------------------------------
figure;

subplot(3,1,1);
plot(t,x_ruidoso);
grid on;
title('Sinal com Ruído Branco');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t,y_fir);
grid on;
title('Sinal Filtrado - FIR');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(t,y_iir);
grid on;
title('Sinal Filtrado - IIR Butterworth');
xlabel('Tempo (s)');
ylabel('Amplitude');

% ----------------------------------------------------------
% Espectros
% ----------------------------------------------------------
figure;

subplot(3,1,1);
plot(f(1:N/2),2*X(1:N/2),'LineWidth',1.5);
grid on;
title('Espectro do Sinal Ruidoso');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

subplot(3,1,2);
plot(f(1:N/2),2*Yfir(1:N/2),'LineWidth',1.5);
grid on;
title('Espectro do Sinal Filtrado - FIR');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

subplot(3,1,3);
plot(f(1:N/2),2*Yiir(1:N/2),'LineWidth',1.5);
grid on;
title('Espectro do Sinal Filtrado - IIR Butterworth');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

% ----------------------------------------------------------
% Respostas em frequência
% ----------------------------------------------------------
figure;

subplot(2,1,1);
freqz(b_fir,1,1024,Fs);
title('Resposta em Frequência - FIR');

subplot(2,1,2);
freqz(b_iir,a_iir,1024,Fs);
title('Resposta em Frequência - IIR Butterworth');

% ----------------------------------------------------------
% Informações
% ----------------------------------------------------------
fprintf('\nComparacao FIR x IIR Butterworth\n');
fprintf('Frequencia do sinal util: %d Hz\n',f0);
fprintf('Frequencia de corte: %d Hz\n',fc);
fprintf('Ordem FIR: %d\n',ordem_FIR);
fprintf('Ordem IIR: %d\n',ordem_IIR);
