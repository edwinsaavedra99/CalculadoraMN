function res= LU(a,y)


    %fprintf('Resolucion de matrices por el metodo de Descomposicion LU\n\n'); 
    %i=input('Cuantas filas tiene la matriz: '); 
    %j=input('Cuantas columnas tiene la matriz: '); 
    %** Al ingresar la matriz tiene que ser de esta forma [a b c;d e f;g h i] 
    %a=input('dame la matriz: '); 
    [i j]=size(a);
    nn=i; 


    %********************************************************* 
    %** En seguida se encutran las matrices L y U           ** 
    %********************************************************* 


    for i=1:nn

    L(i,i)=1;
    end
    for j=1:nn

    u(1,j)=a(1,j);
    end
    for i=2:nn

    L(i,1)=a(i,1)/u(1,1);
    end
    for n=2:nn

    for j=n:nn
    h=0;
    for k=1:n-1

    h=h+L(n,k)*u(k,j);
    end
    u(n,j)=a(n,j)-h;
    end

    for i=n+1:nn

    h=0;
    for k=1:n-1

    h=h+L(i,k)*u(k,n);
    end
    L(i,n)=(a(i,n)-h)/u(n,n);

    end
    end
    u

    L 





    %************************************************************** 
    %** En la siguiente seccion se evaluan los resultados        ** 
    %************************************************************** 



      for zz=1:i

    z(zz,1)=0;
    end
    z(1,1)=y(1,1);

    for i=2:nn

    h=0;
    for j=1:i-1

    h=h+L(i,j)*z(j,1);
    j=j+1;

    end
    z(i,1)=y(i,1)-h;

    i=i+1;

    end 




    x(nn,1)=z(nn,1)/u(nn,nn);

    for i=nn-1:-1:1

    h=0;
    for j=i+1:nn

    h=h+u(i,j)*x(j,1);
    j=j+1;

    end
    x(i,1)=(z(i,1)-h)/u(i,i);

    end
    clc; 





    fprintf('Resultado\n'); 



    for i=1:nn

    fprintf('x %d:\n',i);
    x(i,1);

    i=i+1;

    end
    res=x
end