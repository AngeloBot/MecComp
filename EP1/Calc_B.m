function [B,B0,B4] = Calc_B()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
global th1 th2 L1 L2 L2e m2 F2 uIz R Vel;
B=[-L1*L2*R*m2*cos(th1-th2) L1*L2*R*m2*sin(th1-th2) 0 0 -uIz*Vel];
B0=(L2^2)*R*m2;
B4=L2e*sin(th2)*R*F2;

end

