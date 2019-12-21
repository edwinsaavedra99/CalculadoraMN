function resultado= inversa(a,b)
    
     [f c]=size(a);
    %f=input('cuantas filas:');
    %c=input('cuantas columnas:');  
    k=c*2+1;
    
    aux=a;
    a=[a b]
    b=aux;
        
    for k=1:c
      a(k,:)=a(k,:)/a(k,k);
        for j=k+1:f
        a(j,:)=a(j,:)-a(k,:)*a(j,k);
        j=j+1;
        a
        
      end
      k=k+1;
      a
     
    end
    for k=f:-1:2
      for j=k-1:-1:1
        a(j,:)=a(j,:)-a(k,:)*a(j,k);
        j=j-1;
        a
      
      end
      k=k-1;
      a
    
    end
     fprintf('calculo la inversa para comprobar directo con matlab\n')
    c=inv(b);
    resultado=c
end