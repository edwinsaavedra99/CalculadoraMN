function resp=euler(f,x0,x1,y0,n)
%fprintf('\n \tRESOLUCION DE ECUACIONES DIFERENCIALES POR MEDIO METODO DE EULER\n')
%f=input('\nIngrese la ecuacion diferencial de la forma: dy/dx=f(x,y)\n','s');
%x0=input('\nIngrese el primer punto x0:\n');
%x1=input('\nIngrese el segundo punto x1:\n');
%y0=input('\nIngrese la condicion inicial y(x0):\n');
%n=input('\nIngrese el numero de pasos n:\n');
h=(x1-x0)/n;
xs=x0:h:x1;
y1=y0;
fprintf('\n''it x0 x1 y1');
for i=1:n
it=i-1;
x0=xs(i);
x=x0;
x1=xs(i+1);
y=y0;
y1=y0+h*eval(f);
fprintf('\n%2.0f%10.6f%10.6f%10.6f\n',it,x0,x1,y1);
y0=y1;
end
fprintf('\n El punto aproximado y(x1) es = %10.6f\n',y1);
resp=y1;
end