close all
clear
clc

%% Exerc�cio 1 - Suprimir ru�do

x = audioread('Counting-16-44p1-mono-15secs.wav');
x = x(:);

Fs = 44.1e3; % frequ�ncia de amostragem
th = 0.07; % amplitude threshold
L = 150; % tamanho da janela

r = rem(length(x), L); % resto da divis�o para n�mero de janelas iguais
x = [x; zeros(L-r, 1)]; % adiciona zeros para divis�o igual de janelas 
t = (0:length(x) - 1)/Fs; % amostrar

%plota audio original
figure
subplot(2, 1, 1);
plot(t,x), grid on
hold on

%% Supress�o

% se valor de th estiver contido em todo intervalo, este recebe 0
for i = 0:(length(x)-L)/L 
   if all(x(i*L+1:(i+1)*L) <= th)
       x(i*L+1:(i+1)*L) = 0;
   end
end

% plota audio com ru�dos suprimidos
subplot(2, 1, 2);
plot(t,x), grid on;
hold off

player = audioplayer(x,Fs);
play(player);

