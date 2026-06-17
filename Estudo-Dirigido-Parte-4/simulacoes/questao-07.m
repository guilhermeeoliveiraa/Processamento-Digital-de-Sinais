% ----------------------------------------------------------
% Parâmetros do sinal
% ----------------------------------------------------------
Fs = 1000;              % Frequência de amostragem (Hz)
T = 1/Fs;
t = 0:T:1-T;

% ----------------------------------------------------------
% Sinal composto
% ----------------------------------------------------------
f1 = 50;                % Hz
f2 = 150;               % Hz (frequência de interesse)
f3 = 300;               % Hz

x = sin(2*pi*f1*t) + ...
    sin(2*pi*f2*t) + ...
    sin(2*pi*f3*t);

% ----------------------------------------------------------
% Projeto do filtro passa-faixa FIR
% ----------------------------------------------------------
f_inf = 130;            % Limite inferior (Hz)
f_sup = 170;            % Limite superior (Hz)

ordem = 80;

Wn = [f_inf f_sup]/(Fs/2);

b = fir1(ordem, Wn, "bandpass");

% Aplicação do filtro
y = filter(b, 1, x);

% ----------------------------------------------------------
% FFT
% ----------------------------------------------------------
N = length(x);

X = abs(fft(x))/N;
Y = abs(fft(y))/N;

f = (0:N-1)*(Fs/N);

% ----------------------------------------------------------
% Sinal no tempo
% ----------------------------------------------------------
figure;

subplot(2,1,1);
plot(t,x);
grid on;
title('Sinal Original');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t,y);
grid on;
title('Sinal Após Filtragem Passa-Faixa');
xlabel('Tempo (s)');
ylabel('Amplitude');

% ----------------------------------------------------------
% Espectros
% ----------------------------------------------------------
figure;

subplot(2,1,1);
plot(f(1:N/2),2*X(1:N/2),'LineWidth',1.5);
grid on;
title('Espectro do Sinal Original');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

subplot(2,1,2);
plot(f(1:N/2),2*Y(1:N/2),'LineWidth',1.5);
grid on;
title('Espectro do Sinal Filtrado');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

% ----------------------------------------------------------
% Resposta em frequência do filtro
% ----------------------------------------------------------
figure;

freqz(b,1,1024,Fs);
title('Resposta em Frequência do Filtro Passa-Faixa');

% ----------------------------------------------------------
% Informações
% ----------------------------------------------------------
fprintf('\n');
fprintf('Frequências presentes no sinal:\n');
fprintf('50 Hz\n');
fprintf('150 Hz (frequência desejada)\n');
fprintf('300 Hz\n');

fprintf('\nFaixa de passagem do filtro:\n');
fprintf('%d Hz até %d Hz\n',f_inf,f_sup);
