% ----------------------------
% Parâmetros
% ----------------------------
N = 50;              % número de amostras
n = 0:N-1;

a = 0.8;             % polo do sistema

% ----------------------------
% Entrada impulso δ[n]
% ----------------------------
x = zeros(1, N);
x(1) = 1;

% ----------------------------
% Sistema discreto:
% y[n] = 0.8 y[n-1] + x[n]
% ----------------------------
y = zeros(1, N);

for k = 1:N
    if k == 1
        y(k) = x(k);
    else
        y(k) = a * y(k-1) + x(k);
    end
end

% ----------------------------
% Solução teórica (comparação)
% h[n] = (0.8)^n u[n]
% ----------------------------
h = a.^n;

% ----------------------------
% Gráfico
% ----------------------------
figure;

stem(n, y, 'filled'); hold on;
plot(n, h, 'r', 'LineWidth', 1.5);

title('Resposta ao Impulso do Sistema Discreto');
xlabel('n');
ylabel('h[n]');
legend('Numérica', 'Teórica');
grid on;
