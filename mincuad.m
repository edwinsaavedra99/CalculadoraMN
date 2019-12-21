function [p]=mincuad(X,n)
 x=X(:,1);
 y=X(:,2);
 A(:,n+1)=ones(length(x),1);
for j = n:-1:1
   A(:,j) = x.*A(:,j+1);
end
[L,U] = qr(A,0);
p = U\(L'*y);
p=p.';