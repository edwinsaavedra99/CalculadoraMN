function X=Gaussf(A)
[n n1]=size(A);
%n=n-1
x=1;
while(x<n)
for s=1:n-1
for l=x:n-1
A(l+1,:)=A(s,:)*(-A(l+1,s)/A(s,s))+A(l+1,:);
end
x=x+1;
end
end
disp('La matriz trinagular superior que se formó fue la siguiente: ')
A=A
aux=A(n,n+1)/A(n,n);
X(n)=A(n,n+1)/A(n,n);
for h=n-1:-1:1
S=A(h,n+1);
for f=n:-1:1
S=S-A(h,f)*X(f);
end
S=S/A(h,h);
X(h)=S;
end
disp('Resultado:')
disp('----------')
for r=1:n
fprintf('X%d = %f ',r,X(r))
disp('Resultado')
X


end
