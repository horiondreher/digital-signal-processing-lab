close all
clear
clc

%% Exercício 1 - Potência

n = 0:8;
x = 0.5.^n;

stem(n, x) 
grid on
xlabel('n (Amostras)')
ylabel('x(n)')