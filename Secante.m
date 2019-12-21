function aux = Secante(y,xo)
    syms x;
    fun = inline(y);
    faux=diff(y,x)
    fund = inline(faux);
    e=0.0001;
    fa=feval(fun,xo)
    %absc=-10:0.001:10;
    %plot(absc,feval(fun,absc))
    %grid on
    %hold on
    %plot(xo,feval(fun,xo),'green')
    %grid on
    fb=feval(fund,xo)
    x1=xo-(fa/fb)
    fa1=feval(fun,x1)
    fb1=feval(fund,x1)
    x2=x1-(fa1/fb1)
    error=abs(x2-x1)
    aux=x2;
    k=0;
    while error > e
    fa2=feval(fun,aux)
    fb2=feval(fund,aux)
    x3=aux-(fa2/fb2)
    error=abs(x3-aux)
    aux=x3
    k=k+1;
    end
    resp=k
end
