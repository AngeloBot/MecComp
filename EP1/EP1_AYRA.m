%EP1 - MecComp
%1o SEM 2020
%�ngelo Bianco Yanagita 6649978
%Rodrigo Heira Akamine 10262565


clear all;
close all;
clc;
global L1 L2 L2e m1 m2 g F1 F2 uIz R dx_d Vel;
%Defini��o de Par�metros e Constantes:

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


t_i=input('Tempo inicial(s): ','s');
t_i = str2num(t_i);
t_f=input('Tempo final(s): ','s');
t_f = str2num(t_f);
h=input('Passo(s): ','s');
h = str2num(h);
Y_0=input('vetor de CI(SI)[dth1,dth2,th1,th2]: ','s');
Y_0 = str2num(Y_0);

which_run=input('Qual m�todo rodar: Euler(E) / RK2(rk2) / RK4(rk4): ','s'); 

if which_run=='E'
    
    figure(1);
    t=t_i:h:t_f;
    y= EulerMethod(t_i,t_f,h,Y_0);
    titulo = strcat('Metodo de Euler com passo h=', num2str(h));
end

if which_run=='rk2'
    [Y,ddth] = rk2(t_i,t_f,h,Y_0);
    t = t_i:h:t_f;
    y = cat(1, Y, ddth);
    titulo = strcat('Runge-Kutta 2�Ordem com passo h=', num2str(h));
    theta = cat(1, Y(1:2,:), t);
end

if which_run=='rk4'
    [Y,ddth] = rk4(t_i,t_f,h,Y_0);
    t = t_i:h:t_f;
    y = cat(1, Y, ddth);
    titulo = strcat('Runge-Kutta 4�Ordem com passo h=', num2str(h));
    theta = cat(1, Y(1:2,:), t);
end

figure(1);
hold on;
a = title(titulo);
a.FontSize = 18;
grid();
plot(t,y);
xlabel('$Tempo (s)$', 'Interpreter', 'latex');
hlegend = legend('$\theta_1 \\ (rad)$', '$\theta_2 \\ (rad)$', '$\dot{\theta_1} \\ (rad/s)$', '$\dot{\theta_2} \\ (rad/s)$', '$\ddot{\theta_1} \\ (rad/s^2)$', '$\ddot{\theta_2} \\ (rad/s^2)$');
set(hlegend, 'Interpreter', 'latex');
hlegend.FontSize = 14;
hold off;

figure(2);
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
