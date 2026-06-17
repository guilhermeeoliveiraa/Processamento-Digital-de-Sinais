pkg load signal

% ----------------------------------------------------------
% Parâmetros
% ----------------------------------------------------------
Fs = 1000;      % Frequência de amostragem (Hz)

% ----------------------------------------------------------
% Filtro FIR
% ----------------------------------------------------------
ordem_FIR = 50;
fc = 100;

b_fir = fir1(ordem_FIR, fc/(Fs/2), "low");

% ----------------------------------------------------------
% Filtro IIR (Butterworth)
% ----------------------------------------------------------
ordem_IIR = 5;

[b_iir,a_iir] = butter(ordem_IIR, fc/(Fs/2));

% ----------------------------------------------------------
% Respostas em frequência
% ----------------------------------------------------------
[Hfir,w] = freqz(b_fir,1,2048,Fs);
[Hiir,~] = freqz(b_iir,a_iir,2048,Fs);

% ----------------------------------------------------------
% Magnitude
% ----------------------------------------------------------
figure;

subplot(2,1,1);
plot(w,20*log10(abs(Hfir)+eps),'LineWidth',1.5);
grid on;
title('Magnitude - Filtro FIR');
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');

subplot(2,1,2);
plot(w,20*log10(abs(Hiir)+eps),'LineWidth',1.5);
grid on;
title('Magnitude - Filtro IIR Butterworth');
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');

% ----------------------------------------------------------
% Fase
% ----------------------------------------------------------
figure;

subplot(2,1,1);
plot(w,unwrap(angle(Hfir)),'LineWidth',1.5);
grid on;
title('Resposta de Fase - FIR');
xlabel('Frequência (Hz)');
ylabel('Fase (rad)');

subplot(2,1,2);
plot(w,unwrap(angle(Hiir)),'LineWidth',1.5);
grid on;
title('Resposta de Fase - IIR');
xlabel('Frequência (Hz)');
ylabel('Fase (rad)');

% ----------------------------------------------------------
% Atraso de grupo
% ----------------------------------------------------------
figure;

[gd_fir,wg] = grpdelay(b_fir,1,2048,Fs);
[gd_iir,~] = grpdelay(b_iir,a_iir,2048,Fs);

subplot(2,1,1);
plot(wg,gd_fir,'LineWidth',1.5);
grid on;
title('Atraso de Grupo - FIR');
xlabel('Frequência (Hz)');
ylabel('Amostras');

subplot(2,1,2);
plot(wg,gd_iir,'LineWidth',1.5);
grid on;
title('Atraso de Grupo - IIR');
xlabel('Frequência (Hz)');
ylabel('Amostras');

% ----------------------------------------------------------
% Informações
% ----------------------------------------------------------
fprintf('\nComparacao entre filtros:\n');
fprintf('FIR: fase aproximadamente linear.\n');
fprintf('IIR: fase nao linear.\n');
fprintf('Filtro FIR preserva melhor a forma de onda.\n');
fprintf('Filtro IIR apresenta menor ordem para mesma seletividade.\n');
