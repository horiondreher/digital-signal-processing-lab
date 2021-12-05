close all
clear
clc

%% Exercício 4 - Remoção de Eco

voice = audioread('speech_dft_8kHz.wav');
Fs = 8e3;
alpha = 0.5;
lag = 0.3;
z = 1:10;

pad = zeros(round(Fs*lag),1);
audio = [voice;pad];
echo = [pad;voice]*alpha;
x = audio + echo;

t = (0:length(audio) - 1)/Fs;

figure(1)
plot(t ,audio)
hold on
plot(t,echo)
grid on

player1 = audioplayer(x,Fs);

%% Filtragem do Eco

[r, lags] = xcorr(x, 'coeff');
r = r(lags>0.01/Fs);
lags = lags(lags>0.01/Fs);
[beta, delta] = findpeaks(r, lags, 'MinPeakHeight', 0.35);

figure(2)
subplot(2, 1, 1);
plot(lags, r);

b = 1;
a = [1 zeros(1, delta(1)-1) beta(1)];

y = filter(b, a, x);

figure(2)
subplot(2, 1, 2);
plot(y);

player2 = audioplayer(y,Fs);

