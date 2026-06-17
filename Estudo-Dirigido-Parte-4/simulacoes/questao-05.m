pkg load signal

% ----------------------------------------------------------
% Parâmetros do filtro
% ----------------------------------------------------------
Fs = 1000;          % Frequência de amostragem (Hz)
fc = 100;           % Frequência de corte (Hz)

ordem = 4;

Wn = fc/(Fs/2);

% ----------------------------------------------------------
% Projeto do filtro IIR Butterworth
% ----------------------------------------------------------
[b,a] = butter(ordem,Wn,"low");

% ----------------------------------------------------------
% Cálculo dos polos e zeros
% ----------------------------------------------------------
zeros_filtro = roots(b);
polos_filtro = roots(a);

% ----------------------------------------------------------
% Exibição numérica
% ----------------------------------------------------------
disp('Zeros do filtro:');
disp(zeros_filtro);

disp('Polos do filtro:');
disp(polos_filtro);

% ----------------------------------------------------------
% Representação dos polos e zeros
% ----------------------------------------------------------
figure;

theta = linspace(0,2*pi,500);

plot(cos(theta),sin(theta), ...
    'k--','LineWidth',1.5);
hold on;

plot(real(zeros_filtro), imag(zeros_filtro), ...
    'ob','MarkerSize',8,'LineWidth',2);

plot(real(polos_filtro), imag(polos_filtro), ...
    'xr','MarkerSize',10,'LineWidth',2);

axis equal;
grid on;

xlabel('Parte Real');
ylabel('Parte Imaginária');

title('Polos e Zeros do Filtro IIR Butterworth');

legend('Círculo Unitário', ...
       'Zeros (o)', ...
       'Polos (x)', ...
       'Location', 'best');

% ----------------------------------------------------------
% Verificação automática da estabilidade
% ----------------------------------------------------------
modulos_polos = abs(polos_filtro);

fprintf('\nMódulos dos polos:\n');
disp(modulos_polos);

if all(modulos_polos < 1)
    fprintf('\nFiltro ESTÁVEL.\n');
    fprintf('Todos os polos estão dentro do círculo unitário.\n');
else
    fprintf('\nFiltro INSTÁVEL.\n');
    fprintf('Existe pelo menos um polo fora do círculo unitário.\n');
end
