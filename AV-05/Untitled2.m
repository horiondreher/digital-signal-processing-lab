% Teste com sinal chirp
close all
clear
clc

% Chirp
t_end = 5;
N = 2^10;
Fs = N/t_end;
t = linspace(0,t_end,N);
x = cos(2*pi*t.^2);

% FFT
X = fft(x);
f = linspace(0,Fs/2,N/2 + 1);
% DFT parcial
L = 2^7;
w = window(@hamming,L);

% Figuras
figure
subplot(2,2,1)
plot(t,x), grid on
title('Sinal')
xlabel('t (s)')
ylabel('x(t)')

subplot(2,2,2)
plot(t,t), grid on
title('Frequência instantânea')
xlabel('t (s)')
ylabel('f (Hz)')

subplot(2,2,3)
plot(f,2*abs(X(1:N/2+1))/N), grid on
title('FFT')
xlabel('f (Hz)')
ylabel('|X(f)|')

subplot(2,2,4)
spectrogram(x,f,[],[],Fs,'yaxis')
%colormap gray
title('DFT parcial')
xlabel('t (s)')
ylabel('f (Hz)')
figure
stem(0:length(w)-1,w), grid on