fs = 1000;             % frequência de amostragem (Hz)
t = 0:0.001:1;         % vetor de tempo (1 segundo)

f1 = 1;                % frequência da primeira senoide
f2 = 10;               % frequência da segunda senoide

x1 = sin(2*pi*f1*t);   % senoide 1
x2 = sin(2*pi*f2*t);   % senoide 2

y = x1 .* x2;          % multiplicação das senoides

subplot(3,1,1)
plot(t,x1)
title('Senoide 1')

subplot(3,1,2)
plot(t,x2)
title('Senoide 2')

subplot(3,1,3)
plot(t,y)
title('Produto das senoides')

N = length(y);         % número de amostras
Y = fft(y);            % transformada rápida de Fourier

f = (0:N-1)*(fs/N);    % eixo de frequência

figure
plot(f,abs(Y))
grid on
xlabel('Frequência (Hz)')
ylabel('Magnitude')
title('Espectro de frequência via FFT')
xlim([0 20])
