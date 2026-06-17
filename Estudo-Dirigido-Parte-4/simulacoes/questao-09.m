  pkg load signal

% ----------------------------------------------------------
% Parâmetros
% ----------------------------------------------------------
Fs = 1000;      % Frequência de amostragem (Hz)
fc = 100;       % Frequência de corte (Hz)

% ----------------------------------------------------------
% Filtro FIR
% ----------------------------------------------------------
ordem_FIR = 50;
b_fir = fir1(ordem_FIR, fc/(Fs/2), "low");

% ----------------------------------------------------------
% Filtro IIR Butterworth
% ----------------------------------------------------------
ordem_butter = 5;
[b_butter,a_butter] = butter(ordem_butter, fc/(Fs/2));

% ----------------------------------------------------------
% Filtro IIR Chebyshev Tipo I
% ----------------------------------------------------------
ordem_cheby = 5;
ripple = 1; % dB

[b_cheby,a_cheby] = cheby1(ordem_cheby, ripple, fc/(Fs/2));

% ----------------------------------------------------------
% Cálculo do atraso de grupo
% ----------------------------------------------------------
[gd_fir,f] = grpdelay(b_fir,1,2048,Fs);
[gd_butter,~] = grpdelay(b_butter,a_butter,2048,Fs);
[gd_cheby,~] = grpdelay(b_cheby,a_cheby,2048,Fs);

% ----------------------------------------------------------
% Resposta em magnitude
% ----------------------------------------------------------
figure;

freqz(b_fir,1,2048,Fs);
title('Resposta em Frequência - Filtro FIR');

figure;

freqz(b_butter,a_butter,2048,Fs);
title('Resposta em Frequência - Filtro Butterworth');

figure;

freqz(b_cheby,a_cheby,2048,Fs);
title('Resposta em Frequência - Filtro Chebyshev I');

% ----------------------------------------------------------
% Comparação do atraso de grupo
% ----------------------------------------------------------
figure;

plot(f,gd_fir,'LineWidth',1.5);
hold on;

plot(f,gd_butter,'LineWidth',1.5);

plot(f,gd_cheby,'LineWidth',1.5);

grid on;

title('Comparação do Atraso de Grupo');
xlabel('Frequência (Hz)');
ylabel('Atraso de Grupo (amostras)');

legend('FIR','Butterworth','Chebyshev I');

% ----------------------------------------------------------
% Valores médios na banda passante
% ----------------------------------------------------------
indice = find(f <= fc);

media_fir = mean(gd_fir(indice));
media_butter = mean(gd_butter(indice));
media_cheby = mean(gd_cheby(indice));

fprintf('\nAtraso médio na banda passante:\n');
fprintf('FIR: %.2f amostras\n', media_fir);
fprintf('Butterworth: %.2f amostras\n', media_butter);
fprintf('Chebyshev I: %.2f amostras\n', media_cheby);
