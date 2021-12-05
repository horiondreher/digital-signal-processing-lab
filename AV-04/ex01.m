close all
clear
clc

%% Parâmetros de áudio e filtro

[x, Fs] = audioread('Sample_WAV_10MG.wav');
x = sum(x, 2);
x = x(1:round(end/8));
N = length(x);
t = linspace(0, N/Fs, N);
Fn = Fs/2;

Rp = 0.5; % Ripple da banda de passagem
Rs = 40; % Ripple da banda de rejeição
a = [0 1];   % Amplitude do Ripple (Passa alta)
f = [500 1000];

dev = [10^(-Rs/20) (10^(Rp/20)-1)/(10^(Rp/20)+1)]; 
%% Filtro FIR

[n, Fo, ao, w] = firpmord(f, a, dev, Fs);
b = firpm(n, Fo, ao, w);
y = filter(b, 1, x);

[h, T1] = impz(b, 1);

figure
subplot(2, 1, 1)
plot(t, x);
subplot(2, 1, 2);
plot(t, y);
