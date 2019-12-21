function Muller
    clc
    clear all
    y = input('Ingrese funcion: ')
    fun = inline(y);
    absc=-10:0.001:10;
    plot(absc,feval(fun,absc))
    grid on
    e=0.000001;
    x0=input('Ingrese Xo: ')
    x1=input('Ingrese X1: ')
    x2=input('Ingrese X2: ')
    k=0;
    error=(abs((x2-x1)/x2)*100)
    while error > e
        h0=x1-x0;
        h1=x2-x1;
        f0=feval(fun,x0);
        f1=feval(fun,x1);
        f2=feval(fun,x2);
        d0=(f1-f0)/h0;
        d1=(f2-f1)/h1;

        A=(d1-d0)/(h1+h0);
        B=A*h1+d1;
        C=feval(fun,x2);
        raiz=sqrt(B*B-4*A*C);
        if abs(B+raiz)>abs(B-raiz)
            den=B+raiz;
        else
            den=B-raiz;
        end
        x3=x2-2*C/den
        error=(abs((x3-x2)/x3)*100)
        x0=x1;
        x1=x2;
        x2=x3;
        k=k+1;
    end
    k
end