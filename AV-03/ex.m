close all
clear
clc

%% Exercício 1 - Filtro de Butterworth

% Parâmetros
N = 4; %Ordem
wn = 0.5; 
ftype = 'low'; %Filtro passa-baixa


%% Filtros
[A,B,C,D] = butter(N,wn,ftype); % Forma direta com Espaço de Estados
[b, a] = ss2tf(A, B, C, D);

figure(1);
freqz(b,a,[0:pi/10000:pi/10])

[z, p, k] = butter(N, wn, ftype); % Forma Cascata
[sos, g] = zp2sos(z,p,k);
sos2 = ss2sos(A, B, C, D); 

figure(2);
freqz(sos,[0:pi/10000:pi/10])

[r,p,k] = residuez(b,a); % Forma Pararela
[C, B, A] = dir2par(b,a);

%% Exercício 2 - Resposta Impulsiva

[H, T1] = impz(b,a); % Resposta impulsiva para forma direta
[H1, T2] = impz(sos2); % Resposta impulsiva para forma cascata

figure(4)
stem(T1, H), hold on
stem(T2, H1, 'x');