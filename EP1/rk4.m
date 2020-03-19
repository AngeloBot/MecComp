function [ Y, th ] = rk4(t_i,t_f,h,Y_0)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global th1 th2 dth1 dth2 ddth1 ddth2;
ddth1 = 0;
ddth2 = 0;
dth1=Y_0(1);
dth2=Y_0(2);
th1=Y_0(3);
th2=Y_0(4);

Y = [dth1;dth2];
th = [th1; th2];

for t = (t_i+h):h:t_f
    
    [A,A0,A5]=Calc_A();
    [B,B0,B4]=Calc_B();
   
    X = [ddth1 (dth1^2) (dth2^2) dth1 dth2];

    ddth1=(A*X'+A5)/A0;
    X = [ddth1 (dth1^2) (dth2^2) dth1 dth2];
    ddth2=(B*X'+B4)/B0;

    K1 = [ddth1; ddth2];

    %%%%% K2
    t = t + h/2;
    dth1 = dth1 + h*K1(1)/2;
    dth2 = dth2 + h*K1(2)/2;
    th1 = th1 + h*K1(1)/2;
    th2 = th2 + h*K1(2)/2;
    [A,A0,A5]=Calc_A();
    [B,B0,B4]=Calc_B();
    ddth1=(A*X'+A5)/A0;

    K2 = [(A*X'+A5)/A0; (B*X'+B4)/B0];

    t = t - h/2;
    th1 = th1 - h*K1(1)/2;
    th2 = th2 - h*K1(2)/2;
    dth1 = dth1 - h*K1(1)/2;
    dth2 = dth2 - h*K1(2)/2;
    [A,A0,A5]=Calc_A();
    [B,B0,B4]=Calc_B();
    ddth1=(A*X'+A5)/A0;

    %%%% K3

    t = t + h/2;
    dth1 = dth1 + h*K2(1)/2;
    dth2 = dth2 + h*K2(2)/2;
    th1 = th1 + h*K2(1)/2;
    th2 = th2 + h*K2(2)/2;
    [A,A0,A5]=Calc_A();
    [B,B0,B4]=Calc_B();
    ddth1=(A*X'+A5)/A0;

    K3 = [(A*X'+A5)/A0; (B*X'+B4)/B0];

    t = t - h/2;
    th1 = th1 - h*K2(1)/2;
    th2 = th2 - h*K2(2)/2;
    dth1 = dth1 - h*K2(1)/2;
    dth2 = dth2 - h*K2(2)/2;
    [A,A0,A5]=Calc_A();
    [B,B0,B4]=Calc_B();
    ddth1=(A*X'+A5)/A0;

    %%%% K4

    t = t + h;
    dth1 = dth1 + h*K2(1);
    dth2 = dth2 + h*K2(2);
    th1 = th1 + h*K2(1);
    th2 = th2 + h*K2(2);
    [A,A0,A5]=Calc_A();
    [B,B0,B4]=Calc_B();
    ddth1=(A*X'+A5)/A0;

    K4 = [(A*X'+A5)/A0; (B*X'+B4)/B0];

    t = t - h;
    th1 = th1 - h*K2(1);
    th2 = th2 - h*K2(2);
    dth1 = dth1 - h*K2(1);
    dth2 = dth2 - h*K2(2);
    [A,A0,A5]=Calc_A();
    [B,B0,B4]=Calc_B();
    ddth1=(A*X'+A5)/A0;
    
    Y_f = Y(:,length(Y(1,:))) + (h/6)*(K1 + 2*K2 + 2*K3 + K4);
    th_f = th(:,length(th(1,:))) + h*Y_f;
    Y = cat(2, Y, Y_f);
    th = cat(2, th, th_f);
    
    dth1 = dth1 + (h/6)*(K1(1) + 2*K2(1) + 2*K3(1) + K4(1));
    dth2 = dth2 + (h/6)*(K1(2) + 2*K2(2) + 2*K3(2) + K4(2));
    th1 = th1 + h*dth1;
    th2 = th2 + h*dth2;
    
end
end

