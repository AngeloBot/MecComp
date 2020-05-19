function [ddth2] = Calc_ddtheta2(Y,B,B0,B4)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

ddth2=(B*Y+B4)/B0;

end

