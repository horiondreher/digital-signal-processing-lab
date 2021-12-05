close all
clear
clc

%% Áudio com ruído

x = audioread('Counting-16-44p1-mono-15secs.wav');
x = x(:);

Fs = 44.1e3; % frequência de amostragem
t = (0:length(x) - 1)/Fs; % número de amostras
SNR = 5; % ruído
n = 1:20;
N = 10;

x = awgn(x,SNR,'measured'); %adiciona ruído
player = audioplayer(x,Fs);

figure
subplot(3, 1, 1);
plot(t,x), grid on
hold on

%% Filtro Média Móvel

h1 = ones(2*N+1, 1)/(2*N+1); % filtro média móvel
x1 = filter(h1, 1, x); % aplicação do filtro

subplot(3, 1, 2);
plot(t,x1), grid on

%% Filtro Gaussiano

h2 = exp((-9*x(n).^2)/(2*N^2)); % filtro gaussiano
h2 = h2/norm(h2);
x2 = filter(h2, 1, x); % aplicação do filtro

subplot(3, 1, 3);
plot(t,x2), grid on

player1 = audioplayer(x1,Fs);
player2 = audioplayer(x2,Fs);

