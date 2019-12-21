function varargout = calculadora(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @calculadora_OpeningFcn, ...
                   'gui_OutputFcn',  @calculadora_OutputFcn, ...
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
function calculadora_OpeningFcn(hObject, eventdata, handles, varargin)
global datos cont  cont1 rc;
cont=1;
cont1=1;
handles.output = hObject;
datos(1).newton=[];
datos(1).finitas=[];
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
if get(handles.splines1,'value')==1
   datos(cont).metodo=2;
   1+1
elseif get(handles.lagrange1,'value')==1
    datos(cont).metodo=1;
     2+2
elseif get(handles.newton1,'value')==1
    datos(cont).metodo=3;
    3+3
elseif get(handles.finitas1,'value')==1
    datos(cont).metodo=4;
    4+4
else
    datos(cont).metodo=5;
    5+5
end
% set(handles.fx1,'visible','off'); 
datos(cont).decimales1=str2double(get(handles.cifras1, 'String'));
rc=strcat('%.',num2str(datos(cont).decimales1),'f');
a=imread('corchete.png');
axes(handles.corchete)
axis off
image(a)
axis off
guidata(hObject, handles);

function varargout = calculadora_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
function FuncionText_Callback(hObject, eventdata, handles)
function FuncionText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function popupmenu1_Callback(hObject, eventdata, handles)
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function LimiteInferior_Callback(hObject, eventdata, handles)
function LimiteInferior_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function LimiteSuperior_Callback(hObject, eventdata, handles)
function LimiteSuperior_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Raiz_Callback(hObject, eventdata, handles)
function Raiz_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function pushbutton1_Callback(hObject, eventdata, handles)
f = get(handles.FuncionText,'String');
f = inline(f);
xai = str2double(get(handles.LimiteInferior,'string'));
xbi = str2double(get(handles.LimiteSuperior,'string'));
tol = str2double(get(handles.cifras1,'string'));
if(strcmp(get(handles.FuncionText,'String'),'') == true || strcmp(get(handles.LimiteInferior,'string'),'') == true || strcmp(get(handles.LimiteSuperior,'string'),'') == true || strcmp(get(handles.cifras1,'string'),'') == true)
    lll = 'entro'
    k = errordlg('Faltan datos de Entrada','Error');
else
%tol = 0.001;
v =  get(handles.popupmenu1,'Value');
switch v
    case 1
        i=1;
        ea(1)=100;
        if f(xai)*f(xbi)<0
            xa(1)=xai;
            xb(1)=xbi;
            xr(1)=(xa(1)+xb(1))/2;
            %%table
            set(handles.table,'Data',{})
            set(handles.table,'Data',{})
            set(handles.Raiz,'string','No hay raiz');
            %%table
            while abs(ea(i))>=tol
                if f(xa(i))*f(xr(i))<0
                    xa(i+1)=xa(i);
                    xb(i+1)=xr(i);
                elseif f(xa(i))*f(xr(i))>0
                    xa(i+1)=xr(i);
                    xb(i+1)=xb(i);
                else
                    break;
                end
                xr(i+1)=(xa(i+1)+xb(i+1))/2;
                ea(i+1)=abs((xr(i+1)-xr(i))/(xr(i+1))*100);
                %table---
                newRow ={i xa(i+1) xb(i+1) xr(i+1) ea(i+1)};
                oldData = get(handles.table,'Data');
                newData=[oldData; newRow];
                set(handles.table,'Data',newData);                
                %%table
                i=i+1;
            end
            r=num2str(xr(i));
            set(handles.Raiz,'string',r);
            set(handles.valor,'string',i-1);
        else
            set(handles.Raiz,'string','NO ENCUNTRA'); 
        end
    case 2
        i=1;
        ea(1)=100;
        if f(xai)*f(xbi)<0
            xa(1)=xai;
            xb(1)=xbi;
            xf(1)= xb(1)-f(xb(1))*(xa(1) - xb(1))/(f(xa(1))-f(xb(1)));
            %%table
            set(handles.table,'Data',{})
            set(handles.table,'Data',{})
            set(handles.Raiz,'string','No hay raiz');
            %%table
            while abs(ea(i))>=tol
                if f(xa(i))*f(xf(i))<0 
                    xa(i+1)=xa(i);
                    xb(i+1)=xf(i); 
                else 
                    xa(i+1)=xf(i); 
                    xb(i+1)=xb(i);
                end
                xf(i+1)= xb(i+1)-f(xb(i+1))*(xa(i+1) - xb(i+1))/(f(xa(i+1))-f(xb(i+1)));
                ea(i+1)=abs((xf(i+1)-xf(i))/(xf(i+1))*100);
                %table---
                newRow ={i xa(i+1) xb(i+1) xf(i+1) ea(i+1)};
                oldData = get(handles.table,'Data');
                newData=[oldData; newRow];
                set(handles.table,'Data',newData);                
                %%table
                i=i+1;
                if(i==100) break;
                end
            end 
            r=sprintf('%0.5f',xf(i));
            set(handles.Raiz,'string',r);
            set(handles.valor,'string',i-1);
         else
            set(handles.Raiz,'string','NO ENCUNTRA'); 
        end
    otherwise
        set(handles.Raiz,'string','PERMISOS NO CONCEDIDOS'); 
end
end


% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(~, eventdata, handles)
axes(handles.grafica);
     x=-10:0.1:10;
        fx=get(handles.FuncionText,'String');
        hold off
        ezplot (fx);
        grid on



function valor_Callback(hObject, eventdata, handles)
% hObject    handle to valor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of valor as text
%        str2double(get(hObject,'String')) returns contents of valor as a double


% --- Executes during object creation, after setting all properties.
function valor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
val = get(hObject,'Value');
str = get(hObject,'String');
switch str{val}
    case 'Newton' % User selects 
    %handles.current_data = handles.peaks;
        set(handles.edit8,'Visible','off');
        set(handles.text16,'Visible','off');
        set(handles.FuncionText2,'Visible','off');
    case 'Secante'
        set(handles.edit8,'Visible','on');
        set(handles.text16,'Visible','off');
        set(handles.FuncionText2,'Visible','off');
    case 'Punto Fijo'
        set(handles.edit8,'Visible','off');
        set(handles.text16,'Visible','on');
        set(handles.FuncionText2,'Visible','on');
    otherwise
        set(handles.edit8,'Visible','off');
        set(handles.text16,'Visible','off');
        set(handles.FuncionText2,'Visible','off');
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gin_Callback(hObject, eventdata, handles)
% hObject    handle to gin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gin as text
%        str2double(get(hObject,'String')) returns contents of gin as a double


% --- Executes during object creation, after setting all properties.
function gin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
if hObject == handles.radiobutton2
    set(handles.uipanel3,'Visible','off');
    set(handles.pushbutton3,'Visible','off');
else
    set(handles.uipanel3,'Visible','on');
    set(handles.pushbutton3,'Visible','on');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
v =  get(handles.popupmenu1,'Value');
if(strcmp(get(handles.FuncionText,'String'),'') == true || strcmp(get(handles.gin,'string'),'') == true ||strcmp(get(handles.cifras1,'string'),'') == true)
    lll = 'entro'
    k = errordlg('Faltan datos de Entrada','Error');
else          
 switch v   
    case 1 
        %newton
        syms x
        cf = get(handles.FuncionText,'String');
        f = inline(cf);
        dg = diff(cf,x);
        df = inline(dg);
    %---    dg2 = diff(dg,x);
   %    ----- df2 = inline(dg2);
        x=str2double(get(handles.gin,'string'));
        tol = str2double(get(handles.cifras1,'string'));
        i=0; error=100;
        %%table
            set(handles.table,'Data',{})
            set(handles.table,'Data',{})
            set(handles.Raiz,'string','No hay raiz');
        %%table
        while(error>tol)
            %%codigo de verificacion ---------------------
            %if (abs((feval(f,x)*feval(df2,x))/(feval(df,x)).^2)>=1)
             %   set(handles.Raiz,'String','No existe convergencia');
              %  break;
            %end
            %%end codigo de verificacion -----------------
            xa=x;
            x=x-feval(f,x)/feval(df,x);
            error=abs(((x-xa)/x)*100);
            error=double(error);
            x = double(x);
            %table---
                newRow ={i xa x error};
                oldData = get(handles.table,'Data');
                newData=[oldData; newRow];
                set(handles.table,'Data',newData);                
            %%table
            i=i+1;
        end
        set(handles.Raiz,'String',x);
        set(handles.valor,'String',i);
    case 2
       % secante
        syms x
        cf=get(handles.FuncionText,'string');
        f=inline (cf); %#ok<DINLN>
        x1=str2double(get(handles.gin,'String'));
        tol = str2double(get(handles.cifras1,'string'));
        n=0; error=100; d=0.01;
        %%table
            set(handles.table,'Data',{})
            set(handles.table,'Data',{})
            set(handles.Raiz,'string','No hay raiz');
        %%table
        while(error>tol)
            %table---
                newRow ={n x1 f(x1) d error};
                oldData = get(handles.table,'Data');
                newData=[oldData; newRow];
                set(handles.table,'Data',newData);                
            %%table
            n=n+1;
            x = x1 - d*x1*f(x1)/(f(x1 + d*x1)-f(x1));
            error=abs(((x-x1)/x)*100);
            x1 = x;
            
        end
        set(handles.Raiz,'String',x);
        set(handles.valor,'String',n);
        %set(handles.eseca,'String',tol);

    case 3
        
        %punto fijo
        syms x
        cf=get(handles.FuncionText,'string');
        f=inline (cf); %#ok<DINLN>
        cg=get(handles.FuncionText2,'string');
        g=inline (cg); %#ok<DINLN>
        x1=str2double(get(handles.gin,'String'));
        tol = str2double(get(handles.cifras1,'string'));
        error = tol +1;
        iter = 20;
        cont = 0;
        Yn = f(x1);
        
        if true 
             set(handles.Raiz,'string','EL PUNTO NO CONVERGE'); 
        else
            while error>tol && cont<iter
                error = abs(g(x1)-x1)/g(x1);
                x1 = g(x1);
                cont = cont+1;
            end
            if(cont<iter)
                set(handles.Raiz,'String',x1);
                set(handles.valor,'String',cont);
            else
                set(handles.Raiz,'String','No hay raiz :(');
            end
        end
        %set(handles.Raiz,'String','Permisos no concedidos');
        
    otherwise
        set(handles.Raiz,'string','PERMISOS NO CONCEDIDOS'); 
 end
end



function cifras1_Callback(hObject, eventdata, handles)
% hObject    handle to cifras1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cifras1 as text
%        str2double(get(hObject,'String')) returns contents of cifras1 as a double


% --- Executes during object creation, after setting all properties.
function cifras1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cifras1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in senobutton.
function senobutton_Callback(hObject, eventdata, handles)
f = get(handles.FuncionText,'String');
f = f + "sin(x)";
set(handles.FuncionText,'string',f); 


% --- Executes on button press in cosebutton.
function cosebutton_Callback(hObject, eventdata, handles)
f = get(handles.FuncionText,'String');
f = f + "cos(x)";
set(handles.FuncionText,'string',f); 


% --- Executes on button press in logbutton.
function logbutton_Callback(hObject, eventdata, handles)
f = get(handles.FuncionText,'String');
f = f + "log(x)";
set(handles.FuncionText,'string',f); 


% --- Executes on button press in expbutton.
function expbutton_Callback(hObject, eventdata, handles)
f = get(handles.FuncionText,'String');
f = f + "exp(x)";
set(handles.FuncionText,'string',f); 

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
set(handles.FuncionText,'string',"");



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function FuncionText2_Callback(hObject, eventdata, handles)
% hObject    handle to FuncionText2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FuncionText2 as text
%        str2double(get(hObject,'String')) returns contents of FuncionText2 as a double


% --- Executes during object creation, after setting all properties.
function FuncionText2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FuncionText2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
val = get(hObject,'Value');
str = get(hObject,'String');
switch str{val}
    case 'Raices' 
        set(handles.uipanel4,'Visible','off');
        set(handles.uipanel10,'Visible','off');
        set(handles.ajuste,'Visible','off');    
        set(handles.uipanel15,'Visible','off');
         set(handles.uipanel18,'Visible','off');
    case 'Sistemas de Ecuaciones'
        set(handles.uipanel4,'Visible','on');
        set(handles.uipanel10,'Visible','off');
        set(handles.ajuste,'Visible','off');    
        set(handles.uipanel15,'Visible','off');
         set(handles.uipanel18,'Visible','off');
    case 'Interpolacion'
        set(handles.uipanel4,'Visible','off');
        set(handles.uipanel10,'Visible','on');
        set(handles.ajuste,'Visible','off');    
        set(handles.uipanel15,'Visible','off');
         set(handles.uipanel18,'Visible','off');
    case 'Ajuste de Curvas'
        set(handles.uipanel4,'Visible','off');
        set(handles.uipanel10,'Visible','off');
        set(handles.ajuste,'Visible','on');        
        set(handles.uipanel15,'Visible','off');
         set(handles.uipanel18,'Visible','off');
     case 'Integracion Numerica'
        set(handles.uipanel4,'Visible','off');
        set(handles.uipanel10,'Visible','off');
        set(handles.ajuste,'Visible','off');
        set(handles.uipanel15,'Visible','on');
         set(handles.uipanel18,'Visible','off');
    case 'Derivacion Numerica'
        set(handles.uipanel4,'Visible','off');
        set(handles.uipanel10,'Visible','off');
        set(handles.ajuste,'Visible','off');
        set(handles.uipanel15,'Visible','off');
        set(handles.uipanel18,'Visible','on');
    otherwise
        set(handles.uipanel4,'Visible','off');
         set(handles.uipanel18,'Visible','off');
        set(handles.uipanel10,'Visible','off');
        set(handles.ajuste,'Visible','off');    
        set(handles.uipanel15,'Visible','off');
    end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% EXCEL
handles.fileName = uigetfile('*.xlsx');
guidata(hObject,handles);
file = handles.fileName;
S = xlsread(file)
[m n] = size(S);
A = S;
B = S;
A(:,n)=[]
B(:,1:n-1)=[]
set(handles.valor,'string',m);
pushbutton15_Callback(hObject, eventdata, handles);
set(handles.MatrizA, 'Data', A)
set(handles.MatrizB, 'Data', B)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% LIMPIAR
A=str2double(get(handles.MatrizA,'Data'))
B=str2double(get(handles.MatrizB,'Data'))
[m,n]=size(A)
num_elem = cell(m, n);
num_elem1 = cell(m, 1);
%num_elem(:,:)={''};
set(handles.MatrizA, 'Data', num_elem)
set(handles.MatrizB, 'Data', num_elem1)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
%%%%%%%%%%%%%%%%%% MATRIZ A %%%%%%%%%%%%
     n = str2num(get(handles.valor,'String'));
     if n < 1
        f = warndlg('Ingresar un numero de Ecuaciones coherente','Warning');
     else
     Filas = n;
     Columnas = n;
     num_elem = cell(Filas, Columnas);
     %num_elem(:,:)={''};
     set(handles.MatrizA, 'Data', num_elem)
     set(handles.MatrizA, 'ColumnEditable', true(1,Filas))
     %set(handles.MatrizA, 'Visible' , 'on')
     %%%%%%%%%%%%%%% MATRIZ B %%%%%%%%%%%%%%%%
     Filas2 = n;
     Columnas2 = 1;
     num_elem = cell(Filas2, Columnas2);
     %num_elem(:,:)={''};
     set(handles.MatrizB, 'Data', num_elem)
     set(handles.MatrizB, 'ColumnEditable', true(1,Filas2))
     %set(handles.MatrizB, 'Visible' , 'on')
     end
% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
%RESOLUCION DE SISTEMA----------------------------------uitable8
v =  get(handles.popupmenu4,'Value');
A=get(handles.MatrizA,'Data')
B=get(handles.MatrizB,'Data')
[m1,n1] = size(B);
switch v 
    case 1 
        %GJ
        R=rref([A B]);
        X=A\B;
        [m,n] = size(X');
        K = [1:n];
        %set(handles.uitable8,'Data',K); 
         set(handles.uitable8,'Data',K);   
         oldData = get(handles.uitable8,'Data');
         newData=[oldData; X'];
         set(handles.uitable8,'Data',newData);
         %newRow ={n x1 f(x1) d error};
          %      oldData = get(handles.table,'Data');
           %     newData=[oldData; newRow];
            %    set(handles.table,'Data',newData);
    case 2 
        %GSEIDEL
        normVal=Inf; 
        %X0 = zeros(1,m1);
        x = zeros(1,m1)';
        n=size(x,1);
        tol = str2double(get(handles.edit15,'string'));
        itr=0;
        while normVal>tol
            x_old=x;
            for i=1:n
                sigma=0;
                for j=1:i-1
                    sigma=sigma+A(i,j)*x(j);
                end
                for j=i+1:n
                    sigma=sigma+A(i,j)*x_old(j);
                end
                x(i)=(1/A(i,i))*(B(i)-sigma);
            end
            itr=itr+1;
            normVal=norm(x_old-x);
        end 
        set(handles.text35,'String',itr);
        [m,n] = size(x);
        K = [1:m];
        set(handles.uitable8,'Data',K);   
         oldData = get(handles.uitable8,'Data');
         x
         newData=[oldData; x'];
        set(handles.uitable8,'Data',newData);        
    case 3
        %LU---------------------------------------------------------------------------------
        [n,m]=size(A);
        C=[A,B];
        fprintf('\nLa Matriz C, que corresponte a la matriz aumentada [Ab] es = \n');
        disp(C)
        if n==m 
            for k=1:n
                u(k,k)=1; %princio del metodo
                suma=0;
                for p=1:k-1
                    suma=suma+L(k,p)*u(p,k);
                end
                L(k,k)=(A(k,k)-suma); 
                for i=k+1:n
                    suma=0;
                    for r=1:k-1
                        suma=suma+L(i,r)*u(r,k);
                    end
                    L(i,k)=(A(i,k)-suma); %obtencion de la matriz L
                end
                for j=k+1:n
                    suma=0;
                    for s=1:k-1
                        suma=suma+L(k,s)*u(s,j);
                    end
                    u(k,j)=(A(k,j)-suma)/L(k,k); %obtencion de la matriz U
                end
            end
            memoriau=1; %calculo del determinante de u
            memoriaL=1; %calculo del determinante inicial de L
            for i=1:n
                memoriaL=memoriaL*L(i,i); 
            end
            producto=memoriaL*memoriau;  %calculo del determinante total
            if producto~=0
                for i=1:n
                    suma=0;
                    for p=1:i-1
                        suma=suma+L(i,p)*z(p);
                    end
                    z(i)=(B(i)-suma)/L(i,i); %obtencion del vector Z
                end
                for i=n:-1:1
                    suma=0;
                    for p=(i+1):n
                        suma = suma+u(i,p)*x(p);
                    end
                    x(i)=(z(i)-suma)/u(i,i); % solcion, calculos de las variables
                end    
            else
                fprintf('\nEl determinante es igual a cero, por lo tanto el sistema tiene infinita o ninguna solucion\n')
            end
        end
        fprintf('\n Matriz Ab:\n')
        disp(C)
        fprintf('\n Matriz L:\n')
        disp(L)
        fprintf('\n Matriz U:\n')
        disp(u)
        fprintf('\n El vector Z:\n')
        disp(z)
        fprintf('\n\nLa solucion de X1 hasta Xn es:\n');
        %a continuacion de utiliza una instruccion for, para mostrar el usuario, 
        %los resultados de una manera mas ordenada
        for i=1:n
            xi=x(1,i);
            fprintf('\nX%g=',i)
            disp(xi);
        end
        x
        [m,n] = size(x);
        esp = zeros(1,n);
        K = [1:n];
        set(handles.uitable10,'Data',L); 
        oldData1 = get(handles.uitable10,'Data');
        newData1=[oldData1; u];
        set(handles.uitable10,'Data',newData1);
        %
        set(handles.uitable11,'Data',K);   
        oldData = get(handles.uitable11,'Data');
        newData=[oldData; x];
        set(handles.uitable11,'Data',newData);
        %
        oldData = get(handles.uitable11,'Data');
        newData=[oldData; esp];
        set(handles.uitable11,'Data',newData);
        %
        oldData = get(handles.uitable11,'Data');
        newData=[oldData; z];
        set(handles.uitable11,'Data',newData);
        %----------------------------------------------------------------------------------
   
    case 4 
        %JACOBI
        normVal=Inf; 
        %X0 = zeros(1,m1);
        x = zeros(1,m1)';
        n=size(x,1);
        tol = str2double(get(handles.edit15,'string'));
        itr=0;
        while normVal>tol
            xold=x;
            for i=1:n
                sigma=0;
                for j=1:n
                    if j~=i
                        sigma=sigma+A(i,j)*x(j);
                    end
                end
                x(i)=(1/A(i,i))*(B(i)-sigma);
            end
            itr=itr+1;
            normVal=abs(xold-x);
        end
        set(handles.text35,'String',itr);
        [m,n] = size(x);
        K = [1:m];
        set(handles.uitable8,'Data',K);   
         oldData = get(handles.uitable8,'Data');
         x
         newData=[oldData; x'];
        set(handles.uitable8,'Data',newData);  
    otherwise
        %BUG EN POPMENU
 end

% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
val = get(hObject,'Value');
str = get(hObject,'String');
switch str{val}
    case 'GaussJordan' % User selects 
    %handles.current_data = handles.peaks;
        set(handles.edit15,'Visible','off');
        set(handles.text33,'Visible','off');
        set(handles.text35,'Visible','off');
        set(handles.text36,'Visible','off');
          set(handles.uipanel9,'Visible','off');
    case 'GaussSeidel'
        set(handles.edit15,'Visible','on');
        set(handles.text33,'Visible','on');
          set(handles.text35,'Visible','on');
          set(handles.text36,'Visible','on');
            set(handles.uipanel9,'Visible','off');
    case 'LU'
      set(handles.edit15,'Visible','off');
        set(handles.text33,'Visible','off');
         set(handles.text35,'Visible','off');
         set(handles.text36,'Visible','off');
         set(handles.uipanel9,'Visible','on');
         
    case 'Jacobi'
        set(handles.edit15,'Visible','on');
        set(handles.text33,'Visible','on');
         set(handles.text35,'Visible','on');
         set(handles.text36,'Visible','on');
           set(handles.uipanel9,'Visible','off');
    otherwise
        set(handles.edit15,'Visible','off');
        set(handles.text33,'Visible','off');
          set(handles.uipanel9,'Visible','off');
        set(handles.text35,'Visible','off');
         set(handles.text36,'Visible','off');
end
guidata(hObject,handles);

function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%%%%%%%%%%%%%%%%%% MATRIZ A %%%%%%%%%%%%
    
     n = str2num(get(handles.valor,'String'));
     n = n+1;
     set(handles.valor,'string',n);
     if n > 8
         f = warndlg('Se recomienda importar datos desde Excel para ecuaciones mayores a 8','Warning');
     end   
     if n < 1
       % f = warndlg('Ingresar un numero de Ecuaciones coherente','Warning');
     else
     Filas = n;
     Columnas = n;
     num_elem = cell(Filas, Columnas);
     %num_elem(:,:)={''};
     set(handles.MatrizA, 'Data', num_elem)
     set(handles.MatrizA, 'ColumnEditable', true(1,Filas))
     %set(handles.MatrizA, 'Visible' , 'on')
     %%%%%%%%%%%%%%% MATRIZ B %%%%%%%%%%%%%%%%
     Filas2 = n;
     Columnas2 = 1;
     num_elem = cell(Filas2, Columnas2);
     %num_elem(:,:)={''};
     set(handles.MatrizB, 'Data', num_elem)
     set(handles.MatrizB, 'ColumnEditable', true(1,Filas2))
     %set(handles.MatrizB, 'Visible' , 'on')
     end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
%-------------------------------------------------------------
%%%%%%%%%%%%%%%%%% MATRIZ A %%%%%%%%%%%%
     n = str2num(get(handles.valor,'String'));
     if n < 2
       % f = warndlg('Ingresar un numero de Ecuaciones coherente','Warning');
     else
     n = str2num(get(handles.valor,'String'));
     n = n-1;
     set(handles.valor,'string',n);
     
     Filas = n;
     Columnas = n;
     num_elem = cell(Filas, Columnas);
     %num_elem(:,:)={''};
     set(handles.MatrizA, 'Data', num_elem)
     set(handles.MatrizA, 'ColumnEditable', true(1,Filas))
     %set(handles.MatrizA, 'Visible' , 'on')
     %%%%%%%%%%%%%%% MATRIZ B %%%%%%%%%%%%%%%%
     Filas2 = n;
     Columnas2 = 1;
     num_elem = cell(Filas2, Columnas2);
     %num_elem(:,:)={''};
     set(handles.MatrizB, 'Data', num_elem)
     set(handles.MatrizB, 'ColumnEditable', true(1,Filas2))
     %set(handles.MatrizB, 'Visible' , 'on')
     end



% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
%analisis del sistema
A=get(handles.MatrizA,'Data')
b=get(handles.MatrizB,'Data')
Ab=[A b]
i = rank(A)
j = rank(Ab)
n=str2num(get(handles.valor,'String'));
if i == j
    if i == n 
        set(handles.proceso,'string','Sistema compatible con una Unica Solucion'); 
        %set(handles.resultado,'string',''); 
    else
        set(handles.proceso,'string','Sistema compatible con Infinitas Soluciones');
        %set(handles.resultado,'string',''); 
    end
else
    set(handles.proceso,'string','Sistema incompatible, no tiene solucion');
    %set(handles.resultado,'string',''); 
end


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in polinomio1.
function polinomio1_Callback(hObject, eventdata, handles)
% hObject    handle to polinomio1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns polinomio1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from polinomio1


% --- Executes during object creation, after setting all properties.
function polinomio1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to polinomio1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
    global datos cont ;
    x1=datos(cont).puntos(:,1)';
    x2=datos(cont).puntos(:,2)';
    datos(cont).ev1=str2double(get(handles.edit18, 'String'));
    if get(handles.lagrange1,'value')==1
    z{1}=strvcat(sprintf('Polinomio de Lagrange evaluado en %i es :',datos(cont).ev1)...
    ,num2str(lagranged(x1,x2,datos(cont).ev1)),...
    '---------------------------------------------------------------');
    elseif get(handles.splines1,'value')==1
    n=length(x1);
    X=(datos(1).puntos)'; 
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
   z{1}=strvcat(sprintf('El Polinomio/os del Splin Cubico evaluado en: %i es:',datos(cont).ev1)...
   ,polis,'---------------------------------------------------------------');
%   set(handles.text34,'String',[])   
   elseif get(handles.newton1,'value')==1
   z{1}='';
   F=datos(1).newton;
   fun = inline(F)
   z{1}=strvcat(sprintf('Polinomio de Newton evaluado en %i es :',datos(cont).ev1)...
    ,num2str(fun(datos(cont).ev1)),...
    '---------------------------------------------------------------');
   elseif get(handles.finitas1,'value')==1
   z{1}='';
   F=datos(1).finitas;
   fun = inline(F)
    z{1}=strvcat(sprintf('Polinomio de Diferencias Finitas evaluado en %i es :',datos(cont).ev1)...
    ,num2str(fun(datos(cont).ev1)),...
    '---------------------------------------------------------------');
    else
      z{1}='';
    end  
set(handles.polinomio1,'String',z)
% --- Executes on button press in interpolar.
function interpolar_Callback(hObject, eventdata, handles)
clc
cla reset
global datos cont rc xp; 
 if isempty(datos(cont).puntos)==1  % condicion necesaria al cargar datos de excel ,no se pierda
     disp('hola');
    datos(cont).puntos=str2double(get(handles.uitable12,'Data'));
    S = get(handles.uitable12,'Data');
    datos(cont).puntos = S;
 end
x1=datos(cont).puntos(:,1)';
x1
x2=datos(cont).puntos(:,2)';
x2
X=(datos(cont).puntos)';
n=length(x1);
xp=[];
for i=1:n-1; 
    xs=linspace(X(1,i),X(1,i+1));
    xp=[xp,xs];
end
% x=x1(1):0.1:x1(n); 
if get(handles.lagrange1,'value')==1
    if n>7
       fff = warndlg('Se recomienda utilizar otro metodo de interpolacion para datos mayores a 7','Warning');
    end
    for i=1:length(xp)
        y(i)=lagranged(x1,x2,xp(i));
    end
    datos(cont).y=y;
if cont==4
    datos(1:cont-1)=datos(2:cont);
    cont=cont-1;
end
if get(handles.newton1,'value')==0
    mostrargrafica(handles)
end
cont=cont+1;
datos(cont)=datos(cont-1);
elseif get(handles.splines1,'value')==1
   
    % x=x1(1):0.1:x1(n);
    X=(datos(cont).puntos)'; 
    [a,b,c,d]=scubico(X);
    %x1=X(1,1):0.1:X(1,n);
    y=[];
    % x=x1(1):0.1:x1(n);
    for i=1:n-1; 
        xs=linspace(X(1,i),X(1,i+1));
        y11=a(i)+b(i)*(xs-X(1,i))+c(i)*(xs-X(1,i)).^2+d(i)*(xs-X(1,i)).^3;
        y=horzcat(y,y11);   
    end
    datos(cont).y=y;
if cont==4
    datos(1:cont-1)=datos(2:cont);
    cont=cont-1;
end
if get(handles.newton1,'value')==0
    mostrargrafica(handles)
end
cont=cont+1;
datos(cont)=datos(cont-1);
elseif get(handles.newton1,'value')==1
    intervalo=0:1:3 ; 
    axes(handles.axes5)
    hold on;
    plot(x1,x2,'*r')
    DD=zeros(n);
    DD(:,1)=x2;
    for k=2:n
        for J=k:n
            DD(J,k)=[DD(J,k-1)-DD(J-1,k-1)]/[X(J)-X(J-k+1)];
        end
    end
    disp('La matriz de diferencias divididas es:');
    disp(DD);
    disp('El polinomio de newton es');
    syms x;
    polnew=DD(1,1);
    P=1;
    for i=1:n-1
        P=P*(x-x1(i));
        polnew=polnew+P*DD(i+1,i+1);
    end
    polnew=expand(polnew);
    pretty(polnew);
    vi=eval(polnew);
      F=char(polnew);
      datos(1).newton=F;
    %set(handles.text5, 'String',F); 
    %plot(x,vi,'r+');
    ezplot(vi,[x1(1),x1(n)])
    %x1 = [-10:0.01:10];
    %x2 = subs(vi,x,x1);
    %plot(x1,x2,'o'
    % xm=x1(1):0.1:x1(n);  
    %metodo de newton
elseif get(handles.finitas1,'value')==1
    
    %metodo de diferencias finitas
    axes(handles.axes5)
    hold on;
    plot(x1,x2,'*r')
    x1=x1';
    x2=x2';    
    if(length(x1)~=length(x2))
         fff = warndlg('X e Y tienen dimensiones distintas','Warning');
    else
        d=x1(2)-x1(1);
        sw=0;
        for i=2:length(x1)
            if (x1(i)-x1(i-1))~=d
                sw=1;
            end
        end    
        if sw==1
            fff = warndlg('X no es espaciado uniformemente','Warning');
        else
            s = zeros(length(x1));
            d = size(x2);
            if d(1)==length(x2)
                s(:,1)=x2;
            else
                s(:,1)=x2';
            end
            for i =2:length(x2)
                for j=i:length(x2)
                    s(j,i)=s(j,i-1)-s(j-1,i-1);
                end
            end
            s
            xx=x1;
            syms x;
            p=0;
            for i = 1:length(x2)
                f=1;
                for j=1:i-1
                    f=f*(x-xx(j));
                end
                p=p+s(i,i)*f;
            end
            %p=simple(p);    
            disp('El polinomio es:');
            p
            datos(1).finitas=p;
            ezplot(p,[xx(1),xx(length(x1))]);
            %evaluando para xk-----
      %      s=zeros(length(xk),1);
     %       for i=1:length(xk)
    %            s(i)=double(limit(p,xk(i)))
   %         end
  %          fprintf('La solucion es:\n');
 %           for i = 1:length(xk)
%                fprintf('p(%0.3f)=%f\n',xk(i),s(i));
            %end
            %---------
        end
    end    
    
else
    %error
end


 guidata(hObject,handles);
% --- Executes on button press in pushbutton30.
function mostrargrafica(handles)
   global datos cont  xp
   axes(handles.axes5)
   x1=datos(1).puntos(:,1)';
   x2=datos(1).puntos(:,2)';
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
   
    r1{j}='Lagrange';  
%      z{j}=strvcat(sprintf('Polinomio de Lagrange es:')...
%          ,sprintf(strcat(char('P(x)='),char(datos(j).poli_lag))),...
%      '---------------------------------------------------------------');

      elseif datos(j).metodo==2
      r1{j}='Splines Cubicos';
         
%       z{j}=strvcat(sprintf('Polinomio Asociado al Splin Cubico es:')...
%          ,sprintf(strcat(char('P(x)='),char(datos(j).poli_splin))),...
%      '---------------------------------------------------------------');

      elseif datos(j).metodo==3
        r1{j}='Newton';
%       z{j}=strvcat(sprintf('Polinomio de Minimos cuadrados de grado= %i  es:',datos(j).grado)...
%           ,sprintf(strcat(char('P(x)='),char(datos(j).poli_min))),...
%       '---------------------------------------------------------------');
      elseif datos(j).metodo==4
        r1{j}='Diferencias Finitas';  
        else
        %no hay nada
        
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

function pushbutton30_Callback(hObject, eventdata, handles)
set(handles.uitable12,'Data',[]);
set(handles.edit20,'string',[]);
set(handles.polinomio1,'string','');
set(handles.cifras1,'string','');
set(handles.edit18,'string','');
cla reset


function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton31. GENERAR DATOS ID
function pushbutton31_Callback(hObject, eventdata, handles)
global datos cont ;
datos(1).npuntos=str2double(get(handles.edit20, 'String'));
set(handles.uitable12,'Visible','on')
        num_elem=cell(datos(1).npuntos,2);
        num_elem(:,:)={''};
        set(handles.uitable12,'data',num_elem);
        set(handles.uitable12,'ColumnEditable',true(1,1))
  guidata(hObject,handles);
datos(cont).puntos=[];


% --- Executes on button press in
% pushbutton33.EXCELLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
function pushbutton33_Callback(hObject, eventdata, handles)
% EXCEL yupi
global datos cont ;
datos(1).npuntos=str2double(get(handles.edit20, 'String'));
set(handles.uitable12,'Visible','on')
handles.fileName = uigetfile('*.xlsx');
guidata(hObject,handles);
file = handles.fileName;
S = xlsread(file);
[m n] = size(S);

set(handles.edit20,'string',m);
%pushbutton31_Callback(hObject, eventdata, handles);
set(handles.uitable12, 'Data', S)

% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
global datos cont rc;
x1=datos(cont).puntos(:,1)';
x2=datos(cont).puntos(:,2)';
X=(datos(cont).puntos)';
    if get(handles.lagrange1,'value')==1
        poli2=lagranged(x1,x2);
        datos(cont).decimales1=str2double(get(handles.cifras1, 'String'));
        rc=strcat('%.',num2str(datos(cont).decimales1),'f');
        poli3=poli_deci(poli2,rc);
        z{1}=strvcat(sprintf('Polinomio de Lagrange es:')...
        ,sprintf(strcat(char('P(x)~'),char(poli3))),...
        '---------------------------------------------------------------');
    elseif get(handles.splines1,'value')==1
        n=length(x1)
        X=(datos(1).puntos)'
        %[a1,b1]=[x1(1),x1(n)];
        a1 = x1(1);
        b1 = x1(n);
        z1=strcat('El intervalo Ingresado es :','[',num2str(a1),',',num2str(b1),']');
        %set(handles.text34,'String',z1)  
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
        z{1}=strvcat(sprintf('Polinomio/os Asociado al Splin Cubico es:')...
        ,polis,'---------------------------------------------------------------');
    elseif get(handles.newton1,'value')==1
        n=length(x1);
        intervalo=0:1:3 ; 
        DD=zeros(n);
        DD(:,1)=x2;
        for k=2:n
            for J=k:n
                DD(J,k)=[DD(J,k-1)-DD(J-1,k-1)]/[X(J)-X(J-k+1)];
            end
        end
        disp('La matriz de diferencias divididas es:');
        disp(DD);
        [fi ci]=size(DD);
        Pr = num2str(DD);
        disp('El polinomio de newton es');
        syms x;
        polnew=DD(1,1);
        P=1;
        for i=1:n-1
            P=P*(x-x1(i));
            polnew=polnew+P*DD(i+1,i+1);
        end
        polnew=expand(polnew);
        pretty(polnew);
        vi=eval(polnew);
        F=char(polnew);
        %set(handles.text5, 'String',F); 
        %plot(x,vi,'r+');
        %metodo de newton
        ddn = char(DD);
        z{1}=strvcat(sprintf('Matriz de Diferencias Divididas de Newton es:')...
        ,Pr,'---------------------------------------------------------------','Polinomio de Newton por DD es:',F,'---------------------------------------------------------------');
    elseif get(handles.finitas1,'value')==1        
        %metodo de diferencias finitas
        x1=x1';
        x2=x2';    
        if(length(x1)~=length(x2))
            disp('X e Y tienen dimensiones distintas');
        else
        d=x1(2)-x1(1);
        sw=0;
        for i=2:length(x1)
            if (x1(i)-x1(i-1))~=d
                sw=1;
            end
        end    
        if sw==1
            disp('X no es espaciado uniformemente');
        else
            s = zeros(length(x1));
            d = size(x2);
            if d(1)==length(x2)
                s(:,1)=x2;
            else
                s(:,1)=x2';
            end
            for i =2:length(x2)
                for j=i:length(x2)
                    s(j,i)=s(j,i-1)-s(j-1,i-1);
                end
            end
            s
            xx=x1;
            syms x;
            p=0;
            for i = 1:length(x2)
                f=1;
                for j=1:i-1
                    f=f*(x-xx(j));
                end
                p=p+s(i,i)*f;
            end
            %p=simple(p);    
            disp('El polinomio es:');
            p
        end
        
        end    
        asd = num2str(s);
        F = char(p);
      z{1}=strvcat(sprintf('Matriz de Diferencias Finitas es:')...
        ,asd,'---------------------------------------------------------------','Polinomio por DF es:',F,'---------------------------------------------------------------');
    
    else
        z{1}='';
    end

set(handles.polinomio1,'String',z)


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton41.
function pushbutton41_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton42.
function pushbutton42_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton43.
function pushbutton43_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton44.
function pushbutton44_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit26 as text
%        str2double(get(hObject,'String')) returns contents of edit26 as a double


% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton45.
function pushbutton45_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton46.
function pushbutton46_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton47.
function pushbutton47_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton53.
function pushbutton53_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit29_Callback(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit29 as text
%        str2double(get(hObject,'String')) returns contents of edit29 as a double


% --- Executes during object creation, after setting all properties.
function edit29_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox5.
function listbox5_Callback(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox5


% --- Executes during object creation, after setting all properties.
function listbox5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton52.
function pushbutton52_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Excel Ajuste de Curvas
function pushbutton51_Callback(hObject, eventdata, handles)
handles.fileName = uigetfile('*.xlsx');
guidata(hObject,handles);
file = handles.fileName;
S = xlsread(file);
[m n] = size(S);
set(handles.edit27,'string',m);
set(handles.uitable15, 'Data', S);


function edit28_Callback(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit28 as text
%        str2double(get(hObject,'String')) returns contents of edit28 as a double


% --- Executes during object creation, after setting all properties.
function edit28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton50.
function pushbutton50_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit27_Callback(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit27 as text
%        str2double(get(hObject,'String')) returns contents of edit27 as a double


% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton49.
function pushbutton49_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- EJECUTAR AJUSTE DE CURVA bbb
function pushbutton48_Callback(hObject, eventdata, handles)
clc
cla reset
S = get(handles.uitable15,'Data');
S
if isempty(S)==1
    fff = warndlg('NO EXISTEN DATOS','Warning');
else
    S = get(handles.uitable15,'Data');
    x=S(:,1)';
    y=S(:,2)';
    n=length(x);
    %ver opcion seleccionada
    if get(handles.lineal1,'value')==1
        axes(handles.axes8)
        hold on;
        plot(x,y,'o');
        p = polyfit(x,y,1);
        y1 = polyval(p,x);
        plot(x,y1);
        hold off
        R =corrcoef(x,y);
        asd = num2str(R(1,2));
        cadena = sprintf('y=%8.6f+%8.6fx',p(2),p(1));
        z=strvcat(sprintf('Coeficiente de Correlacion es:')...
        ,asd,'---------------------------------------------------------------','La recta es:',cadena,'---------------------------------------------------------------');
        set(handles.listbox5,'String',z)
    
    elseif get(handles.polinomial1,'value')==1
        axes(handles.axes8)
        hold on;
        X=S;
        xp=[];
        n=length(x);
        plot(x,y,'o');
        grado=str2double(get(handles.edit30,'String'));
        if grado <length(X(:,1))
            [coeficientes]=mincuad(X,grado);
            yfit=polyval(coeficientes,x)
            rc=strcat('%.',num2str(3),'f');
            poli3=poli_deci(coeficientes,rc);
            funcion=inline(poli3);
            plot(x,funcion(x));
        else
            errordlg('Ingrese un Grado Menor a el Nro de puntos ','Minimos Cuadrados');
            return
        end
        R =corrcoef(x,yfit);
        asd = num2str(R(1,2));
        z=strvcat(sprintf('Coeficiente de Correlacion es:')...
        ,asd,'---------------------------------------------------------------','Polinomio es: ',char(funcion),'---------------------------------------------------------------');
        set(handles.listbox5,'String',z)
    elseif get(handles.exponencial1,'value')==1
        axes(handles.axes8)
        hold on;
        plot(x,y,'o');
        p = polyfit(x,log(y),1);
        y1 = polyval(p,x);
        a=exp(p(2));
        b=p(1);
        z=@(x) a*exp(b*x);
        fplot(z,[x(1),x(length(x))]);
        R =corrcoef(x,log(y));
        asd = num2str(R(1,2));
        hold off
        cadena = sprintf('y=%8.6f+e^(%8.6fx)',a,b);
        z=strvcat(sprintf('Coeficiente de Correlacion es:')...
        ,asd,'---------------------------------------------------------------','La curva es:',cadena,'---------------------------------------------------------------');
        set(handles.listbox5,'String',z)
    elseif get(handles.logaritmica1,'value')==1
        axes(handles.axes8)
        hold on;
        plot(x,y,'o');
        p = polyfit(log(x),y,1);
        y1 = polyval(p,x);
        b=p(1)
        a=p(2)
        z=@(x) a+b*log(x);
        fplot(z,[x(1),x(length(x))]);
        hold off
        R =corrcoef(log(x),y);
        asd = num2str(R(1,2));
        cadena = sprintf('y=%8.6f+%8.6f*log(x)',a,b);
        g=strvcat(sprintf('Coeficiente de Correlacion es:')...
        ,asd,'---------------------------------------------------------------','La curva es:',cadena,'---------------------------------------------------------------');
        set(handles.listbox5,'String',g)
    end
end


function edit30_Callback(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit30 as text
%        str2double(get(hObject,'String')) returns contents of edit30 as a double


% --- Executes during object creation, after setting all properties.
function edit30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton55.
function pushbutton55_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in lineal1.
function lineal1_Callback(hObject, eventdata, handles)
% hObject    handle to lineal1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of lineal1
% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup20_SelectionChangedFcn(hObject, eventdata, handles)
if hObject == handles.polinomial1
    set(handles.text64,'Visible','on');
    set(handles.edit30,'Visible','on');
else
     set(handles.text64,'Visible','off');
    set(handles.edit30,'Visible','off');
end


% --- INTEGRAR
function pushbutton56_Callback(hObject, eventdata, handles)
clc
cla reset
axes(handles.axes9)
f = get(handles.edit31,'String');
xa = str2double(get(handles.edit32,'string'))
xb = str2double(get(handles.edit33,'string'))
ezplot (f,[xa xb]);
f = inline(f)
syms x
chr = latex(f(x));
%simpson 1/3
if get(handles.radiobutton24,'value')==1
    axes(handles.axes10)
    set(handles.axes10,'XTick',[],'YTick',[])
    ag=quad(f,xa,xb)
    z=strcat('$$ \int_{',num2str(xa),'}^{',num2str(xb),'}',chr,'dx = ',num2str(ag),'$$')
    axis off
    title(z,'Interpreter','latex');
    axis off
    %simpson 3/8
elseif get(handles.radiobutton25,'value')==1
    n=str2num(get(handles.edit34,'string'));
    a=xa;
    b=xb;
    format short g
    % Determine the exact solution
    exact = quad(f,a,b) 
    % Determine number of different segments to consider
    nstep = floor(log2(n)) ;
    for i=0:nstep-1
      % Determine number of segments and h
      NN(i+1)=2^(i+1) ;
      h=(b-a)/NN(i+1) ;
      % Use the rule to find the approximation
      integral = f(a) + f(b) ;
      for j=1:2:NN(i+1)-1
          integral = integral + 3*f(a+h*j) ;
      end
      for j=2:2:NN(i+1)-2
          integral = integral + 3*f(a+h*j) ;
      end
      for j=3:2:NN(i+1)-3
          integral = integral + 2*f(a+h*j) ;
      end
      integral = integral * 3 * h/8 ;
      YY(i+1)=integral ;
      % Compute Errors
      Et(i+1)=exact-integral ;
      Etabs(i+1)=abs((integral-exact)/exact) ;
      if(i > 0)
          Ea(i+1)=YY(i+1)-YY(i) ;
          Eaabs(i+1)=abs((YY(i+1)-YY(i))/YY(i)) ;
          SD(i+1)=floor((2-log10(Eaabs(i+1)/0.5))) ;
          if(SD(i+1)<0)
              SD(i+1)=0
          end
      else
          Ea(1)=0 ;
          Eaabs(1)=0 ;
          SD(1)=0 ;
      end
    end
    % The following builds and displays a table of values
    disp(sprintf('\n\n************************Table of Values******************************\n'))
    disp('        Approx        True     Relative      Approx   Rel Appr   Sig   ')
    disp(' n     Integral       Error   True Error     Error     Error   Digits ')
    disp('-----------------------------------------------------------------------')
    for i=1:nstep
      if(i > 1)
          if(exact || YY(i) > 0)
              disp(sprintf('%4i  %+1.3e  %+1.3e  %+1.3e  %+1.3e  %+1.3e  %2i',NN(i),YY(i),Et(i),Etabs(i),Ea(i),Eaabs(i),SD(i) ))
          else
              disp(sprintf('%4i  %+1.3e  %+1.3e     n/a      %+1.3e      n/a     n/a',NN(i),YY(i),Etabs(i),Ea(i)))
          end
      else
          disp(sprintf('%4i  %+1.3e  %+1.3e  %+1.3e      n/a         n/a     n/a',NN(i),YY(i),Et(i),Etabs(i)))
      end
    end
    disp('-----------------------------------------------------------------------')
    % This function detects information about your
    % screensize and tries to then place/size the graphs accordingly.
    scnsize = get(0,'ScreenSize');
    % Graph: The following code sets up the graphical depiction of the method.
    x(1)=a ;
    y(1)=f(a) ;
    axes(handles.axes9)
    hold on
    for i=1:n
        x(i+1)=a+i*h ;
        y(i+1)=f(x(i+1)) ;
    end
    for i=2:2:n-1
        bg = i-1 ;
        ed = i + 1 ;
        coeffs = polyfit(x(bg:ed), y(bg:ed), 2);
        poly_x1 = [x(bg):(x(ed) - x(bg))/1000:x(ed)];
        poly_y1 = coeffs(1)*poly_x1.^2 + coeffs(2)*poly_x1 + coeffs(3);
        poly_x1 = [poly_x1(1) poly_x1 poly_x1(end)];
        poly_y1 = [0 poly_y1 0];
        fill(poly_x1, poly_y1, 'y')
    end
    xrange=a:(b-a)/1000:b;
    plot(xrange,f(xrange),'k','Linewidth',2)
    title('Integrand function and Graphical Depiction of Simpson''s 3/8 Rule')
    hold off   
     axes(handles.axes10)
    set(handles.axes10,'XTick',[],'YTick',[])
    ag=integral
    z=strcat('$$ \int_{',num2str(xa),'}^{',num2str(xb),'}',chr,'dx = ',num2str(ag),'$$')
    axis off
    title(z,'Interpreter','latex');
    axis off
     
    %romberg
elseif get(handles.radiobutton26,'value')==1
   % n=str2num(get(handles.edit34,'string'))
    %disp('entra')
   
 fprintf('\t\tINTEGRACION DE ROMBERG\n')
 funcion=cos(x);
 b=1;
 a=0;
 n=3;
 tol=0.01;
 M=1;
 h=b-a;
 err=1;
 J=0;
 R=zeros(4,4);
 x=a;
 f_a=eval(funcion);
 x=b;
 f_b=eval(funcion);
 R(1,1)=h*(f_a+f_b)/2;
 disp(' quad err h')
 while((err>tol)&(J<n))|(J<4)
 J=J+1;
 h=h/2;
 s=0;
 for p=1:M
 x1=a+h*(2*p-1);
 x=x1;
 f_x1=eval(funcion);
 s=s+f_x1;
 end
 R(J+1,1)=R(J,1)/2+h*s;
 M=2*M;
 for K=1:J
 R(J+1,K+1)=R(J+1,K)+(R(J+1,K)-R(J,K))/(4^K-1);
 end
 err=abs(R(J,J)-R(J+1,K+1));
 fprintf('%10.9f %10.9f %10.9f\n',R(J+1,J+1),err,h)
 end
 disp('LA MATRIZ TRIANGULAR INFERIOR ES:')
 disp(R)
 disp('El error es para el numero de particiones:')
 disp(err)
 disp('El tamaño de la ultima particion es:')
 disp(h)
 disp('La respuesta es:')
 disp(R(J+1,J+1))
    
    axes(handles.axes10)
    set(handles.axes10,'XTick',[],'YTick',[])
    ag=R(J+1,J+1)
    z=strcat('$$ \int_{',num2str(xa),'}^{',num2str(xb),'}',chr,'dx = ',num2str(ag),'$$')
    axis off
    title(z,'Interpreter','latex');
    axis off
    %trap
elseif get(handles.radiobutton27,'value')==1
     axes(handles.axes10)
    set(handles.axes10,'XTick',[],'YTick',[])
    X = [xa:0.01:xb]
    Y=f(X)
    syms x
    ag=trapz(X,Y)
    z=strcat('$$ \int_{',num2str(xa),'}^{',num2str(xb),'}',chr,'dx = ',num2str(ag),'$$')
    axis off
    title(z,'Interpreter','latex');
    axis off
end


function R=f_Romberg(funcion,a,b,n)
h=(b-a);
M=1;
J=0;
R=zeros(n,n);
R(1,1)=h*(feval(funcion,a)+feval(funcion,b))/2;
while (J<(n-1)) 
    J=J+1; 
    h=h/2; 
    s=0;
    for p=1:M
        s=s+feval(funcion,a+h*(2*p-1));
    end
    R(J+1,1)=(1/2)*(R(J,1))+h*s; 
    M=2*M;   
    for k =1:J  
        R(J+1,k+1)=R(J+1,k)+(R(J+1,k)-R(J,k))/(4^k-1);  
    end
end
R
fprintf('La aproximacion buscada es: %10.15f\n\n', R(J+1,J+1))
% --- Executes on button press in pushbutton57.
function pushbutton57_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit34_Callback(hObject, eventdata, handles)
% hObject    handle to edit34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit34 as text
%        str2double(get(hObject,'String')) returns contents of edit34 as a double


% --- Executes during object creation, after setting all properties.
function edit34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit31_Callback(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit31 as text
%        str2double(get(hObject,'String')) returns contents of edit31 as a double


% --- Executes during object creation, after setting all properties.
function edit31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit32_Callback(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit32 as text
%        str2double(get(hObject,'String')) returns contents of edit32 as a double


% --- Executes during object creation, after setting all properties.
function edit32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit33_Callback(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit33 as text
%        str2double(get(hObject,'String')) returns contents of edit33 as a double


% --- Executes during object creation, after setting all properties.
function edit33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox6.
function listbox6_Callback(hObject, eventdata, handles)
% hObject    handle to listbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox6


% --- Executes during object creation, after setting all properties.
function listbox6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function resultado_Callback(hObject, eventdata, handles)
% hObject    handle to resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultado as text
%        str2double(get(hObject,'String')) returns contents of resultado as a double


% --- Executes during object creation, after setting all properties.
function resultado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function error_Callback(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of error as text
%        str2double(get(hObject,'String')) returns contents of error as a double


% --- Executes during object creation, after setting all properties.
function error_CreateFcn(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton58.
function pushbutton58_Callback(hObject, eventdata, handles)

grado_group=get(handles.grado,'SelectedObject');
grado=get(grado_group,'String');

caso_group=get(handles.caso,'SelectedObject');
caso=get(caso_group,'String');

f=get(handles.funcion,'String');
x=get(handles.xi,'String');
h=get(handles.h,'String');

switch grado
    case 'Primera Derivacion'
       if strcmp(caso,'Metodo Regresivo')
          [resultado,error]=primeraregresiva(f,x,h);
       elseif strcmp(caso,'Metodo Central')
          [resultado,error]=primeracentrada(f,x,h);
       elseif strcmp(caso,'Metodo Progresiva')
          [resultado,error]=primeraprogresiva(f,x,h);
       end
    case 'Segunda Derivacion'
        if strcmp(caso,'Metodo Regresivo')
          [resultado,error]=segundaregresiva(f,x,h);
       elseif strcmp(caso,'Metodo Central')
          [resultado,error]=segundacentrada(f,x,h);
       elseif strcmp(caso,'Metodo Progresiva')
          [resultado,error]=segundaprogresiva(f,x,h);
       end
    case 'Tercera Derivacion'
        if strcmp(caso,'Metodo Regresivo')
          [resultado,error]=terceraregresiva(f,x,h);
       elseif strcmp(caso,'Metodo Central')
          [resultado,error]=terceracentrada(f,x,h);
       elseif strcmp(caso,'Metodo Progresiva')
          [resultado,error]=terceraprogresiva(f,x,h);
       end
        
end 
set(handles.resultado,'String',char(resultado));
set(handles.error,'String',char(error));

function funcion_Callback(hObject, eventdata, handles)
% hObject    handle to funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of funcion as text
%        str2double(get(hObject,'String')) returns contents of funcion as a double


% --- Executes during object creation, after setting all properties.
function funcion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xi_Callback(hObject, eventdata, handles)
% hObject    handle to xi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xi as text
%        str2double(get(hObject,'String')) returns contents of xi as a double


% --- Executes during object creation, after setting all properties.
function xi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function h_Callback(hObject, eventdata, handles)
% hObject    handle to h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of h as text
%        str2double(get(hObject,'String')) returns contents of h as a double


% --- Executes during object creation, after setting all properties.
function h_CreateFcn(hObject, eventdata, handles)
% hObject    handle to h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton59.
function pushbutton59_Callback(hObject, eventdata, handles)
%axes(handles.axes11)
fx=get(handles.funcion,'String');
f=str2sym(fx);
syms x;
fplot(handles.axes11,f,[-10,10]);
grid on
