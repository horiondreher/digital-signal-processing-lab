close all
clear
clc

%% Exercício 2 - Degrau unitário

[n, x] = degrau(-10, 10, -5);

stem(n, x) 
grid on
xlabel('n (Amostras)')
ylabel('x(n)')