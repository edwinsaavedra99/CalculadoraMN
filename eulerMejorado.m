function resp= eulerMejorado(f,x,y,h,n)
%clear all
%disp('METODO DE EULER MODIFICADO')
%clc
syms x
syms y
f=inline(f);
%f=inline(input('ingrese la derivada:'));
%x=input('ingrese el valor de x:');
%y=input('ingrese el valor de y:');
%h=input('ingrese el valor de h:');
%n=input('ingrese numero de iteraciones:');
disp('x(n) y´(n) hy´(n) y(n+1),p hy´(n+1),p y(n+1),c');
for i=1:n
s=h+x;
y1=f(x,y);
%y1=feval(f,x,y);
hy1=h*y1;
y2=y+hy1;
y3=feval(f,s,y2);
hy2=y3*h;
yn=y+((hy1+hy2)/2);
y=yn;
x=x+h;
resp=y;
end
end

