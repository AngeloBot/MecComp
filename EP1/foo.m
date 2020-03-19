function dydt = foo (t,y)
%foo Summary of this function goes here
%   y = [th1, th2, dth1, dth2]

global L1 L2 L2e m1 m2 F1 F2 uIz R Vel;
%{
A0 = L1^2 * L2 * R * (m2*cos(2*y(1) - 2*y(2)) - 2*m1 - m2);
A1 = L1^2 * L2 * R * m2 * sin(2*y(1) - 2*y(2));
A2 = 2 * L1 * L2^2 * R * m2 * sin(y(1) - y(2));
A3 = -2 * L2 * uIz * Vel;
A4 = -2 * L1 * uIz * Vel * cos(y(1) - y(2));
A5 = -R * L1 * (L2e * F2 * sin(y(1) - y(2)) + 2 * sin(y(1)) * (F1 * L2 + (L2e * F2)/2));

ddth1 = (A1*y(3)^2 + A2*y(4)^2 + A3*y(3) + A4*y(4) + A5)/A0;

B0 = L2^2 * R * m2;
B1 = -L1 * L2 * R * m2 * cos(y(1) - y(2));
B2 = L1 * L2 * R * m2 * sin(y(1) - y(2));
B3 = - uIz * Vel;
B4 = L2e * sin(y(2)) * R * F2;
%}

dydt = [y(3);
        y(4);
        ((L1^2 * L2 * R * m2 * sin(2*y(1) - 2*y(2)))*y(3)^2 + (2 * L1 * L2^2 * R * m2 * sin(y(1) - y(2)))*y(4)^2 + (-2 * L2 * uIz * Vel)*y(3) + (-2 * L1 * uIz * Vel * cos(y(1) - y(2)))*y(4) + (-R * L1 * (L2e * F2 * sin(y(1) - y(2)) + 2 * sin(y(1)) * (F1 * L2 + (L2e * F2)/2))))/(L1^2 * L2 * R * (m2*cos(2*y(1) - 2*y(2)) - 2*m1 - m2));
        ((-L1 * L2 * R * m2 * cos(y(1) - y(2))) * (((L1^2 * L2 * R * m2 * sin(2*y(1) - 2*y(2)))*y(3)^2 + (2 * L1 * L2^2 * R * m2 * sin(y(1) - y(2)))*y(4)^2 + (-2 * L2 * uIz * Vel)*y(3) + (-2 * L1 * uIz * Vel * cos(y(1) - y(2)))*y(4) + (-R * L1 * (L2e * F2 * sin(y(1) - y(2)) + 2 * sin(y(1)) * (F1 * L2 + (L2e * F2)/2))))/(L1^2 * L2 * R * (m2*cos(2*y(1) - 2*y(2)) - 2*m1 - m2))) + (L1 * L2 * R * m2 * sin(y(1) - y(2))) * y(3)^2 + (- uIz * Vel) * y(4) + (L2e * sin(y(2)) * R * F2))/(L2^2 * R * m2)];

end
