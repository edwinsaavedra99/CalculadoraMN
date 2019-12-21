function varargout= lagranged(x1,y1,varargin)
if nargin==2 && nargout==1
  n=length(x1);
poli2=polyfit(x1,y1,n-1);
varargout{1}=poli2;
elseif nargin==3 && nargout==1
    x=varargin{1};
    n=length(x1); 
    poli=0;
   for i=1:n
    L=1;
    for j=1:n
        if i ~= j
            L=L*(x-x1(j))/(x1(i)-x1(j));
        end
    end
    poli=poli+L*y1(i);
   end
varargout{1}=poli;
end


