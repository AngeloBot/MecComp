function [ Y, ddth ] = rk4(t_i,t_f,h,Y_0)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global th1 th2 dth1 dth2 ddth1 ddth2;
ddth1 = 0;
ddth2 = 0;
dth1=Y_0(1);
dth2=Y_0(2);
th1=Y_0(3);
th2=Y_0(4);

Y = [th1;th2;dth1;dth2];

[A,A0,A5]=Calc_A();
[B,B0,B4]=Calc_B();

X = [ddth1 (dth1^2) (dth2^2) dth1 dth2];
ddth1=(A*X'+A5)/A0
X = [ddth1 (dth1^2) (dth2^2) dth1 dth2];
ddth2=(B*X'+B4)/B0

ddth = [ddth1; ddth2];

for t = (t_i+h):h:t_f
    
    [A,A0,A5]=Calc_A();
    [B,B0,B4]=Calc_B();
    ddth1=(A*X'+A5)/A0;
    X = [ddth1 (dth1^2) (dth2^2) dth1 dth2];
    ddth2=(B*X'+B4)/B0;
    
    %%%%% K1
    
    K1 = [dth1; dth2; ddth1; ddth2];
    
    %%%%% K2

    dth1 = dth1 + h*K1(3)/2;
    dth2 = dth2 + h*K1(4)/2;
    th1 = th1 + h*K1(1)/2;
    th2 = th2 + h*K1(2)/2;
    [A,A0,A5]=Calc_A();
    [B,B0,B4]=Calc_B();
    ddth1=(A*X'+A5)/A0;
    X = [ddth1 (dth1^2) (dth2^2) dth1 dth2];
    ddth2=(B*X'+B4)/B0;
    
    K2 = [dth1; dth2; ddth1; ddth2];

    th1 = th1 - h*K1(1)/2;
    th2 = th2 - h*K1(2)/2;
    dth1 = dth1 - h*K1(3)/2;
    dth2 = dth2 - h*K1(4)/2;
    [A,A0,A5]=Calc_A();
    [B,B0,B4]=Calc_B();
    ddth1=(A*X'+A5)/A0;
    X = [ddth1 (dth1^2) (dth2^2) dth1 dth2];
    ddth2=(B*X'+B4)/B0;
    
    %%%% K3

    dth1 = dth1 + h*K2(3)/2;
    dth2 = dth2 + h*K2(4)/2;
    th1 = th1 + h*K2(1)/2;
    th2 = th2 + h*K2(2)/2;
    [A,A0,A5]=Calc_A();
    [B,B0,B4]=Calc_B();
    ddth1=(A*X'+A5)/A0;
    X = [ddth1 (dth1^2) (dth2^2) dth1 dth2];
    ddth2=(B*X'+B4)/B0;
    
    K3 = [dth1; dth2; ddth1; ddth2];

    th1 = th1 - h*K2(1)/2;
    th2 = th2 - h*K2(2)/2;
    dth1 = dth1 - h*K2(3)/2;
    dth2 = dth2 - h*K2(4)/2;
    [A,A0,A5]=Calc_A();
    [B,B0,B4]=Calc_B();
    ddth1=(A*X'+A5)/A0;
    X = [ddth1 (dth1^2) (dth2^2) dth1 dth2];
    ddth2=(B*X'+B4)/B0;
    
    %%%% K4

    dth1 = dth1 + h*K3(3);
    dth2 = dth2 + h*K3(4);
    th1 = th1 + h*K3(1);
    th2 = th2 + h*K3(2);
    [A,A0,A5]=Calc_A();
    [B,B0,B4]=Calc_B();
    ddth1=(A*X'+A5)/A0;
    X = [ddth1 (dth1^2) (dth2^2) dth1 dth2];
    ddth2=(B*X'+B4)/B0;
    
    K4 = [dth1; dth2; ddth1; ddth2];

    th1 = th1 - h*K3(1);
    th2 = th2 - h*K3(2);
    dth1 = dth1 - h*K3(3);
    dth2 = dth2 - h*K3(4);
    [A,A0,A5]=Calc_A();
    [B,B0,B4]=Calc_B();
    ddth1=(A*X'+A5)/A0;
    X = [ddth1 (dth1^2) (dth2^2) dth1 dth2];
    ddth2=(B*X'+B4)/B0;
    
    Y_f = Y(:,length(Y(1,:))) + (h/6)*(K1 + 2*K2 + 2*K3 + K4);
    Y = cat(2, Y, Y_f);
    ddth = cat(2,ddth,[ddth1;ddth2]);
    th1 = th1 + (h/6)*(K1(1) + 2*K2(1) + 2*K3(1) + K4(1));
    th2 = th2 + (h/6)*(K1(2) + 2*K2(2) + 2*K3(2) + K4(2));
    dth1 = dth1 + (h/6)*(K1(3) + 2*K2(3) + 2*K3(3) + K4(3));
    dth2 = dth2 + (h/6)*(K1(4) + 2*K2(4) + 2*K3(4) + K4(4));
    
end
end

