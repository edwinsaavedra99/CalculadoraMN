%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Details

%Creator: Amir John Scheid
%Contact: amirjscheid@hotmail.com
%Country: Brazil
%Languages for contact: English, Portuguese, Spanish.

%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function varargout = integration(varargin)
% INTEGRATION MATLAB code for integration.fig
%      INTEGRATION, by itself, creates a new INTEGRATION or raises the existing
%      singleton*.
%
%      H = INTEGRATION returns the handle to a new INTEGRATION or the handle to
%      the existing singleton*.
%
%      INTEGRATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTEGRATION.M with the given input arguments.
%
%      INTEGRATION('Property','Value',...) creates a new INTEGRATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before integration_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to integration_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help integration

% Last Modified by GUIDE v2.5 07-Nov-2014 11:53:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @integration_OpeningFcn, ...
                   'gui_OutputFcn',  @integration_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before integration is made visible.
function integration_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to integration (see VARARGIN)

% Choose default command line output for integration
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes integration wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = integration_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editfunc_Callback(hObject, eventdata, handles)
% hObject    handle to editfunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editfunc as text
%        str2double(get(hObject,'String')) returns contents of editfunc as a double


% --- Executes during object creation, after setting all properties.
function editfunc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editfunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pop_int.
function pop_int_Callback(hObject, eventdata, handles)
% hObject    handle to pop_int (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_int contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_int
h = get(handles.pop_int,'Value')
if h == 5
    set(handles.text_trap,'Visible','on');
    set(handles.edit_trap,'Visible','on');
else
    set(handles.text_trap,'Visible','off');
    set(handles.edit_trap,'Visible','off');
end
% --- Executes during object creation, after setting all properties.
function pop_int_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_int (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editx1_Callback(hObject, eventdata, handles)
% hObject    handle to editx1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editx1 as text
%        str2double(get(hObject,'String')) returns contents of editx1 as a double


% --- Executes during object creation, after setting all properties.
function editx1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editx1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editx2_Callback(hObject, eventdata, handles)
% hObject    handle to editx2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editx2 as text
%        str2double(get(hObject,'String')) returns contents of editx2 as a double


% --- Executes during object creation, after setting all properties.
function editx2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editx2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

x1 = str2double(get(handles.editx1,'String'));
x2 = str2double(get(handles.editx2,'String'));

fx = vectorize(inline(get(handles.editfunc,'String')));
X = [x1:0.01:x2];
values = feval(fx,X);
maxi=max(values);
mini=(min(values));
if mini > 0
    mini = 0;
end;
method = get(handles.pop_int,'Value');
axes(handles.axes1);
cla(handles.axes1);

%% Simpsons

if method == 2     
    A = feval(fx,x1);
    B = feval(fx,((x1+x2)/2));
    C = feval(fx,x2);
    integral = num2str(((x2-x1)/6)*(A+(4*B)+C));
    set(handles.textresult,'String',integral);
end

%% Simpsons 3/8

if method == 3      
    A = feval(fx,x1);
    B = feval(fx,((2*x1+x2)/3));
    C = feval(fx,((x1+2*x2)/3));
    D = feval(fx,x2);
    integral = num2str(((x2-x1)/8)*(A+(3*B)+(3*C)+D));
    set(handles.textresult,'String',integral);
end

%% Monte Carlo
if method == 4     
     Nt = 100000;
     n = 0;
     dx = (x2-x1)/Nt;
     X = [x1:dx:x2];
     values = feval(fx,X);
     maxi = max(values);
     mini = min(values);
     
     vyminus = [];
     vxminus = [];
     vy = [];
     vx = [];
     
     rx = round(((x2-x1)*rand(Nt+1,1))/(dx)) %r = a + (b-a).*rand(100,1);
     if mini<0 && maxi>0
        ry = mini + (maxi-mini).*rand(Nt+1,1);
     elseif maxi<0
        ry = mini + (0-mini).*rand(Nt+1,1);
     else
        ry = (maxi).*rand(Nt+1,1);
     end
     
     
     
     for i = 1:Nt
         if ry(i)<0
            if ry(i,1) >= (values(rx(i,1)+1))
                n = n-1;
                vyminus = [vyminus, ry(i,1)];
                vxminus = [vxminus, (rx(i,1)*(x2-x1)/Nt+x1)];
            end;
         elseif ry(i,1) <= (values(rx(i,1)+1))
            n = n+1;
             vx = [vx, (rx(i,1)*(x2-x1)/Nt+x1)];
             vy = [vy, ry(i,1)];
         end;
     end;
     
     if mini <0 && maxi>0
        integral = (n/Nt)*(maxi-mini)*(x2-x1);
     elseif maxi<0
        integral = (n/Nt)*(0-mini)*(x2-x1);
     else
         integral = (n/Nt)*(maxi)*(x2-x1);
     end;
     set(handles.textresult,'String',integral);
end;

%% Trapezoidal Rule
if method == 5
   N = str2double(get(handles.edit_trap,'String'));
   dx = (x2-x1)/N;
   Area = 0
   for i = 1:N
       A = feval(fx,x1+((i-1)*dx));
       B = feval(fx,x1+(i*(dx)));
       Area = Area + ((A+B)*dx/2);
   end
   set(handles.textresult,'String',Area);
end

%% Plotting
if mini > 0
        mini = 0;
end;
if maxi < 0 
        maxi = 0;
end

if method == 4
    plot(vxminus,vyminus,'o','MarkerSize',1,'MarkerEdgeColor','r','MarkerFaceColor','r'), hold on;
    plot(vx,vy,'o','MarkerSize',1,'MarkerEdgeColor','g','MarkerFaceColor','g'), hold on;
    plot(X,values,'LineWidth',2), ylim([mini,maxi])
else
hold off, plot(X,values), ylim([mini,maxi])
end;



function edit_trap_Callback(hObject, eventdata, handles)
% hObject    handle to edit_trap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_trap as text
%        str2double(get(hObject,'String')) returns contents of edit_trap as a double


% --- Executes during object creation, after setting all properties.
function edit_trap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_trap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
