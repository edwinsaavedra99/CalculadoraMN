function v=repetidos(vector)
[valores_unicos, ind_unicos] = unique(vector);
ind_repetidos = setdiff(1:length(vector), ind_unicos);
 for i=1:length(ind_repetidos)
   vector{ind_repetidos(i)}=[];
 end
 s=vector;
 c=1;
for i=1:length(s)
     if iscellstr(s(i))==1 && isempty(s{i})==0
       v{c}=s{i};
       c=c+1;
    end
end


