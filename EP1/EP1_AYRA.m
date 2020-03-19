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

%{
t_i=input('Tempo inicial(s) ','s');
t_f=input('Tempo final(s) ','s');
h_max=input('Passo m�ximo(s) ','s');
h_min=input('Passo m�nimo(s) ','s');
h_var=input('n�mero de incrementos de passo ','s');
Y_0=input('vetor de CI(SI)[dth1,dth2,th1,th2] ','s');
%}
t_i = 0;
t_f = 10;
h_max = 1;
h_min = 0.1;
h_var = 0.1;
Y_0 = [0.4, -0.1, 0, 0];

which_run=input('Qual m�todo rodar: Euler(E) RK4(RK4)','s'); 

if which_run=='E'
    
    figure(1);
    
    t=t_i:h_min:t_f;
    E={EulerMethod(t_i,t_f,h_min,Y_0), h_min, t};
    %a=E(1);
    %whos a
    plot(t,E{1,1}(5:6,:));
    hold on;
    
    xlabel('Tempo(s)');
    ylabel('�ngulo(s)');
    legend('ddth1', 'ddth2', 'dth1', 'dth2', 'th1', 'th2');
    title(strcat('M�todo de Euler h = ', num2str(h_min)));
    grid();
    hold off;
    
    hArray = h_min:h_var:h_max;
    i = 2;
    
    for h = 1:length(hArray)
        figure(i);
        t=t_i:hArray(h):t_f;
        result_vect={EulerMethod(t_i,t_f,hArray(h),Y_0), hArray(h), t};
        plot(t,result_vect{1,1});
        hold on;
        E=cat(1,E,result_vect);
        
        xlabel('Tempo(s)');
        ylabel('�ngulo(s)');
        legend('ddth1', 'ddth2', 'dth1', 'dth2', 'th1', 'th2');
        title(strcat('M�todo de Euler h =  ', num2str(hArray(h))));
        
        i = i + 1;
        hold off;
    end
    
end

if which_run == 'RK4'
    [Y,ddth] = rk4(t_i,t_f,h_min,Y_0);
    t = t_i:h_min:t_f;
    figure(1);
    hold on;
    plot(t,Y(1:2,:));
    title('Runge Kutta 4')
    legend('th1','th2','dth1','dth2','ddth1','ddth2');
    grid();
    hold off;
    theta = cat(1, Y(1:2,:), t);
end
