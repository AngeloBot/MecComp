function [ Yout, dydt, t ] = rk2(F , t_i, t_f, h, Y0)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

Yout = Y0;
Y = Y0;
dy0dt = F(t_i,Y0);
dydt = dy0dt;

for t = (t_i+h):h:t_f
    % C�lculo dos termos k's
    k1 = F(t, Y);
    k2 = F(t + h, Y + (k1*h));
    
    % C�lculo do y(i+1)
    Y = Y + (h/2)*(k1 + k2);
    Yout = [Yout, Y];
    dydt = [dydt, k1];
end
t = t_i:h:t_f;
end