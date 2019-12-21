function varargout = interpolacion_all(varargin)
%Universidad Central Del Ecuador
%Facultad de Ing.Ciencias Física y Matematico
%programa basico por David Choez
%Estudiante de Ing.Matemática.
%Nota:existencia redundancia de codigo y no hay optimizacion 
%de los algoritmos,por falta de tiempo 
%falta comentar codigo ,implementar una mejor estructura,etc...
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interpolacion_all_OpeningFcn, ...
                   'gui_OutputFcn',  @interpolacion_all_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function interpolacion_all_OpeningFcn(hObject, eventdata, handles, varargin)
global datos cont  cont1 rc;
cont=1;
cont1=1;
 handles.output = hObject;
datos(1).puntos=[];
datos(1).npuntos=[];
datos(1).metodo=[];
datos(1).f=[];
datos(1).err1=[];
datos(1).ev1=[];
datos(1).co=[];
datos(1).yy=[];
datos(1).p=1;
datos(1).gs=[];
datos(1).sl=1.4;
datos(1).decimales1=[];
if isempty(datos(cont).f)
    set(handles.fx1,'visible','off'); 
    set(handles.error1,'visible','off');
    set(handles.text29,'visible','off');
    set(handles.pushbutton10,'visible','off');
else
    set(handles.fx1,'visible','on'); 
    set(handles.error1,'visible','on');
    set(handles.text29,'visible','on');
    set(handles.pushbutton10,'visible','on');
end
%      set(handles.fx1,'visible','on'); 
if get(handles.minimos1,'value')==1 
    datos(cont).metodo=3;
    set(handles.textgrad1,'visible','on'); %mostramos lectura del grado minimos cuadrados
    set(handles.grad1,'visible','on'); %
%     datos(cont).grado=str2double(get(handles.grad1, 'String'));
else
       set(handles.textgrad1,'visible','off'); %ocultamos lectura de w
       set(handles.grad1,'visible','off'); %
    if get(handles.splines1,'value')==1
        datos(cont).metodo=2;
    elseif get(handles.lagrange1,'value')==1
        datos(cont).metodo=1;
    else 
        datos(cont).metodo=4;
        
    end
end

% set(handles.fx1,'visible','off'); 
datos(cont).decimales1=str2double(get(handles.cifras1, 'String'));
rc=strcat('%.',num2str(datos(cont).decimales1),'f');
guidata(hObject, handles);
function varargout = interpolacion_all_OutputFcn(hObject, eventdata, handles) 

 varargout{1} = handles.output;
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
clc
% axes(handles.axes1)
cla
global datos cont rc xp; 
 if isempty(datos(cont).puntos)==1  % condicion necesaria al cargar datos de excel ,no se pierda
 datos(cont).puntos=str2double(get(handles.puntos1,'Data'));
 end
x1=datos(cont).puntos(:,1)';
x2=datos(cont).puntos(:,2)';
X=(datos(cont).puntos)';
n=length(x1);
xp=[];
for i=1:n-1; 
    xs=linspace(X(1,i),X(1,i+1));
    xp=[xp,xs];
end

% x=x1(1):0.1:x1(n); 
if datos(cont).metodo==1  
    for i=1:length(xp)
        y(i)=lagranged(x1,x2,xp(i));
    end
    
elseif datos(cont).metodo==2
% x=x1(1):0.1:x1(n);
X=(datos(cont).puntos)'; 
  [a,b,c,d]=scubico(X);
%   x1=X(1,1):0.1:X(1,n);
y=[];
% x=x1(1):0.1:x1(n);
for i=1:n-1; 
    xs=linspace(X(1,i),X(1,i+1));
    y11=a(i)+b(i)*(xs-X(1,i))+c(i)*(xs-X(1,i)).^2+d(i)*(xs-X(1,i)).^3;
    y=horzcat(y,y11);   
end
elseif datos(cont).metodo==3
% xm=x1(1):0.1:x1(n);  
  X=datos(cont).puntos;
  datos(cont).grado=str2double(get(handles.grad1, 'String'));
%   datos(cont).decimales1=str2double(get(handles.cifras1, 'String'));
  
  if datos(cont).grado <length(X(:,1))
  [coeficientes]=mincuad(X,datos(cont).grado);
  datos(cont).co=coeficientes;
y=polyval(coeficientes,xp);
% rc=strcat('%.',num2str(datos(cont).decimales1),'f');
poli3=poli_deci(coeficientes,rc);
poli_min=poli3;
%   poly2sym(coeficientes);
  datos(cont).poli_min=poli_min;
  else
      errordlg('Ingrese un Grado Menor a el Nro de puntos ','Minimos Cuadrados');
 return
  end
  
else
syms x;
for i=1:length(xp)
    x=xp(i);
    y(i)=eval(datos(cont).f);
end    
end
datos(cont).y=y;

if cont==4
    datos(1:cont-1)=datos(2:cont);
    cont=cont-1;
end
    mostrargrafica(handles)
cont=cont+1;
datos(cont)=datos(cont-1);

 guidata(hObject,handles);
function pushbutton2_Callback(hObject, eventdata, handles)

function n1_Callback(hObject, eventdata, handles)

input = str2double(get(hObject,'string'));
if isnan(input)
  errordlg('Debe Ingresar un valor Numerico','Invalid Input','modal')
  uicontrol(hObject)
  return
else
  display(input);
end

global datos cont ;
ResetGUI(handles)

set(handles.fx1,'visible','off'); 

datos(1).npuntos=str2double(get(handles.n1, 'String'));
set(handles.puntos1,'Visible','on')
        num_elem=cell(datos(1).npuntos,2);
        num_elem(:,:)={''};
        set(handles.puntos1,'data',num_elem);
        set(handles.puntos1,'ColumnEditable',true(1,1))
  guidata(hObject,handles);
datos(cont).puntos=[];

% --- Executes during object creation, after setting all properties.
function n1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function polinomio1_CreateFcn(hObject, eventdata, handles)


function grado1_Callback(hObject, eventdata, handles)

function grado1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function grad1_Callback(hObject, eventdata, handles)

function grad1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)

function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)

global datos cont ;
 if isempty(datos(cont).f)
    set(handles.fx1,'visible','off'); 
    set(handles.error1,'visible','off');
    set(handles.text29,'visible','off');
    set(handles.pushbutton10,'visible','off');
else
    set(handles.fx1,'visible','on'); 
    set(handles.error1,'visible','on');
    set(handles.text29,'visible','on');
    set(handles.pushbutton10,'visible','on');
end
% set(handles.fx1,'visible','on');
if get(handles.minimos1,'value')==1 % relajacion
     datos(cont).metodo=3;
     set(handles.textgrad1,'visible','on'); %mostramos lectura 
     set(handles.grad1,'visible','on'); %
     datos(cont).grado=str2double(get(handles.grad1,'string')); %leemos 
else
     set(handles.textgrad1,'visible','off'); %ocultamos lectura de 
     set(handles.grad1,'visible','off'); %
    if get(handles.splines1,'value')==1
        datos(cont).metodo=2;
    elseif get(handles.lagrange1,'value')==1
        datos(cont).metodo=1;
        
    else
        datos(cont).metodo=4;
    end
end
guidata(hObject, handles);
function mostrargrafica(handles)

global datos cont  xp
   axes(handles.axes1)
   x1=datos(cont).puntos(:,1)';
   x2=datos(cont).puntos(:,2)';
   n=length(x1);
   r1=[];
%     r=['r','b','c','b','k']; 
r=[1 0 0;0 0 1;0 0.3 0];
  for j=1:cont
    datos(j).gs=plot(xp,datos(j).y);
    hold on
%   analisis(j,:)=datos(j).y;
    title '';
    set(datos(j).gs,'color',r(j,:));
%     set(datos(j).gs,'LineWidth',datos(j).sl);
%     axis equal
   
      if datos(j).metodo==1
   
    r1{j}='Interpolacion de Lagrange';  
%      z{j}=strvcat(sprintf('Polinomio de Lagrange es:')...
%          ,sprintf(strcat(char('P(x)='),char(datos(j).poli_lag))),...
%      '---------------------------------------------------------------');

      elseif datos(j).metodo==2
      r1{j}='Splines Cubicos';
         
%       z{j}=strvcat(sprintf('Polinomio Asociado al Splin Cubico es:')...
%          ,sprintf(strcat(char('P(x)='),char(datos(j).poli_splin))),...
%      '---------------------------------------------------------------');

      elseif datos(j).metodo==3
          
      aux2=['Minimos Cuadrado, grado= ' num2str(datos(j).grado,'%2.3g')];
      r1{j}=aux2;
%       z{j}=strvcat(sprintf('Polinomio de Minimos cuadrados de grado= %i  es:',datos(j).grado)...
%           ,sprintf(strcat(char('P(x)='),char(datos(j).poli_min))),...
%       '---------------------------------------------------------------');
      else
        r1{j}=['Funcion f(x)=' char(datos(j).f)];  
          
    end
    hold on
end

%  scatter(x1,x2,'fill');
if n>30
    s=10;
else
    s=40;
end
scatter(x1,x2,s,'MarkerFaceColor','g','LineWidth',0.1)
% scatter(x1,x2,s,'o','MarkerFaceColor',[0 .5 .5])

% figure(3)
% scatter(analisis(1,:),analisis(2,:),'fill')
% set(g2,'color',[0 0 0]);
% set(g2,'LineWidth',0.5);
grid on
title ''
hleg1=legend(r1);
set(hleg1,'Position',[8 42 45 4])

% --- Executes when entered data in editable cell(s) in puntos1.
function puntos1_CellEditCallback(hObject, eventdata, handles)
% --- Executes on button press in separadas1.
function separadas1_Callback(hObject, eventdata, handles)

global datos cont xp;
switch get(handles.separadas1,'Value');
    case 1 
        
x1=datos(cont).puntos(:,1)';
x2=datos(cont).puntos(:,2)';
r=[1 0 0;0 0 1;0 0 0];

% z=zeros(3,length(datos(cont).y));
for i=1:cont-1
  z{i}=num2str(datos(i).y);
  if isequal(z{i},num2str(datos(i).yy))
     z{i}='';
  end
if datos(i).metodo==1
      r1{i}='Interpolacion de Lagrange';  
      elseif datos(i).metodo==2
      r1{i}='Splines Cubicos';
elseif datos(i).metodo==3
      aux2=['Minimos Cuadrado, grado= ' num2str(datos(i).grado,'%2.3g')];
      r1{i}=aux2;
else
   r1{i}='';
end

end
r2=repetidos(r1);
z1=repetidos(z);
if length(r2)==length(z1)
 for i=1:length(z1)
    z2(i,:)=str2num(z1{i});
end
 
for i=1:length(r2)
   figure(i)
%   subplot(1,length(r2), i)
%  subplot(1,2,i)
  if isempty(datos(cont).f)
   gs=plot(xp,z2(i,:));
   set(gs,'color',r(i,:));
   set(gs,'LineWidth',1.5);
   legend(gs,r2(i))
  else
    syms x
    for l=1:length(xp)
    x=xp(l);
    y1(l)=eval(datos(i).f);
    
    end   
   plot(xp,z2(i,:),xp,y1,'--');  
   legend(r2(i),'funcion f(x)')
  end
   hold on
 %  plot (x1,x2,'.','MarkerEdgeColor','m','LineWidth',1.0);

  title '';
  grid on 
  
% scatter(x1,x2,'fill');
% scatter(x1,x2,s,'fill')
scatter(x1,x2,'fill','d')

end
else
    errordlg('No es posible Separar las graficas por que dos graficas coinciden ','Graficas Separadas');
   return
   
end

    case 2 
 x1=datos(cont).puntos(:,1)';
x2=datos(cont).puntos(:,2)';
r=[1 0 0;0 0 1;0 0 0];

% z=zeros(3,length(datos(cont).y));
for i=1:cont-1
  z{i}=num2str(datos(i).y);
  if isequal(z{i},num2str(datos(i).yy))
     z{i}='';
  end
if datos(i).metodo==1
      r1{i}='Interpolacion de Lagrange';  
      elseif datos(i).metodo==2
      r1{i}='Splines Cubicos';
elseif datos(i).metodo==3
      aux2=['Minimos Cuadrado, grado= ' num2str(datos(i).grado,'%2.3g')];
      r1{i}=aux2;
else
   r1{i}='';
end

end
r2=repetidos(r1);
z1=repetidos(z);
if length(r2)==length(z1)
 for i=1:length(z1)
    z2(i,:)=str2num(z1{i});
end
 figure(1)
for i=1:length(r2)
%      subplot(1,length(r2), i)
   subplot(2,2,i)
  if isempty(datos(cont).f)
   gs=plot(xp,z2(i,:));
   set(gs,'color',r(i,:));
%    set(gs,'LineWidth',1.0);
   legend(gs,r2(i))
  else
    syms x
    for l=1:length(xp)
    x=xp(l);
    y1(l)=eval(datos(i).f);
    
    end   
   plot(xp,z2(i,:),xp,y1,'--');  
   legend(r2(i),'funcion f(x)');
   
  end
   hold on
 %  plot (x1,x2,'.','MarkerEdgeColor','m','LineWidth',1.0);

  title '';
  grid on 
scatter(x1,x2,'fill','d')       
        
end
else
     errordlg('No es posible Subplotear las Graficas ,por que dos graficas coinciden','Graficas Subplot');
    return
    
end
end
  
function edit7_Callback(hObject, eventdata, handles)

function edit7_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function polinomio1_Callback(hObject, eventdata, handles)


function popupmenu2_Callback(hObject, eventdata, handles)
switch get(handles.popupmenu2,'Value');
    case 1 
        axes(handles.axes1);
        axis normal
%         guidata(hObject,handles);
    case 2 
        axes(handles.axes1); 
       axis equal tight
%        guidata(hObject,handles);
    case 3 
       axes(handles.axes1); 
        axis square
%         guidata(hObject,handles);  
    case 4 
          axes(handles.axes1); 
        axis equal
%         guidata(hObject,handles);
end
     guidata(hObject,handles);
function popupmenu2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
global datos cont rc;
  
   x1=datos(cont).puntos(:,1)';
   x2=datos(cont).puntos(:,2)';
   for j=1:cont-1
    if datos(j).metodo==1
poli2=lagranged(x1,x2);
datos(cont).decimales1=str2double(get(handles.cifras1, 'String'));
rc=strcat('%.',num2str(datos(cont).decimales1),'f');

poli3=poli_deci(poli2,rc);
     z{j}=strvcat(sprintf('Polinomio de Lagrange es:')...
         ,sprintf(strcat(char('P(x)~'),char(poli3))),...
     '---------------------------------------------------------------');
      elseif datos(j).metodo==2
  n=length(x1);
  X=(datos(j).puntos)'; 
  [a1,b1]=introducetamanomatriz(x1(1),x1(n));
  z1=strcat('El intervalo Ingresado es :','[',num2str(a1),',',num2str(b1),']');
 set(handles.text34,'String',z1)  
  [a,b,c,d]=scubico(X);
  j1=1;
while a1>x1(j1)
 j1=j1+1;
end
k=j1;
while b1>x1(k)
    k=k+1;
end
if j1>1
    j1=j1-1;
end
y=[];
s=[];
for i=j1:k-1;
%    x=X(1,i):0.1:X(1,i+1);
   s1=[X(1,i) X(1,i+1)];
   s=[s;s1];
   syms x
   y1=a(i)+b(i)*(x-X(1,i))+c(i)*(x-X(1,i)).^2+d(i)*(x-X(1,i)).^3;
   y=[y;y1];
end

y1=expand(y);
polis='';
for i=1:length(y1)
polsplin(i,:)=sym2poly(y1(i));
pols1{i}=poli_deci(polsplin(i,:),rc);
polis=strvcat(polis,strcat('En el Intervalo [',num2str(s(i,1)),',',num2str(s(i,2)),']','--> ','P(x)=',char(pols1{i})));
end

   z{j}=strvcat(sprintf('Polinomio/os Asociado al Splin Cubico es:')...
      ,polis,'---------------------------------------------------------------');
   
    elseif datos(j).metodo==3

   z{j}=strvcat(sprintf('Polinomio de Minimos cuadrados de grado= %i  es:',datos(j).grado)...
          ,sprintf(strcat(char('P(x)~'),char(datos(j).poli_min))),...
      '---------------------------------------------------------------');
    else
        z{j}='';
    end
   end

set(handles.polinomio1,'String',z)

function popupmenu3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function cifras1_Callback(hObject, eventdata, handles)

function cifras1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function funcion1_Callback(hObject, eventdata, handles)

function funcion1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)

function edit19_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function a1_Callback(hObject, eventdata, handles)

function a1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit13_Callback(hObject, eventdata, handles)

function edit13_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function particiones1_Callback(hObject, eventdata, handles)

function particiones1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function b1_Callback(hObject, eventdata, handles)

function b1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit17_Callback(hObject, eventdata, handles)

function edit17_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit18_Callback(hObject, eventdata, handles)
function edit18_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
Reset1(handles)
global datos cont ai bi ;

datos(cont)=datos(1);
cont=1;

fing=get(handles.funcion1, 'String');
a=str2double(get(handles.a1, 'String'));
b=str2double(get(handles.b1, 'String'));
ai=a;
bi=b;
p=str2double(get(handles.particiones1, 'String'));
f1=inline(fing,'x');
s=(b-a)/p;
x1=a:s:b;
x2=[];
for i=1:length(x1)
    x2(i)=f1(x1(i));
end
vector=[x1' x2'];
datos(cont).puntos=vector;

 set(handles.puntos1,'Data',vector)
 set(handles.n1,'String',length(vector(:,1)))
 datos(cont).f=fing;
 set(handles.fx1,'visible','on'); 
 
function textgrad1_CreateFcn(hObject, eventdata, handles)

function slider2_Callback(hObject, eventdata, handles)
global datos cont ;
set(handles.slider2,'Min',1) 
set(handles.slider2,'Max',10)
slider_value = get(handles.slider2,'Value');
% datos(cont).sl=slider_value;
% datos(cont).sl
datos(cont).sl=slider_value;

 for i=1:cont
set(datos(i).gs,'LineWidth',datos(cont).sl);
 end


guidata(gcbo,handles);


function slider2_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)

function slider1_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)


function polival1_Callback(hObject, eventdata, handles)

function polival1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
global datos cont ;
   x1=datos(cont).puntos(:,1)';
   x2=datos(cont).puntos(:,2)';
   datos(cont).ev1=str2double(get(handles.polival1, 'String'));
   for j=1:cont-1
    if datos(j).metodo==1
 
     z{j}=strvcat(sprintf('Polinomio de Lagrange evaluado en %i es :',datos(cont).ev1)...
         ,num2str(lagranged(x1,x2,datos(cont).ev1)),...
         '---------------------------------------------------------------');
      elseif datos(j).metodo==2
          
          
  n=length(x1);
  X=(datos(j).puntos)'; 
%   [a1,b1]=introducetamanomatriz(x1(1),x1(n));
  [a,b,c,d]=scubico(X);
  j1=1;
while datos(cont).ev1>x1(j1)
 j1=j1+1;
end
if j1>1
    j1=j1-1;
end
 syms x
 y1=a(j1)+b(j1)*(x-X(1,j1))+c(j1)*(x-X(1,j1)).^2+d(j1)*(x-X(1,j1)).^3;
 x=datos(cont).ev1;
 ys=eval(y1);
 polis='';
  polis=strvcat(polis,strcat('En el Intervalo [',num2str(x1(j1)),',',num2str(x1(j1+1)),']','--> ','P(',num2str(datos(cont).ev1),')=',num2str(ys)));
 
 % polis='';
% for i=1:length(yx)
% polis=strvcat(polis,strcat('En el Intervalo [',num2str(s1(i,1)),',',num2str(s1(i,2)),']','--> ','P(',num2str(datos(cont).ev1),')=',num2str(yx(i))));
% end
% % 
   z{j}=strvcat(sprintf('El Polinomio/os del Splin Cubico evaluado en: %i es:',datos(cont).ev1)...
      ,polis,'---------------------------------------------------------------');
        
        set(handles.text34,'String',[])   
   
    elseif datos(j).metodo==3

   z{j}=strvcat(sprintf('Polinomio de Minimos cuadrados de grado=%i evaluado en %i es:',datos(j).grado,datos(cont).ev1)...
          ,num2str(polyval(datos(j).co,datos(cont).ev1)),...
      '---------------------------------------------------------------');
    else
      z{j}='';
    end
   end

set(handles.polinomio1,'String',z)

function error1_Callback(hObject, eventdata, handles)

function error1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
global datos cont ai bi;
 datos(cont).err1=str2double(get(handles.error1, 'String'));
 
 if ai<=datos(cont).err1 && datos(cont).err1<=bi
   px=datos(cont).err1;
   x1=datos(cont).puntos(:,1)';
   x2=datos(cont).puntos(:,2)';
   fx=inline(datos(cont).f);
 
   fxp=fx(px);
   for j=1:cont-1
    if datos(j).metodo==1
   
     z{j}=strvcat(sprintf('Error.Abs del Polinomio de Lagrange en el punto %.5f es :',px)...
         ,num2str(abs(fxp-lagranged(x1,x2,px))),...
         '---------------------------------------------------------------');
      elseif datos(j).metodo==2
 
  n=length(x1);
  X=(datos(j).puntos)'; 
%   [a1,b1]=introducetamanomatriz(x1(1),x1(n));
  [a,b,c,d]=scubico(X);
  j1=1;
while px>x1(j1)
 j1=j1+1;
end
if j1>1
    j1=j1-1;
end
 syms x
 y1=a(j1)+b(j1)*(x-X(1,j1))+c(j1)*(x-X(1,j1)).^2+d(j1)*(x-X(1,j1)).^3;
 x=px;
 ys=eval(y1);
 err=abs(fxp-ys);

   z{j}=strvcat(sprintf('El Erro.Abs del Polinomio/os del Splin Cubico evaluado en: %.5f es:',px)...
      ,num2str(err),'---------------------------------------------------------------');
 
%   z1=strcat('El intervalo Ingresado es :','[',num2str(a1),',',num2str(b1),']');
 set(handles.text34,'String',[]) 
 
    elseif datos(j).metodo==3

   z{j}=strvcat(sprintf('Error.Polinomio de Minimos cuadrados de grado=%i en el punto %.5f es:',datos(j).grado,px)...
          ,num2str(abs(fxp-polyval(datos(j).co,px))),...
      '---------------------------------------------------------------');
    else
      z{j}='';
    end
   end

set(handles.polinomio1,'String',z)
 else
 errordlg('Ingrese un valor dentro del Intervalo :');
return
 end

% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)

function separadas1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton13_Callback(hObject, eventdata, handles)

function handles = ResetGUI(handles)

global datos cont
 datos(cont).f=[];
datos(1)=datos(cont); % copiamos situacion actual
cont=1;
set(handles.funcion1,'string',[]);
set(handles.a1,'string',[]);
set(handles.b1,'string',[]);
set(handles.polinomio1,'string',[]);
set(handles.particiones1,'string',[]);
set(handles.polival1,'string',[]);
set(handles.error1,'string',[]);
set(handles.text34,'string',[]);
axes(handles.axes1);
cla
reset(gca)
function handles = Reset1(handles)

global datos cont
%  datos(cont).f=str2double(get(handles.funcion1,'String'));
datos(1)=datos(cont); % copiamos situacion actual
cont=1;
set(handles.polinomio1,'string',[]);
set(handles.text34,'string',[]);
set(handles.polival1,'string',[]);
set(handles.error1,'string',[]);
axes(handles.axes1);
cla
reset(gca)
    % --- Executes when selected object is changed in uipanel16.
function uipanel16_SelectionChangeFcn(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function excel1_Callback(hObject, eventdata, handles)
global datos cont ;
ResetGUI(handles)
set(handles.fx1,'visible','off'); 
% copiamos situacion actual
% [F,PathName,FilterIndex] = uigetfile({'*.xlsx';'*.xls';'*.*'},'File Selector');
[F, pathname]=uigetfile( {'*.xls;*.;*.xlsx','Todos Archivos Excel';...
          '*.*','All Files' },'Archivos de Excel a Interpolar','hoja.xls');
      if F~=0
      a=xlsread(F);
      datos(cont).puntos=a;
      set(handles.puntos1,'Data',a)
      set(handles.n1,'String',length(a(:,1)))

  else
      return
      end

function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function excels_Callback(hObject, eventdata, handles)
% hObject    handle to excels (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ResetGUI(handles)
global datos cont
[fitxer,directori]=uiputfile('*.xlsx','Indicar o crear el fichero word:');
if isequal(fitxer,0),return,end
nomf=fullfile(directori,fitxer);
a=datos(cont).puntos';
datos1=  vertcat(a(1,:),a(2,:))';
xlswrite(nomf, datos1, 1, 'A1');


% --------------------------------------------------------------------
function wordcap_Callback(hObject, eventdata, handles)

 axes(handles.axes1)
 %save figure
%  close(gcf); %and close it 
[fitxer,directori]=uiputfile('*.doc','Indicar o crear el fichero word:');
% if isequal(fitxer,0),return,end
%  F=getframe(handles.axes1); %select axes in GUI
%  figure(1); %new figure
%  image(F.cdata); %show selected axes in new figure
%  saveas(gcf, 'path', 'fig');
nomf=fullfile(directori,fitxer);
print('-dmeta')
wrd=actxserver('word.application');
wrd.Visible=1;
%abrir el nomf.doc (o crearlo si no existe)
if exist(nomf,'file');
docu=invoke(wrd.Documents,'Open',nomf); %abrir nomf.doc
else
docu=invoke(wrd.Documents,'Add'); %o crearlo
end
%añadir texto a nomf.doc
s=docu.Content;
s.InsertParagraphAfter; %punto y aparte
invoke(s,'InsertAfter','Captura de Pantalla Principal');
s.InsertParagraphAfter;
invoke(s,'Collapse',0); %para que la fig se pegue después del texto
%pegar la figura: (1): picture format, (3): float over text
invoke(s,'PasteSpecial',0,0,1,0,3);
%salvar y cerrar nomf.doc
if exist(nomf,'file')
docu.Save;
else
invoke(docu,'SaveAs',nomf,1);
end


% --------------------------------------------------------------------
function uipushtool3_ClickedCallback(hObject, eventdata, handles)
% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ResetGUI(handles)
set(handles.puntos1,'Data',[]);
set(handles.n1,'string',[]);
set(handles.grad1,'string',[]);
legend(handles.axes1,'off')


% --- Executes on button press in minimos1.
function minimos1_Callback(hObject, eventdata, handles)

% hObject    handle to minimos1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of minimos1
