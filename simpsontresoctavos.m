function resp= simpsontresoctavos(y1,a,b,n)
%clc
%clear all
fprintf('*************************** INTEGRACION NUMÉRICA SIMPSON 1/3 COMPUESTO *****************************\n\n')
syms x
%y1=input('Ingrese la funcion: \n')
%a=input('Ingrese el limite inferior: \n')
%b=input('Ingrese el limite superior: \n')
%n=4
%while(mod(n,3)~=0)
%n=input('Ingrese el número de subintervalos (debe ser múltiplo de 3): ')
%end
v=1:n+1;
div=(b-a)/n
fv=1:n+1
for k=1:n+1
    v(k)=a+div*(k-1)
    fv(k)=subs(y1,x,v(k))
end
disp(v)
disp(fv)
h=(b-a)/n
fxa=subs(y1,x,a)
fxb=subs(y1,x,b)
acu1=0
for i=2:3:n
    disp(i)
acu1=acu1+fv(i)
end
acu2=0
for j=3:3:n
    disp(j)
acu2=acu2+fv(j)
end
acu3=0
for i=4:3:n-1
    disp(i)
acu3=acu3+fv(i)
end
int=(3/8)*h*(fxa+3*acu1+3*acu2+2*acu3+fxb)
%q=quad(y1,0,1);
int
resp=int
%fprintf('la integral es: %.4f',int)
%hold on
%grid on 
%absc=a-1:0.0001:b+2;
%plot(absc,subs(y1,x,absc),'r');
%xlabel('X')
%ylabel('Y')
