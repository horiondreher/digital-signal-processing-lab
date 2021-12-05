%% Exercício
clear
close all
clc

%% Carregar sinal

load relatedsig;
%% Análise de haaart 

s1 = s1(1:end-1);
s2 = s2(1:end-1);
s3 = s3(1:end-1);

[a1,d1] = haart(s1,'integer');
Haars1 = ihaart(a1,d1,2,'integer');
[a2,d2] = haart(s2,'integer');
Haars2 = ihaart(a2,d2,2,'integer');
[a3,d3] = haart(s3,'integer');
Haars3 = ihaart(a3,d3,2,'integer');

figure;
subplot(2, 2, 1);
plot(xcorr(s1, s2));
title('Correlação com os sinais originais');
subplot(2, 2, 2);
plot(xcorr(Haars1, Haars2));
title('Correlação com transformada de haars');
subplot(2, 2, 3);
plot(xcorr(s1, s3));
subplot(2, 2, 4);
plot(xcorr(Haars1, Haars3));

