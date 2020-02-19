function resp=simpson(f,a,b,c)
 %   fprintf('Calculo de la integral por el metodo de Simpson de 1/3\n\n');
  %   f=input('introduce la funcion:','s');
   %    a=input('lime inferior:');
   %  b=input('limite superior:');
  % c=input('numero de segmentos a dividir (numero par):');
  h=(b-a)/c;
 z=0;
x=a;
for i=1:c;
if (-1)^i==1

k=eval(f);

z=z+k;

end

x=h*i;
end
 zz=0;
x=a;
for i=2:c;
 if (-1)^i==-1
   k=eval(f);
  zz=zz+k;
 end
x=h*i;
end
  x=a;
  if x==a
    d=eval(f);
  end
 x=b;
   if x==b
     e=eval(f);
   end
     z=z*4;
       v=zz*2;
        z=z+v+d+e;
      z=z/(3*c);
  z=z*(b-a)
fprintf('Resultado ');
resp=z;
end