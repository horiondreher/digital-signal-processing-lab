close all
clear
clc

%% Audio
[x, Fs] = audioread('Sample_WAV_10MG.wav');
x = sum(x, 2);
x = x(1:round(end/8));
N = length(x);
t = linspace(0, N/Fs, N);

%% FFT
X = fft(x);
f = linspace(0,Fs/2,N/2 + 1);
w = 2*pi*f;

%% DFT parcial
L = 2^7;
noverlap = 2^4;
w1 = window(@rectwin,L);
w2 = window(@bartlett,L);
w3 = window(@gausswin,L);
w4 = window(@blackman,L);

%% Plot Audio e FFT

figure
subplot(2,1,1)
plot(t,x), grid on
title('Sinal')
xlabel('t (s)')
ylabel('x(t)')

subplot(2,1,2)
plot(f,2*abs(X(1:N/2+1))/N), grid on
title('FFT')
xlabel('f (Hz)')
ylabel('|X(f)|')

%% Figuras para Espectograma
figure
subplot(2,2,1)
spectrogram(x,w1,[],[], Fs,'yaxis')
view(-45,65);
colormap gray
title('Retangular')

subplot(2,2,2)
spectrogram(x,w2,[],[], Fs,'yaxis')
view(-45,65)
colormap gray
title('Bartlett')

subplot(2,2,3)
spectrogram(x,w3,[],[], Fs,'yaxis')
view(-45,65)
colormap gray
title('Gaussiana')

subplot(2,2,4)
spectrogram(x,w4,[],[], Fs,'yaxis')
view(-45,65)
colormap gray
title('Blackman')