clear all;
     clc;
  fprintf('Interpolacion con el Metodo del Polinomio de Lagrange\n\n');
    n=input('grado del polinolio: ');
for i1:n+1
    x(1,i)=input('dame los valores de xi:');
end
for i=1:n+1
    xi(1,i)=input('dame los valores de f(xi):');
end
 x
   xi
      xint=input('Numero para el que desea interpolar x: ');
   fxint=0;
 i=1;
while i<=n+1
    L=1;
    J=0;
    while J<=n
        if i~=J+1
            L=L*(xint-x(1,J+1))/(x(1,i)-x(1,J+1));
        end
    J=J+1;
    end
fxint=fxint+L*xi(1,i);
i=i+1;
end
fprintf('\nresultado xi: %d',fxint');
       plotx,xi)
   grid
title('Polinomio de Lagrange');xlabel('x');yhabel('y')