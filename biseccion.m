function [c,k]= biseccion(y,a,b,e)
    clc
    syms x
   % y=input('Ingrese la funcion: ')
  %  a=input('Ingrese limite inferior: ')
  %  b=input('Ingrese limite superior: ')
  %  e=input('Ingrese el error: ')
    fa=subs(y,x,a);
    fb=subs(y,x,b);
    k=0;
    if(fa*fb>0)
        disp('No esxites raiz!!!')
        %break
    end
    error=b-a;
    while error>e
    %while k<=6
        c=(a+b)/2;
        fc=subs(y,x,c);
        if(fc==0)
            a=c;
            b=c;
        elseif fa*fc<0
            b=c;
            fb=fc;
        else
            a=c;
            fa=fc;
        end
        error=b-a;
        k=k+1;
    end
    fprintf('El valor de la raiz es : %0.2f\n',c)
    fprintf('El numero de interacciones es : %d\n',k)
end