%% Visualizando Wavelets
clear
close all
clc

%% Wavelet de Haar

[phi,psi,x] = wavefun('haar',10);

%% Descarta os valores extremos(todos zeros)

x = x(2:end-1);
psi = psi(2:end-1);
phi = phi(2:end-1);

%% Plota os gráficos

[hl,hLine1,hLine2] = plotyy(x,psi,x,phi); grid on

hLine1.LineStyle = '-';
    hLine1.LineWidth = 1;
    hLine1.Color = 'k';
hLine2.LineStyle = '--';
    hLine2.LineWidth = 1;
    hLine2.Color = 'k';
    
xlabel('t')
xlim(hl(:),[min(x) max(x)])
ylabel(hl(1),'\psi(t)','Color','k')
yticks(hl(1),[-1 0 1])
ylim(hl(1),[-1.1 1.1])
ylabel(hl(2),'\phi(t)','Color','k')
yticks(hl(2),[0 1 2])
ylim(hl(2),[-0.1 2.1])
title('Wavelet de Haar')