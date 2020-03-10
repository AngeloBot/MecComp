function [A,A0,A5] = Calc_A()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

A=[0 (L1^2)*L2*R*m2*sin(2*th1-2*th2) 2*L1*(L2^2)*R*m2*sin(th1-th2) -2*L2*uIz*Vel -2*L1*uIz*Vel*cos(th1-th2)];
A0=(L1^2)*L2*R*(m2*cos(2*th1-2*th2)-2*m1-m2);
A5=-R*L1*(L2e*F2*sin(th1-2*th2)+2*sin(th1)*(F1*L2+0.5*L2e*F2));

end

