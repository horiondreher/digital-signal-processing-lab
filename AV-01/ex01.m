close all
clear
clc

%% Exerc�cio 1 - Pot�ncia

n = 0:8;
x = 0.5.^n;

stem(n, x) 
grid on
xlabel('n (Amostras)')
ylabel('x(n)')