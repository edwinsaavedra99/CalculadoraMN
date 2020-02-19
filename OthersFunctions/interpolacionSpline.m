function interpolacionSpline(x,y)
    %clc, clear 
    %x=input('dame los valores de x: ') ; 
    %y=input('dame los valores de y: ') ; 
    intervalo=0:1:3 ; 

    f=interp1(x,y,intervalo,'slpine') ; 
    figure(gcf) 
    plot(x,y,'o',intervalo,f,'r') 

    % este parte imprime el polinomio 
    s=1; F=0; n=length(intervalo); 
    syms X 
    for i=2:n 
    s=expand(s*(X-intervalo(i-1))); 
    F=F+f(i)*s; 
    end 
    F=F+f(1) 
end