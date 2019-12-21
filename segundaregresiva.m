function [resultado,err]=segundaregresiva(fx,xi,xh)
i=str2double(xi);
h=str2double(xh);

syms x
f=str2sym(fx);

aprox=(subs(f,i-2*h)-2*subs(f,i-h)+subs(f,i))/(h*h);
f_priderivada=diff(f);
f_segderivada=diff(f_priderivada);
error=abs(subs(f_segderivada,i)-aprox)

cambiar=double(aprox)
resultado=num2str(cambiar);
cambiar=double(error)
err=num2str(cambiar);