%EP1 - MecComp
%1o SEM 2020
%Ângelo Bianco Yanagita 6649978
%Rodrigo Heira Akamine NUSP

%Definição de Parâmetros e Constantes:
global th1;
global th2;
global dth1;
global dth2;
global ddth1;
global ddth2;

global L1;
global L2;
global L2e;
global m1;
global m2;
global g;
global F1;
global F2;
global uIz;
global R;
global dx_d;
global Vel;

L1=2;%m
L2=2.5;%m
L2e=1.8;%m
m1=450;%kg
m2=650;%kg
g=9.81;%m/(s^2)
F1=-0.5*m1*g;%N
F2=-0.5*m2*g;%N
uIz=2.7;%kg.(m^2)
R=0.3;%m
dx_d=80;%km/h
Vel=dx_d;%km/h

EulerMethod(t_i,t_f,h,Y_0);


