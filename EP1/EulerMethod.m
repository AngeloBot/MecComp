function [E] = EulerMethod(t_i,t_f,h,Y_0)
%EulerMethod - Aplica o método de Euler
%   Y_0=[dth1_0 dth2_0 th1_0 th2_0]
global th1 th2 dth1 dth2 ddth1 ddth2;
ddth1 = 0;
ddth2 = 0;
dth1=Y_0(1);
dth2=Y_0(2);
th1=Y_0(3);
th2=Y_0(4);

[A,A0,A5]=Calc_A();
[B,B0,B4]=Calc_B();

Y=[ddth1 (dth1^2) (dth2^2) dth1 dth2];
ddth1=(A*Y'+A5)/A0;
Y=[ddth1 (dth1^2) (dth2^2) dth1 dth2];
ddth2=(B*Y'+B4)/B0;

E=[th1;
   th2;
   dth1;
   dth2;
   ddth1;
   ddth2];

for i=(t_i+h):h:t_f
    
    dth1=dth1+h*ddth1;
    dth2=dth2+h*ddth2;
    th1=th1+h*dth1;
    th2=th2+h*dth2;
    
    [A,A0,A5]=Calc_A();
    [B,B0,B4]=Calc_B();

    Y=[ddth1 (dth1^2) (dth2^2) dth1 dth2];
    ddth1=(A*Y'+A5)/A0;
    Y=[ddth1 (dth1^2) (dth2^2) dth1 dth2];
    ddth2=(B*Y'+B4)/B0;
    
    result_vect=[th1;
                 th2;
                 dth1;
                 dth2;
                 ddth1;
                 ddth2];

    E=cat(2,E,result_vect);
    
end

end

