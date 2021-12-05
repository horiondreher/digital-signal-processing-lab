close all
clear
clc

%% Resultado Ex 01

yEx01 = load('ResultEx01.mat');
yEx01 = yEx01.y';

%% Parâmetros

[x, Fs] = audioread('Sample_WAV_10MG.wav');
x = sum(x, 2);
x = x(1:round(end/8));
x = x(:)';
h = load('filterEX1.mat');
h = h.h';
L = 10000;

%% Convolução Rápida

M=length(h); %tamanho do filtro h
N=length(x); %tamamho de x

r=rem(N,L); % resto para verificar quantas amostras completar com zeros
x1=[x zeros(1,L-r)]; %completar sinal com zeros
h1=[h zeros(1,L-1)]; 

NC=(length(x1))/L; % número de blocos
Hk=fft(h1);   

for k=1:NC                             
    SgnBlk(k,:)=x1(((k-1)*L+1):k*L);  %separa o sinal em blocos
    if k==1
        M1(k,:)=[zeros(1,M-1) SgnBlk(k,:)];  %completa primeiro bloco com 0
    else 
        M1(k,:)=[SgnBlk(k-1,(L-M+2):L) SgnBlk(k,:)];
    end
   
    Xk=fft(M1(k,:));       
    Yk=Xk.*Hk; % aplica a convolução             
    yk(k,:)=ifft(Yk);  % fft inversa    
end

M3=yk(:,M:(L+M-1));         
y1=M3';                    
yR=y1(:)'; %sinal final em vetor

N1 = length(x);
t1 = linspace(0, N1/Fs, N1);

N2 = length(yR);
t2 = linspace(0, N2/Fs, N2);

figure(2);
subplot(2, 1, 1)
plot(t1, x);
subplot(2, 1, 2);
plot(t2, yR);

yR = yR(1:length(yEx01));
norm(yEx01 - yR)