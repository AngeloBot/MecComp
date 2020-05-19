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


t_i = input('Tempo inicial(s): ', 's');
t_i = str2double(t_i);
t_f = input('Tempo final(s): ', 's');
t_f = str2double(t_f);
h = input('Passo(s): ', 's');
h = str2double(h);
%Y_1 = input('vetor de CI(SI)[th1, th2, dth1, dth2]: ', 's');
%Y_0 = str2double(Y_1);
Y_0 = [0; 0; 0.4; -0.1];

which_run=input('Qual método rodar: Euler(E) / RK2(rk2) / RK4(rk4): ', 's'); 

if strcmp(which_run, 'E')
    [Y,dydt,t] = euler(@foo,t_i,t_f,h,Y_0);
    y = cat(1, Y, dydt(length(dydt(:,1))-1:length(dydt(:,1)),:));
    titulo = strcat('Metodo de Euler com passo h=', num2str(h));

elseif strcmp(which_run, 'rk2')
    [Y,dydt,t] = rk2(@foo,t_i,t_f,h,Y_0);
    y = cat(1, Y, dydt(length(dydt(:,1))-1:length(dydt(:,1)),:));
    titulo = strcat('Runge-Kutta 2ºOrdem com passo h=', num2str(h));

elseif strcmp(which_run, 'rk4')
    [y, dydt] = rk4(@foo, t_i, t_f, h, Y_0);
    t = t_i:h:t_f;
    titulo = strcat('Runge-Kutta 4ºOrdem com passo h=', num2str(h));
    y = cat(1, y, dydt(length(dydt(:,1))-1:length(dydt(:,1)), :));
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
