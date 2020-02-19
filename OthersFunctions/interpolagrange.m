function interpolagrange()
x=input('dame la matriz1: ');
y=input('dame la matriz2: ');
m=length(x);
n=m-1;
plot(x,y,'*r')
hold on
for i=1:n+1
    q=1;
    for j=1:n+1
        if i~=j
        q= conv (q , poly(x(j)))/(x(i)-x(j));
        end
    end
    l(i,:)= q;
end
disp('LOS COEFICIENTES DE LAGRANGE INTERPOLADOS SON: ')
c=y*l;
disp(c);
z=length(c);
suma=0;    
for d=z-1:-1:0
    syms x;
    suma=suma+c(z-d)*x^(d);
end
disp('EL POLINOMIO OBTENIDO ES: ')
fun=suma;
f=inline(char(fun));
disp(f)
ezplot(f,[-5,5])
grid on