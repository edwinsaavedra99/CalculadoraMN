function D=ade(f,x,h,M)
f=inline(f);
D=1;
for k=1:M
    D(k)=(f(x+(h*k))-f(x))/(h);
    if k>=2
        if abs(D(k)-D(k-1))<=0.000001
            D=D(k);
        end
    end
    if k>=3
        if abs(D(k-2)-D(k-1))>abs(D(k-1)-D(k))
            D=D(k)
        end
    end
end
D