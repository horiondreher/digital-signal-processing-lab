%% Visualizando Wavelets
clear
close all
clc

%% ECG do beb�

load BabyECGData;

%% An�lise de Haart

[a,d] = haart(HR,'integer');
HaarHR = ihaart(a,d,5,'integer');

%% Plota os gr�ficos

figure;
plot(times,HR,times,HaarHR,'k','LineWidth',1.5), grid on
axis tight
xlabel('Horas')
ylabel('BPM')
title('Frequ�ncia card�aca e aproxima��o de Haar')