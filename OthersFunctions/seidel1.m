function seidel=seidel1(A,b,z)

[f c]=size(A);
num=f;
%num=input('INTRODUCE EL NUMERO DE ECUACIONES: ');
%A=input('INTRODUCE LA MATRIZ DE COEFICIENTES: ');
%b=input('INTRIODUCE LA MATRIZ DE COEFICIENTES INDEPENDIENTES: ');
%z=input('INTRODUZCA EL NUMERO DE ITERACIONES: ');
X0=zeros(1,num);
X=X0;
for f=1:z
for i=1:num
suma=0;
for j=1:num
if i~=j
suma=suma+A(i,j)*X(j);
end
end
X(i)=(b(i)-suma)/A(i,i);
fprintf('%10.4f', X(i));
end
X0=X;
fprintf('\n');
end
seidel=X0
end