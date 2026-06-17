% ----------------------------------------------------------
% Parâmetros do sinal
% ----------------------------------------------------------
Fs = 1000;          % Frequência de amostragem (Hz)
T = 1/Fs;
t = 0:T:1-T;        % Vetor de tempo

% Frequências das senoides
f1 = 50;            % Frequência baixa (Hz)
f2 = 200;           % Frequência alta (Hz)

% Sinal composto
x = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t);

% ----------------------------------------------------------
% Projeto do filtro passa-baixa FIR
% ----------------------------------------------------------
fc = 100;           % Frequência de corte (Hz)

ordem = 50;

% Frequência normalizada
Wn = fc/(Fs/2);

% Coeficientes do filtro FIR
b = fir1(ordem, Wn, "low");

% Aplicação do filtro
y = filter(b, 1, x);

% ----------------------------------------------------------
% Análise espectral (FFT)
% ----------------------------------------------------------
N = length(x);

X = abs(fft(x))/N;
Y = abs(fft(y))/N;

f = (0:N-1)*(Fs/N);

% ----------------------------------------------------------
% Gráficos
% ----------------------------------------------------------

figure;

subplot(2,2,1);
plot(t, x);
grid on;
title('Sinal Original');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(2,2,2);
plot(t, y);
grid on;
title('Sinal Filtrado');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(2,2,3);
plot(f(1:N/2), 2*X(1:N/2));
grid on;
title('Espectro do Sinal Original');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

subplot(2,2,4);
plot(f(1:N/2), 2*Y(1:N/2));
grid on;
title('Espectro do Sinal Filtrado');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

% ----------------------------------------------------------
% Resultado esperado
% ----------------------------------------------------------
disp('Componente de 50 Hz deve permanecer após a filtragem.');
disp('Componente de 200 Hz deve ser fortemente atenuada.');
