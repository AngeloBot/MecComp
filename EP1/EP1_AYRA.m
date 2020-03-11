%EP1 - MecComp
%1o SEM 2020
%Ângelo Bianco Yanagita 6649978
%Rodrigo Heira Akamine NUSP

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
dx_d=80;%km/h
Vel=dx_d;%km/h

t_i=input('Tempo inicial(s) ','s');
t_f=input('Tempo final(s) ','s');
h_max=input('Passo máximo(s) ','s');
h_min=input('Passo mínimo(s) ','s');
h_var=input('número de incrementos de passo ','s');
Y_0=input('vetor de CI(SI)[dth1,dth2,th1,th2] ','s');

t_i = str2num(['uint8(',t_i,')']);
t_f= str2num(['uint8(',t_f,')']);
h_max= str2num(['uint8(',h_max,')']);
h_min= str2num(['uint8(',h_min,')']);
h_var= str2num(['uint8(',h_var,')']);
Y_0=str2num(Y_0);

which_run=input('Qual método rodar: Euler(E) ','s'); 

if which_run=='E'
    
    figure(1);
    
    t=t_i:h_min:t_f;
    E={EulerMethod(t_i,t_f,h_min,Y_0), num2str(h_min), t};
    a=E(1);
    whos a
    plot(t,E(1));
    hold on;
    
    for h=linspace(h_min,h_max,h_var)
        
        t=t_i:h:t_f;
        result_vect={EulerMethod(t_i,t_f,h,Y_0), num2str(h), t};
        plot(t,result_vect(1));
        
        E=cat(2,E,result_vect);
    end
    
    xlabel('Tempo(s)');
    ylabe('Ângulo(s)');
    legend(E(2,:));
    title('Método de Euler');
    
    hold off;
end

