function poli=poli_deci(vec_coef,r)

for i=1:length(vec_coef)
    salida=sprintf(r,vec_coef(i)); 
    u1(i)=str2double(salida);
end
  ss1=poly2sym(u1);
  poli=simplify(ss1);
