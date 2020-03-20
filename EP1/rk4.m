function [ Yout, dydt, t ] = rk4_geral( F , t_i, t_f, h, Y0 )
%{
Runge-Kutta 4ºOrdem para a solução de EDO's
    A função recebe 5 inputs:
    - F: dYdt = @(t,y) [f1; f2; f3;...]
    - t_i: tempo inicial
    - t_f: tempo final
    - h: passo
    - Y0: condições iniciais

    E devolve 3 outputs:
    - Yout: array resposta com os pontos da função y
    - dydt: array com todos as derivadas de y
    - t: array com os tempos de cada passo
%}

% Passo 0
Yout = Y0;
Y = Y0;
dy0dt = F(t_i,Y0);
dydt = dy0dt;

% Repetição do método de Runge Kutta para os próximos passos
for t=(t_i+h):h:t_f
    % Cálculo dos termos k's
    k1 = F(t, Y);
    k2 = F(t + h/2, Y + (k1*h/2));
    k3 = F(t + h/2, Y + (k2*h/2));
    k4 = F(t + h, Y + (k3*h));
    
    % Cálculo do y(i+1)
    Y = Y + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
    Yout = [Yout, Y];
    dydt = [dydt, k1];
end
t = t_i:h:t_f;
end

