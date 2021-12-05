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

Rp = 1; % Ripple da banda de passagem
Rs = 40; % Ripple da banda de rejeição
Wp = 1000/Fn;
Ws = 500/Fn;

%% Filtro Butterworth

[n1, Wn1] = buttord(Wp, Ws, Rp, Rs);
[b1, a1] = butter(n1, Wn1, 'high');
y1 = filter(b1, a1, x);
% [A1, B1, C1, D1] = butter(n1, Wn1, 'high');
% Hd1 = dfilt.statespace(A1, B1, C1, D1);
% y1 = filter(Hd1, x);

figure(1)
subplot(2, 1, 1)
freqz(b1, a1, 1000);
subplot(2, 1, 2);
grpdelay(b1, a1, 1000);
%fvtool(Hd1);

figure(2)
subplot(2, 1, 1)
plot(t, x);
subplot(2, 1, 2);
plot(t, y1);

%% Filtro Chebyschev Tipo I 

[n2, Wn2] = cheb1ord(Wp, Ws, Rp, Rs);
[b2, a2] = cheby1(n2, Rp, Wn2, 'high');
y2 = filter(b2, a2, x);

figure(3)
subplot(2, 1, 1)
freqz(b2, a2, 1000);
subplot(2, 1, 2);
grpdelay(b2, a2, 1000);

figure(4)
subplot(2, 1, 1)
plot(t, x);
subplot(2, 1, 2);
plot(t, y2);

%% Filtro Chebyschev Tipo II

[n3, Wn3] = cheb2ord(Wp, Ws, Rp, Rs);
[b3, a3] = cheby2(n3, Rs, Wn3, 'high');

y3 = filter(b3, a3, x);
figure(5)
subplot(2, 1, 1)
freqz(b3, a3, 1000);
subplot(2, 1, 2);
grpdelay(b3, a3, 1000);

figure(6)
subplot(2, 1, 1)
plot(t, x);
subplot(2, 1, 2);
plot(t, y3);

%% Filtro Elíptico

[n4, Wn4] = ellipord(Wp, Ws, Rp, Rs);
[b4, a4] = ellip(n4, Rp, Rs, Wn4, 'high');

y4 = filter(b4, a4, x);
figure(7)
subplot(2, 1, 1)
freqz(b4, a4, 1000);
subplot(2, 1, 2);
grpdelay(b4, a4, 1000);

figure(8)
subplot(2, 1, 1)
plot(t, x);
subplot(2, 1, 2);
plot(t, y4);

