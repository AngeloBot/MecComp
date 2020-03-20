function [ Yout, dydt, t] = euler( F , t_i, t_f, h, Y0 )
%Euler method
%   Detailed explanation goes here

% Passo 0
Yout = Y0;
Y = Y0;
dy0dt = F(t_i,Y0);
dydt = dy0dt;

% Repetição do método de Runge Kutta para os próximos passos
for t=(t_i+h):h:t_f
    % Cálculo do y(i+1)
    Y = Y + h*F(t, Y);
    Yout = [Yout, Y];
    dydt = [dydt, F(t,Y)];
end
t = t_i:h:t_f;

end

