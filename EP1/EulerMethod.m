function [E] = EulerMethod(t_i,t_f,h,Y_0)
%EulerMethod - Aplica o m�todo de Euler
%   Y_0=[dth1_0 dth2_0 th1_0 th2_0]
global th1 th2 dth1 dth2 ddth1 ddth2;
dth1=Y_0(1);
dth2=Y_0(2);
th1=Y_0(3);
th2=Y_0(4);


Y=[0 (dth1^2) (dth2^2) dth1 dth2];

[A,A0,A5]=Calc_A();
[B,B0,B4]=Calc_B();

ddth1=(A*Y'+A5)/A0;
Y=[ddth1 (dth1^2) (dth2^2) dth1 dth2];
ddth2=(B*Y'+B4)/B0;

E=[ddth1;
ddth2;
dth1;
dth2;
th1;
th2];

for i=(t_i+h):h:t_f

    [A,A0,A5]=Calc_A();
    [B,B0,B4]=Calc_B();

    ddth1=(A*Y'+A5)/A0;
    Y=[ddth1 (dth1^2) (dth2^2) dth1 dth2];
    ddth2=(B*Y'+B4)/B0;
    
    result_vect=[ddth1;
    ddth2;
    dth1;
    dth2;
    th1;
    th2];

    E=cat(2,E,result_vect);
    
    dth1=dth1+h*ddth1;
    dth2=dth2+h*ddth2;
    th1=th1+h*dth1;
    th2=th2+h*dth2;
    
    Y=[ddth1 (dth1^2) (dth2^2) dth1 dth2];
    
end

end

