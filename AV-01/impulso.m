function [n,x] = impulso(M,N,m)

% Produz impulso deslocado de m, no
% intervalo [M,N].
% [n,x] = impulso(M,N,m)
% Argumentos de entrada
% M: limite inferior do sinal
% N: limite superior do sinal
% m: posicao do impulso
% Argumentos de saida
% n: indices do sinal
% x: sinal impulso deslocado

if ~isnumeric([M,N,m])
    error('Argumentos de entrada devem ser numeros.')
end

if M~=round(M) || N~=round(N) || m~=round(m)
    error('Argumentos de entrada evem ser inteiros.')
end

if M>=N
    error('N deve ser maior que M.')
end

n = M:N;
x = double((n-m)==0);