%EP1 - MecComp
%1o SEM 2020
%Ângelo Bianco Yanagita 6649978
%Rodrigo Heira Akamine 10262565

clear all;
close all;
clc;
global L1 L2 L2e m1 m2 g F1 F2 uIz R dx_d Vel;
%Definição de Parâmetros e Constantes:

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
dx_d=80/3.6;%km/h
Vel=dx_d;%km/h

%{
t_i=input('Tempo inicial(s) ','s');
t_f=input('Tempo final(s) ','s');
h_max=input('Passo máximo(s) ','s');
h_min=input('Passo mínimo(s) ','s');
h_var=input('número de incrementos de passo ','s');
Y_0=input('vetor de CI(SI)[dth1,dth2,th1,th2] ','s');
%}
t_i = 0;
t_f = 60;
h = 0.01;
Y_0 = [0.4, -0.1, 0, 0];

which_run=input('Qual método rodar: Euler(E) RK4(RK4)','s'); 

if which_run=='E'
    
    figure(1);
    
    t=t_i:h:t_f;
    E={EulerMethod(t_i,t_f,h,Y_0), h, t};
    y = E{1,1};
    titulo = strcat('Metodo de Euler com passo h=', num2str(h));
end

if which_run=='rk4'
    [Y,ddth] = rk4(t_i,t_f,h,Y_0);
    t = t_i:h:t_f;
    y = cat(1, Y, ddth);
    titulo = strcat('Runge-Kutta 4ºOrdem com passo h=', num2str(h));
    theta = cat(1, Y(1:2,:), t);
end

figure(1);
suptitle(titulo);
hold on;

subplot(3,2,1);
plot(t,y(1,:));
title('$\theta_1$', 'Interpreter', 'latex');
xlabel('$Tempo (s)$', 'Interpreter', 'latex');
ylabel('$\theta_1 \\ (rad)$', 'Interpreter', 'latex');
grid();

subplot(3,2,2);
plot(t,y(2,:));
title('$\theta_2$', 'Interpreter', 'latex');
xlabel('$Tempo (s)$', 'Interpreter', 'latex');
ylabel('$\theta_2 \\ (rad)$', 'Interpreter', 'latex');
grid();

subplot(3,2,3);
plot(t,y(3,:));
title('$\dot{\theta_1}$', 'Interpreter', 'latex');
xlabel('$Tempo (s)$', 'Interpreter', 'latex');
ylabel('$\dot{\theta_1} \\ (rad/s)$', 'Interpreter', 'latex');
grid();

subplot(3,2,4);
plot(t,y(4,:));
title('$\dot{\theta_2}$', 'Interpreter', 'latex');
xlabel('$Tempo (s)$', 'Interpreter', 'latex');
ylabel('$\dot{\theta_2} \\ (rad/s)$', 'Interpreter', 'latex');
grid();

subplot(3,2,5);
plot(t,y(5,:));
title('$\ddot{\theta_1}$', 'Interpreter', 'latex');
xlabel('$Tempo (s)$', 'Interpreter', 'latex');
ylabel('$\ddot{\theta_1} \\ (rad/s^2)$', 'Interpreter', 'latex');
grid();

subplot(3,2,6);
plot(t,y(6,:));
title('$\ddot{\theta_2}$', 'Interpreter', 'latex');
xlabel('$Tempo (s)$', 'Interpreter', 'latex');
ylabel('$\ddot{\theta_2} \\ (rad/s^2)$', 'Interpreter', 'latex');
grid();

hold off;
