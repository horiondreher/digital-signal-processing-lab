close all
clear
clc

%% Exerc�cio 03 - Detec��o de Borda

[t, x] = degrau(1, 10000, 5000);
SNR = 20; % ru�do
n = -10:10;
N = 5;

x = awgn(x,SNR,'measured'); %adiciona ru�do

figure
subplot(3, 1, 1);
plot(t,x), grid on
hold on

%% Detec��o de Borda com Signal

h1 = sign(n);
x1 = conv(x, h1, 'same');
 
subplot(3, 1, 2);
plot(t, x1), grid on

%% Detec��o de borda com derivada gaussiana

h2 = -n.*exp(-8*n.^2/N^2);
x2 = conv(x, h2, 'same');

subplot(3, 1, 3);
plot(t, x2), grid on

