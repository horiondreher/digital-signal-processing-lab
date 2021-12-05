close all
clear
clc

%% Exercício 3 - Sistemas

w0 = 0.1*pi;
n = -50:50;
x = sin(w0*n);

y1 = 3*x + 1;

figure(1)
stem(n, y1);
grid on
xlabel('x(n)')
ylabel('y(n)')
hold on

y2 = x.^2;

stem(n, y2);
grid on
xlabel('x(n)')
ylabel('y(n)')

syms m
y3 = cumsum(x);

stem(n, y3);
grid on
xlabel('x(n)')
ylabel('y(n)')

y4 = sin(w0*n) - sin(w0*(n-1));

stem(n, y4);
grid on
xlabel('x(n)')
ylabel('y(n)')

legend('y1', 'y2', 'y3', 'y4');
hold off