%% Visualizando Wavelets
clear
close all
clc

%% ECG do bebê

load BabyECGData;

%% Análise de Haart

[a,d] = haart(HR,'integer');
HaarHR = ihaart(a,d,5,'integer');

%% Plota os gráficos

figure;
plot(times,HR,times,HaarHR,'k','LineWidth',1.5), grid on
axis tight
xlabel('Horas')
ylabel('BPM')
title('Frequência cardíaca e aproximação de Haar')