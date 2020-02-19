function varargout = Calculadora_Raices(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Calculadora_Raices_OpeningFcn, ...
                   'gui_OutputFcn',  @Calculadora_Raices_OutputFcn, ...
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

function Calculadora_Raices_OpeningFcn(hObject, ~, handles, varargin)
global tyMethod Method;
tyMethod = 1;
Method = 'Fixed Point';
handles.output = hObject;
guidata(hObject, handles);
function varargout = Calculadora_Raices_OutputFcn(~, ~, handles) 
varargout{1} = handles.output;

function edit10_Callback(~, ~, ~)
function edit10_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit11_Callback(~, ~, ~)
function edit11_CreateFcn(hObject, ~, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton9_Callback(~, ~, ~)
function pushbutton10_Callback(hObject, eventdata, handles)
function edit12_Callback(hObject, eventdata, handles)
function edit12_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton11_Callback(hObject, eventdata, handles)
function edit18_Callback(hObject, eventdata, handles)
function edit18_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton12_Callback(hObject, eventdata, handles)
function pushbutton13_Callback(hObject, eventdata, handles)
function pushbutton14_Callback(hObject, eventdata, handles)
function pushbutton15_Callback(hObject, eventdata, handles)
function pushbutton16_Callback(hObject, eventdata, handles)
function edit15_Callback(hObject, eventdata, handles)
function edit15_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit16_Callback(hObject, eventdata, handles)
function edit16_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenu4_Callback(hObject, eventdata, handles)
function popupmenu4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit17_Callback(hObject, eventdata, handles)
function edit17_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenu3_Callback(hObject, eventdata, handles)
function popupmenu3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
function edit13_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
function edit14_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Function_Calculator_Roots_Callback(hObject, eventdata, ~)
function Function_Calculator_Roots_CreateFcn(hObject, eventdata, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Graph_Function_Calculator_Roots_Callback(~, ~, handles)
clc
cla reset
axes(handles.Axes_Calculator_Roots);
lx1 = str2double(get(handles.Edit_Limit_1_X_Graph_Calculator_Roots,'string'));
lx2 = str2double(get(handles.Edit_Limit_2_X_Graph_Calculator_Roots,'string'));
f=get(handles.Function_Calculator_Roots,'String');
fun = str2func(['@(x)',f]);
x1 = lx1:0.001:lx2;
syms x
plot(x1,arrayfun(fun,x1));
xlim([lx1 lx2])
xlabel('x','Interpreter','latex');
title(['$ f(x) = ' latex(fun(x)) '$ for $x$ in $[' num2str(lx1) ',' num2str(lx2) ']$' ],'Interpreter','latex');
grid on
% --- Executes on button press in Button_sin.
function Button_sin_Callback(hObject, eventdata, handles)
f = get(handles.Function_Calculator_Roots,'String');
f = f + "sin(x)";
set(handles.Function_Calculator_Roots,'string',f);

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
set(handles.Table_Calculator_Roots,'Data',[]);
set(handles.Function_Calculator_Roots,'string','');
set(handles.Edit_Limit_1_X_Graph_Calculator_Roots,'string','');
set(handles.Edit_Limit_2_X_Graph_Calculator_Roots,'string','');
set(handles.Edit_functionGx_Calculator_Roots,'string','');
set(handles.Edit_Point1_Calculator_Roots,'string','');
set(handles.Edit_Point2_Calculator_Roots,'string','');
set(handles.Edit_Tolerance_Calculetor_Roots,'string','');
set(handles.Edit_iterations_Calculator_Roots,'string','');
set(handles.Edit_roots_Calculator_Roots,'string','');
set(handles.edit22,'string',''); %limit upper
set(handles.edit31,'string',''); %limit lower
cla reset

% --- Executes on button press in Button_cos.
function Button_cos_Callback(hObject, eventdata, handles)
f = get(handles.Function_Calculator_Roots,'String');
f = f + "cos(x)";
set(handles.Function_Calculator_Roots,'string',f);

% --- Executes on button press in Button_tan.
function Button_tan_Callback(hObject, eventdata, handles)
f = get(handles.Function_Calculator_Roots,'String');
f = f + "tan(x)";
set(handles.Function_Calculator_Roots,'string',f);

% --- Executes on button press in Button_exp.
function Button_exp_Callback(hObject, eventdata, handles)
f = get(handles.Function_Calculator_Roots,'String');
f = f + "exp(x)";
set(handles.Function_Calculator_Roots,'string',f);

% --- Executes on button press in Button_sqrt.
function Button_sqrt_Callback(hObject, eventdata, handles)
f = get(handles.Function_Calculator_Roots,'String');
f = f + "sqrt(x)";
set(handles.Function_Calculator_Roots,'string',f);

% --- Executes on button press in Button_pow.
function Button_pow_Callback(hObject, eventdata, handles)
f = get(handles.Function_Calculator_Roots,'String');
f = f + "()^(n)";
set(handles.Function_Calculator_Roots,'string',f);

% --- Executes on selection change in Popupmenu_ClosedMethod_Caculator_Roots.
function Popupmenu_ClosedMethod_Caculator_Roots_Callback(hObject, eventdata, handles)
global Method;
val = get(hObject,'Value');
str = get(hObject,'String');
switch val
    case 1
        Method = 'Bisection';        
    case 2
        Method = 'False Position';
    otherwise
        disp('detec');
end
guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function Popupmenu_ClosedMethod_Caculator_Roots_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
function edit22_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Button_Root_Calculator_Roots.
function Button_Root_Calculator_Roots_Callback(hObject, eventdata, handles)
global tyMethod Method;
clc
set(handles.Table_Calculator_Roots,'Data',[]);
iterations = 0;
f1 = get(handles.Function_Calculator_Roots,'String');
f = str2func(['@(x)',f1])
tol = str2double(get(handles.Edit_Tolerance_Calculetor_Roots,'string'));
if(tyMethod == 1)
    disp(' ***** Open Method *****');
    switch Method
        case 'Fixed Point'
            disp(' > Method Fixed Point')
            %AXES
            axes(handles.Axes_Calculator_Roots);
            cla reset
            x=str2sym('x');
            x1_a = -10:0.001:10;
            plot(x1_a,arrayfun(f,x1_a)); 
            xlabel('x','Interpreter','latex');
            title(['$ f(x) = ' latex(f(x)) '$' ],'Interpreter','latex');
            grid on                             
            hold on
            %AXES
            g1 = get(handles.Edit_functionGx_Calculator_Roots,'String');
            g = str2func(['@(x)',g1]);
            plot(x1_a,arrayfun(g,x1_a));
            point = str2double(get(handles.Edit_Point1_Calculator_Roots,'string'));
            if(strcmp(f1,"") == true || strcmp(get(handles.Edit_Point1_Calculator_Roots,'string'),"") == true || strcmp(g1,"") == true  || strcmp(get(handles.Edit_Tolerance_Calculetor_Roots,'string'),"") == true )
                errordlg('Missing Input Data','Error');
            else
                %METHOD
                x=str2sym('x');             
                dg = diff(g, x);
                x = str2double(get(handles.Edit_Point1_Calculator_Roots,'string'));
                if(0<=g(x))
                    plot([x x],[0 g(x)],'k--');
                else
                    plot([x x],[g(x) 0],'k--');
                end
                if(abs(eval(dg))<1)
                    fprintf('   0.0000     %7.4f   ------\n',x);
                    iterations=0; error=100;
                    while(error>tol)
                        iterations=iterations+1;
                        anterior = x;
                        x = g(x);
                        error = abs(x-anterior);
                        disp([iterations,x,error]);
                         %table---
                            newRow ={iterations anterior f(x) g(x) error};
                            oldData = get(handles.Table_Calculator_Roots,'Data');
                            newData=[oldData; newRow];
                            set(handles.Table_Calculator_Roots,'Data',newData);                
                        %%table
                        if(anterior<=f(x))
                            plot([anterior f(x)],[g(anterior) g(anterior)],'k--');
                        else
                            plot([f(x) anterior],[g(anterior) g(anterior)],'k--');
                        end
                        if(f(x)<g(x))
                            plot([x x],[f(x) g(x)],'k--');                           
                        else
                            plot([x x],[g(x) f(x)],'k--');
                        end
                    end
                    xlim([g(x)-0.2 g(x)+0.2])
                    plot([x x], [f(x) f(x)],'g*')
                    set(handles.Edit_Limit_1_X_Graph_Calculator_Roots,'string',g(x)-0.2);
                    set(handles.Edit_Limit_2_X_Graph_Calculator_Roots,'string',g(x)+0.2);
                    set(handles.Edit_roots_Calculator_Roots,'String',g(x));
                    set(handles.Edit_iterations_Calculator_Roots,'String',iterations);
                    hold off
                else
                    disp('Divergence was Found');
                    warndlg('Divergence was Found');
                end
                
            end
        case 'Newton'
            disp(' > Method Newton')
            point = str2double(get(handles.Edit_Point1_Calculator_Roots,'string'))
            if(strcmp(f1,"") == true || strcmp(get(handles.Edit_Point1_Calculator_Roots,'string'),"") == true ||strcmp(get(handles.Edit_Tolerance_Calculetor_Roots,'string'),"") == true )
                errordlg('Missing Input Data','Error');
            else
            %method
                %AXES
                axes(handles.Axes_Calculator_Roots);
                cla reset
                x=str2sym('x');
                x1_a = -10:0.001:10;
                plot(x1_a,arrayfun(f,x1_a),'LineWidth',1); 
                xlabel('x','Interpreter','latex');
                title(['$ f(x) = ' latex(f(x)) '$' ],'Interpreter','latex');
                grid on
                hold on
                df = diff(f,x);             
                df = sym2str(df);
                df=str2func(strcat('@(x)',df));
                %plot(x1_a,arrayfun(df,x1_a));
                x=point;
                error=50;
                while(error>tol)
                    fprintf('\t%i\t%3.5f\t%f\n',iterations,x,error);
                    y=@(a,x) df(x)*(a-x)+f(x);
                    plot(x1_a,y(x1_a,x),'k--');
                    iterations = iterations+1;
                    anterior = x;
                    x = x - f(x)/df(x);
                    error = abs(f(x));
                    %table---
                    newRow ={iterations anterior f(x) x error};
                    oldData = get(handles.Table_Calculator_Roots,'Data');
                    newData=[oldData; newRow];
                    set(handles.Table_Calculator_Roots,'Data',newData);                
                    %%table
                    if(iterations>100)
                        disp('Divergence was Found');
                        warndlg('Divergence was Found');
                        break;
                    end
                end
                plot([x x], [f(x) f(x)],'*')
                xlim([x-1 x+1])
                %ylim([f(x-1) f(x+1)])
                set(handles.Edit_Limit_1_X_Graph_Calculator_Roots,'string',x-1);
                set(handles.Edit_Limit_2_X_Graph_Calculator_Roots,'string',x+1);
                set(handles.Edit_roots_Calculator_Roots,'String',x);
                set(handles.Edit_iterations_Calculator_Roots,'String',iterations);
                hold off
            
            end
            
        case 'Drying'
            disp(' > Method Drying')
            point_1 = str2double(get(handles.Edit_Point1_Calculator_Roots,'string'));
            point_2 = str2double(get(handles.Edit_Point2_Calculator_Roots,'string'));
            if(strcmp(f1,"") == true || strcmp(get(handles.Edit_Point2_Calculator_Roots,'string'),"") == true ||strcmp(get(handles.Edit_Point1_Calculator_Roots,'string'),"") == true ||strcmp(get(handles.Edit_Tolerance_Calculetor_Roots,'string'),"") == true )
                errordlg('Missing Input Data','Error');
            else
                %method
                %AXES
                axes(handles.Axes_Calculator_Roots);
                cla reset
                x=str2sym('x');               
                x1=str2sym('x1');
                x1_a = -10:0.001:10;
                plot(x1_a,arrayfun(f,x1_a),'LineWidth',1); 
                xlabel('x','Interpreter','latex');
                title(['$ f(x) = ' latex(f(x)) '$' ],'Interpreter','latex');
                x= point_1;
                x1=point_2;
                m=(f(x1)-f(x))/(x1-x);
                grid on
                hold on
                error=50;
                while  error>tol
 %                   if(x1<x)
%                        x2_a = x1:0.001:x;
                    %else
                     %  x2_a = x:0.001:x1;
                    %end
                    x2_a = -100:0.001:100;
                    y=@(a,x) m*(a-x)+f(x);
                    plot(x2_a,y(x2_a,x),'k');                    
                    xi = x1 - (f(x1)*(x-x1))/(f(x)-f(x1));
                    error = abs(f(x));
                    fprintf('%f         %0.4f\n',iterations,xi);
                    x=x1;
                    x1=xi;
                    iterations= iterations+1;
                     %table---
                    newRow ={iterations x f(xi) xi error};
                    oldData = get(handles.Table_Calculator_Roots,'Data');
                    newData=[oldData; newRow];
                    set(handles.Table_Calculator_Roots,'Data',newData);                
                    %%table
                    if(iterations>100)
                        disp('Divergence was Found');
                        warndlg('Divergence was Found');
                        break;
                    end
                end
                plot([xi xi], [f(xi) f(xi)],'*')
                xlim([xi-1 xi+1])
                %ylim([f(xi-1) f(xi+1)])
                set(handles.Edit_Limit_1_X_Graph_Calculator_Roots,'string',x-1);
                set(handles.Edit_Limit_2_X_Graph_Calculator_Roots,'string',x+1);
                set(handles.Edit_roots_Calculator_Roots,'String',x);
                set(handles.Edit_iterations_Calculator_Roots,'String',iterations);
                hold off
            end
    end    
elseif(tyMethod == 2)
    disp('**** Closed Method *****');
    switch Method
        case 'Bisection'
            disp(' > Bisection')
            limit_upper = str2double(get(handles.edit22,'string'));
            limit_lower = str2double(get(handles.edit31,'string'));
            if(strcmp(f1,"") == true || strcmp(get(handles.edit22,'string'),"") == true ||strcmp(get(handles.edit31,'string'),"") == true ||strcmp(get(handles.Edit_Tolerance_Calculetor_Roots,'string'),"") == true ||limit_upper <limit_lower || f(limit_upper)*f(limit_lower)>0)
                errordlg('Missing Input Data','Error');
            else
                %method
                disp('metodo')
                %AXES
                axes(handles.Axes_Calculator_Roots);
                cla reset
                x=str2sym('x');
                x1_a = limit_lower:0.001:limit_upper;           
                set(handles.Edit_Limit_1_X_Graph_Calculator_Roots,'string',limit_lower);
                set(handles.Edit_Limit_2_X_Graph_Calculator_Roots,'string',limit_upper);
                plot(x1_a,arrayfun(f,x1_a),'LineWidth',1); 
                xlabel('x','Interpreter','latex');
                title(['$ f(x) = ' latex(f(x)) '$' ],'Interpreter','latex');
                grid on
                hold on
                a = limit_lower;
                b = limit_upper;
                c = 0;
                ca = 0;
                error=50;
                if(f(a)==0 || f(b) == 0)                   
                   warndlg('A limit of Interval is root');
                end                           
                while(error>tol)    
                    ca = c;                 
                    c = (a+b)/2;  
                    if(f(a)*f(c)<0)
                        b = c;
                    elseif(f(b)*f(c)==0)
                        break;
                    else
                        a = c;
                    end
                    error = abs(f(c));
                    iterations = iterations + 1;
                     %table---
                    newRow ={iterations ca f(c) c error};
                    oldData = get(handles.Table_Calculator_Roots,'Data');
                    newData=[oldData; newRow];
                    set(handles.Table_Calculator_Roots,'Data',newData);                
                    %%table
                end              
                plot([c c], [f(c) f(c)],'*')
                hold off
                disp(c);
                disp(iterations);
                disp(error);
                set(handles.Edit_roots_Calculator_Roots,'String',c);
                set(handles.Edit_iterations_Calculator_Roots,'String',iterations);
            end
        case 'False Position'
            disp(' > False Position')
            limit_upper = str2double(get(handles.edit22,'string'));
            limit_lower = str2double(get(handles.edit31,'string'));
            if(strcmp(f1,"") == true || strcmp(get(handles.edit22,'string'),"") == true ||strcmp(get(handles.edit31,'string'),"") == true ||strcmp(get(handles.Edit_Tolerance_Calculetor_Roots,'string'),"") == true ||limit_upper <limit_lower || f(limit_upper)*f(limit_lower)>0)
                errordlg('Missing Input Data','Error');
            else
                %method
                disp('metodo')
                %AXES
                axes(handles.Axes_Calculator_Roots);
                cla reset
                x=str2sym('x');
                x1_a = limit_lower:0.001:limit_upper;           
                set(handles.Edit_Limit_1_X_Graph_Calculator_Roots,'string',limit_lower);
                set(handles.Edit_Limit_2_X_Graph_Calculator_Roots,'string',limit_upper);
                plot(x1_a,arrayfun(f,x1_a),'LineWidth',1); 
                xlabel('x','Interpreter','latex');
                title(['$ f(x) = ' latex(f(x)) '$' ],'Interpreter','latex');
                grid on
                hold on
                a = limit_lower;
                b = limit_upper;
                x = 0;
                xa = 0;
                error = 50;
                if(f(a)==0 || f(b) == 0)                   
                   warndlg('A limit of Interval is root');
                end 
                while(error>tol)                     
                    xa = x;
                    x =  b-f(b)*(a - b)/(f(a)-f(b));
                    if f(a)*f(x)<=0
                        b=x; 
                    else
                        a=x;
                    end
                    error = abs(f(x));
                    iterations = iterations +1;
                     %table---
                    newRow ={iterations xa f(x) x error};
                    oldData = get(handles.Table_Calculator_Roots,'Data');
                    newData=[oldData; newRow];
                    set(handles.Table_Calculator_Roots,'Data',newData);                
                    %%table
                end
                plot([x x], [f(x) f(x)],'*')
                hold off
                disp(x);
                disp(iterations);
                disp(error);
                set(handles.Edit_roots_Calculator_Roots,'String',x);
                set(handles.Edit_iterations_Calculator_Roots,'String',iterations);
            end
            
        otherwise
            disp('info')
    end  
end

function edit31_Callback(hObject, eventdata, handles)
function edit31_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Edit_Tolerance_Calculetor_Roots_Callback(hObject, eventdata, handles)
function Edit_Tolerance_Calculetor_Roots_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_iterations_Calculator_Roots_Callback(hObject, eventdata, handles)
function Edit_iterations_Calculator_Roots_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Edit_roots_Calculator_Roots_Callback(hObject, eventdata, handles)
function Edit_roots_Calculator_Roots_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_functionGx_Calculator_Roots_Callback(hObject, eventdata, handles)
function Edit_functionGx_Calculator_Roots_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Point1_Calculator_Roots_Callback(hObject, eventdata, handles)
function Edit_Point1_Calculator_Roots_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Popupmenu_OpenMethods_Calculator_Roots.
function Popupmenu_OpenMethods_Calculator_Roots_Callback(hObject, eventdata, handles)
global Method;
val = get(hObject,'Value');
str = get(hObject,'String');
switch str{val}
    case 'Fixed Point'
        Method = 'Fixed Point';
        set(handles.text_Point2_Calculator_Roots,'Visible','off');
        set(handles.Edit_Point2_Calculator_Roots,'Visible','off');
        set(handles.Edit_functionGx_Calculator_Roots,'Visible','on');
        set(handles.Text_functionGx_Calculator_Roots,'Visible','on');
    case 'Newton' 
        Method = 'Newton';
        set(handles.text_Point2_Calculator_Roots,'Visible','off');
        set(handles.Edit_Point2_Calculator_Roots,'Visible','off');
        set(handles.Edit_functionGx_Calculator_Roots,'Visible','off');
        set(handles.Text_functionGx_Calculator_Roots,'Visible','off');
    case 'Drying'
        Method = 'Drying';
        set(handles.text_Point2_Calculator_Roots,'Visible','on');
        set(handles.Edit_Point2_Calculator_Roots,'Visible','on');
        set(handles.Edit_functionGx_Calculator_Roots,'Visible','off');
        set(handles.Text_functionGx_Calculator_Roots,'Visible','off');
    otherwise
end
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function Popupmenu_OpenMethods_Calculator_Roots_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Point2_Calculator_Roots_Callback(hObject, eventdata, handles)
function Edit_Point2_Calculator_Roots_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Limit_1_X_Graph_Calculator_Roots_Callback(hObject, eventdata, handles)
function Edit_Limit_1_X_Graph_Calculator_Roots_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit37_Callback(hObject, eventdata, handles)
function edit37_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Limit_2_X_Graph_Calculator_Roots_Callback(hObject, eventdata, handles)
function Edit_Limit_2_X_Graph_Calculator_Roots_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in Buttongroup_TypeMethod_Calculator_Root.
function Buttongroup_TypeMethod_Calculator_Root_SelectionChangedFcn(hObject, eventdata, handles)
global tyMethod;
global Method;
if hObject == handles.Radiobutton_OpenMethods_Calcualtor_Roots
    set(handles.Panel_Methods_Open_Calculator_Roots,'Visible','on');
    tyMethod = 1;
    v =  get(handles.Popupmenu_OpenMethods_Calculator_Roots,'Value');
    switch v
        case 1
            Method = 'Fixed Point';
        case 2
            Method = 'Newton';
        case 3
            Method = 'Drying';
    end
    %set(handles.pushbutton3,'Visible','off');
elseif hObject == handles.Radiobutton_ClosedMethods_Calcualtor_Roots
    set(handles.Panel_Methods_Open_Calculator_Roots,'Visible','off');
    tyMethod = 2;
    v1 =  get(handles.Popupmenu_ClosedMethod_Caculator_Roots,'Value');
    switch v1
        case 1
            Method = 'Bisection';
        case 2
            Method = 'False Position';
    end
end
