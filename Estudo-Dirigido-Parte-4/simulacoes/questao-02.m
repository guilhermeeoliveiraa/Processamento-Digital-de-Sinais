% ----------------------------------------------------------
% Parâmetros do sinal
% ----------------------------------------------------------
Fs = 1000;              % Frequência de amostragem (Hz)
T = 1/Fs;
t = 0:T:1-T;

% Sinal original (componente útil)
f_sinal = 50;           % Frequência do sinal (Hz)
x = sin(2*pi*f_sinal*t);

% ----------------------------------------------------------
% Adição de ruído branco
% ----------------------------------------------------------
amplitude_ruido = 0.5;

ruido = amplitude_ruido * randn(size(t));

x_ruidoso = x + ruido;

% ----------------------------------------------------------
% Projeto do filtro FIR passa-baixa
% ----------------------------------------------------------
fc = 100;               % Frequência de corte (Hz)
ordem = 50;

Wn = fc/(Fs/2);

b = fir1(ordem, Wn, "low");

% Aplicação do filtro
x_filtrado = filter(b, 1, x_ruidoso);

% ----------------------------------------------------------
% FFT para análise espectral
% ----------------------------------------------------------
N = length(t);

X = abs(fft(x))/N;
XR = abs(fft(x_ruidoso))/N;
XF = abs(fft(x_filtrado))/N;

f = (0:N-1)*(Fs/N);

% ----------------------------------------------------------
% Gráficos no domínio do tempo
% ----------------------------------------------------------
figure;

subplot(3,1,1);
plot(t, x);
grid on;
title('Sinal Original');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t, x_ruidoso);
grid on;
title('Sinal com Ruído Branco');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(t, x_filtrado);
grid on;
title('Sinal Após Filtragem FIR');
xlabel('Tempo (s)');
ylabel('Amplitude');

% ----------------------------------------------------------
% Gráficos no domínio da frequência
% ----------------------------------------------------------
figure;

subplot(3,1,1);
plot(f(1:N/2), 2*X(1:N/2));
grid on;
title('Espectro do Sinal Original');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

subplot(3,1,2);
plot(f(1:N/2), 2*XR(1:N/2));
grid on;
title('Espectro do Sinal com Ruído');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

subplot(3,1,3);
plot(f(1:N/2), 2*XF(1:N/2));
grid on;
title('Espectro Após Filtragem FIR');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

% ----------------------------------------------------------
% Cálculo simples da potência do ruído
% ----------------------------------------------------------
pot_ruido_antes = mean((x_ruidoso - x).^2);

% Remover atraso aproximado do FIR
atraso = ordem/2;
x_filtrado_corrigido = x_filtrado(atraso+1:end);
x_referencia = x(1:end-atraso);

pot_ruido_depois = mean((x_filtrado_corrigido - x_referencia).^2);

fprintf('\n');
fprintf('Potência do ruído antes da filtragem : %.6f\n', pot_ruido_antes);
fprintf('Potência do ruído após a filtragem  : %.6f\n', pot_ruido_depois);
fprintf('Redução aproximada: %.2f %%\n', ...
        100*(1 - pot_ruido_depois/pot_ruido_antes));
