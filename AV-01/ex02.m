close all
clear
clc

%% Exerc�cio 2 - Degrau unit�rio

[n, x] = degrau(-10, 10, -5);

stem(n, x) 
grid on
xlabel('n (Amostras)')
ylabel('x(n)')