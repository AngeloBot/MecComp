function [ Yout, ddth ] = rk4_geral( F , t_i, t_f, h, Y0 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Yout = Y0;
Y = Y0;
dy0dt = F(t_i,Y0);
ddth = dy0dt;

for t=(t_i+h):h:t_f
    k1 = F(t, Y);
    k2 = F(t + h/2, Y + (k1*h/2));
    k3 = F(t + h/2, Y + (k2*h/2));
    k4 = F(t + h, Y + (k3*h));
    Y = Y + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
    Yout = [Yout, Y];
    ddth = [ddth, k1];
end
end

