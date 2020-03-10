function [ddth1] = Calc_ddtheta1(Y,A,A0,A5)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

ddth1=(A*Y+A5)/A0;

end

