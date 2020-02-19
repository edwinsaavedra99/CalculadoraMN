function [resultado,err]=terceraregresiva(fx,xi,xh)
i=str2double(xi);
h=str2double(xh);

syms x
f=str2sym(fx);

aprox=(-1*subs(f,i-3*h)+3*subs(f,i-2*h)-3*subs(f,i-h)+subs(f,i))/(h*h*h);
f_priderivada=diff(f);
f_segderivada=diff(f_priderivada);
f_terderivada=diff(f_segderivada)
error=abs(subs(f_terderivada,i)-aprox)

cambiar=double(aprox)
resultado=num2str(cambiar);
cambiar=double(error)
err=num2str(cambiar);