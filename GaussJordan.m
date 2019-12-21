function gj=GaussJordan(a)
%clear all ;
%clc;
[f c]=size(a)
%f=input('Cuantas filas tiene la matriz: ');
%c=input('Cuantas columnas tiene la matriz: '); 
%a
%pause 
for k=1:c-1
  a(k,:)=a(k,:)/a(k,k);
    for j=k+1:f
    a(j,:)=a(j,:)-a(k,:)*a(j,k);
    j=j+1;
  %  a
 %   pause
    end
  k=k+1;
%  a
 % pause

end 
for k=f:-1:2
  for j=k-1:-1:1
    a(j,:)=a(j,:)-a(k,:)*a(j,k);
    j=j-1;
 %   a
  %  pause
  end
  k=k-1;
  a
 % pause
 gj=a
end
%fprintf('resultado\n');