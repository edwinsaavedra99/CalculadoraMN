function varargout = derivacion_numerica(varargin)
% DERIVACION_NUMERICA MATLAB code for derivacion_numerica.fig
%      DERIVACION_NUMERICA, by itself, creates a new DERIVACION_NUMERICA or raises the existing
%      singleton*.
%
%      H = DERIVACION_NUMERICA returns the handle to a new DERIVACION_NUMERICA or the handle to
%      the existing singleton*.
%
%      DERIVACION_NUMERICA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DERIVACION_NUMERICA.M with the given input arguments.
%
%      DERIVACION_NUMERICA('Property','Value',...) creates a new DERIVACION_NUMERICA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before derivacion_numerica_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to derivacion_numerica_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help derivacion_numerica

% Last Modified by GUIDE v2.5 15-Dec-2019 18:04:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @derivacion_numerica_OpeningFcn, ...
                   'gui_OutputFcn',  @derivacion_numerica_OutputFcn, ...
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


% --- Executes just before derivacion_numerica is made visible.
function derivacion_numerica_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to derivacion_numerica (see VARARGIN)

% Choose default command line output for derivacion_numerica
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes derivacion_numerica wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = derivacion_numerica_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in primera.
function primera_Callback(hObject, eventdata, handles)
% hObject    handle to primera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of primera


% --- Executes on button press in tercera.
function tercera_Callback(hObject, eventdata, handles)
% hObject    handle to tercera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tercera


% --- Executes on button press in segunda.
function segunda_Callback(hObject, eventdata, handles)
% hObject    handle to segunda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of segunda






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


% --- Executes on button press in regresiva.
function regresiva_Callback(hObject, eventdata, handles)
% hObject    handle to regresiva (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of regresiva


% --- Executes on button press in central.
function central_Callback(hObject, eventdata, handles)
% hObject    handle to central (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of central


% --- Executes on button press in progresiva.
function progresiva_Callback(hObject, eventdata, handles)
% hObject    handle to progresiva (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of progresiva



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


% --- Executes on button press in calcular.
function calcular_Callback(hObject, eventdata, handles)

grado_group=get(handles.grado,'SelectedObject');
grado=get(grado_group,'String');

caso_group=get(handles.caso,'SelectedObject');
caso=get(caso_group,'String')

f=get(handles.funcion,'String');
x=get(handles.xi,'String');
h=get(handles.h,'String');

switch grado
    case 'Primera Derivada'
       if strcmp(caso,'Regresiva')
          [resultado,error]=primeraregresiva(f,x,h);
       elseif strcmp(caso,'Central')
          [resultado,error]=primeracentrada(f,x,h);
       elseif strcmp(caso,'Progresiva')
          [resultado,error]=primeraprogresiva(f,x,h);
       end
    case 'Segunda Derivada'
        if strcmp(caso,'Regresiva')
          [resultado,error]=segundaregresiva(f,x,h);
       elseif strcmp(caso,'Central')
          [resultado,error]=segundacentrada(f,x,h);
       elseif strcmp(caso,'Progresiva')
          [resultado,error]=segundaprogresiva(f,x,h);
       end
    case 'Tercera Derivada'
        if strcmp(caso,'Regresiva')
          [resultado,error]=terceraregresiva(f,x,h);
       elseif strcmp(caso,'Central')
          [resultado,error]=terceracentrada(f,x,h);
       elseif strcmp(caso,'Progresiva')
          [resultado,error]=terceraprogresiva(f,x,h);
       end
        
end 
set(handles.resultado,'String',char(resultado));
set(handles.error,'String',char(error));
% hObject    handle to calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in graficar.
function graficar_Callback(hObject, eventdata, handles)
fx=get(handles.funcion,'String');
f=str2sym(fx);
syms x;
fplot(handles.dibujo,f,[-180,180]);
grid on


% hObject    handle to graficar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
