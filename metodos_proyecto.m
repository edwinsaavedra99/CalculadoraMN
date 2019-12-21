function varargout = metodos_proyecto(varargin)
% METODOS_PROYECTO MATLAB code for metodos_proyecto.fig
%      METODOS_PROYECTO, by itself, creates a new METODOS_PROYECTO or raises the existing
%      singleton*.
%
%      H = METODOS_PROYECTO returns the handle to a new METODOS_PROYECTO or the handle to
%      the existing singleton*.
%
%      METODOS_PROYECTO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in METODOS_PROYECTO.M with the given input arguments.
%
%      METODOS_PROYECTO('Property','Value',...) creates a new METODOS_PROYECTO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before metodos_proyecto_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to metodos_proyecto_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help metodos_proyecto

% Last Modified by GUIDE v2.5 24-Aug-2016 21:34:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @metodos_proyecto_OpeningFcn, ...
                   'gui_OutputFcn',  @metodos_proyecto_OutputFcn, ...
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


% --- Executes just before metodos_proyecto is made visible.
function metodos_proyecto_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to metodos_proyecto (see VARARGIN)

% Choose default command line output for metodos_proyecto
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes metodos_proyecto wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = metodos_proyecto_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
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


% --- Executes on button press in graficar.
function graficar_Callback(hObject, eventdata, handles)
axes(handles.axes1);
     x=str2double(get(handles.xr,'String'));
        fx=get(handles.h,'String');
        hold off
        ezplot (fx);
        hold on
        grid on
        zoom on
        plot (x,subs(fx,x),'or');


function xu_Callback(hObject, eventdata, handles)
% hObject    handle to xu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xu as text
%        str2double(get(hObject,'String')) returns contents of xu as a double


% --- Executes during object creation, after setting all properties.
function xu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xr_Callback(hObject, eventdata, handles)
% hObject    handle to xr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xr as text
%        str2double(get(hObject,'String')) returns contents of xr as a double


% --- Executes during object creation, after setting all properties.
function xr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tol_Callback(hObject, eventdata, handles)
% hObject    handle to tol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tol as text
%        str2double(get(hObject,'String')) returns contents of tol as a double


% --- Executes during object creation, after setting all properties.
function tol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xl_Callback(hObject, eventdata, handles)
% hObject    handle to xl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xl as text
%        str2double(get(hObject,'String')) returns contents of xl as a double


% --- Executes during object creation, after setting all properties.
function xl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calcularbise.
function calcularbise_Callback(hObject, eventdata, handles)
syms x
def=get(handles.h,'string');
f=inline(def); %#ok<DINLN>
x0=str2double(get(handles.xl,'string'));
x1=str2double(get(handles.xu,'string'));
tol=str2double(get(handles.tol,'string'));
n=0;
if f(x0)*f(x1)<0
    x=x0;
    while abs(f(x))>tol
        x=(x0+x1)/2;
        n=n+1;
        if f(x0)*f(x)<0
            x1=x;
        else
            x0=x;
        end
    end
    set(handles.iterbise,'string',n);
    set(handles.xr,'string',x);
    set(handles.ebise,'String',tol);
end


% --- Executes on button press in clearbise.
function clearbise_Callback(hObject, eventdata, handles)
%set(handles.h,'String','');
set(handles.xl,'String','');
set(handles.xu,'String','');
set(handles.tol,'String','');
set(handles.xr,'String','');
set(handles.iterbise,'String','');
set(handles.ebise,'String','');
axes(handles.axes1);
cla('reset');



function cf_Callback(hObject, eventdata, handles)
% hObject    handle to cf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cf as text
%        str2double(get(hObject,'String')) returns contents of cf as a double


% --- Executes during object creation, after setting all properties.
function cf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e_Callback(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e as text
%        str2double(get(hObject,'String')) returns contents of e as a double


% --- Executes during object creation, after setting all properties.
function e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x0_Callback(hObject, eventdata, handles)
% hObject    handle to x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0 as text
%        str2double(get(hObject,'String')) returns contents of x0 as a double


% --- Executes during object creation, after setting all properties.
function x0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xr1_Callback(hObject, eventdata, handles)
% hObject    handle to xr1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xr1 as text
%        str2double(get(hObject,'String')) returns contents of xr1 as a double


% --- Executes during object creation, after setting all properties.
function xr1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xr1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in graficarnewton.
function graficarnewton_Callback(hObject, eventdata, handles)
axes(handles.axes2);
 x=str2double(get(handles.xr1,'String'));
        fx=get(handles.h,'String');
        hold off
        ezplot (fx);
        hold on
        grid on
        zoom on
        plot (x,subs(fx,x),'or');


% --- Executes on button press in calcularnewton.
function calcularnewton_Callback(hObject, eventdata, handles)
syms x
cf=get(handles.h,'string');
f=inline(cf); %#ok<DINLN>
dg=diff(cf,x); %#ok<NODEF>
df=inline(dg); %#ok<DINLN>
x=str2double(get(handles.x0,'String'));
tol=str2double(get(handles.e,'String'));
n=0; error=100;
while(error>tol)
    xa=x;
    x=x-f(x)/df(x);
    error=abs(((x-xa)/x)*100);
    error=double(error);
    x = double(x);
    n=n+1;
end
set(handles.xr1,'String',x);
set(handles.iternew,'String',n);
set(handles.enewton,'String',tol);

% --- Executes on button press in borrarnewton.
function borrarnewton_Callback(hObject, eventdata, handles)
%set(handles.h,'String','');
set(handles.x0,'String','');
set(handles.e,'String','');
set(handles.xr1,'String','');
set(handles.iternew,'String','');
set(handles.enewton,'String','');
axes(handles.axes2);
cla('reset');



function iternew_Callback(hObject, eventdata, handles)
% hObject    handle to iternew (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iternew as text
%        str2double(get(hObject,'String')) returns contents of iternew as a double


% --- Executes during object creation, after setting all properties.
function iternew_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iternew (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cf1_Callback(hObject, eventdata, handles)
% hObject    handle to cf1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cf1 as text
%        str2double(get(hObject,'String')) returns contents of cf1 as a double


% --- Executes during object creation, after setting all properties.
function cf1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cf1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e1_Callback(hObject, eventdata, handles)
% hObject    handle to e1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e1 as text
%        str2double(get(hObject,'String')) returns contents of e1 as a double


% --- Executes during object creation, after setting all properties.
function e1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x1_Callback(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x1 as text
%        str2double(get(hObject,'String')) returns contents of x1 as a double


% --- Executes during object creation, after setting all properties.
function x1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xr2_Callback(hObject, eventdata, handles)
% hObject    handle to xr2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xr2 as text
%        str2double(get(hObject,'String')) returns contents of xr2 as a double


% --- Executes during object creation, after setting all properties.
function xr2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xr2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in graficarsecante.
function graficarsecante_Callback(hObject, eventdata, handles)
axes(handles.axes3);
     x=str2double(get(handles.xr2,'String'));
        fx=get(handles.h,'String');
        hold off
        ezplot (fx);
        hold on
        grid on
        zoom on
        plot (x,subs(fx,x),'or');


% --- Executes on button press in calcularsecante.
function calcularsecante_Callback(hObject, eventdata, handles)
syms x
cf=get(handles.h,'string');
f=inline (cf); %#ok<DINLN>
x1=str2double(get(handles.x1,'String'));
tol=str2double(get(handles.e1,'String'));
n=0; error=100; d=0.01;
while(error>tol)
    n=n+1;
    x = x1 - d*x1*f(x1)/(f(x1 + d*x1)-f(x1));
    error=abs(((x-x1)/x)*100);
    x1 = x;
end
set(handles.xr2,'String',x);
set(handles.itersecante,'String',n);
set(handles.eseca,'String',tol);


% --- Executes on button press in borrarsecante.
function borrarsecante_Callback(hObject, eventdata, handles)
%set(handles.h,'String','');
set(handles.x1,'String','');
set(handles.e1,'String','');
set(handles.xr2,'String','');
set(handles.itersecante,'String','');
set(handles.eseca,'String','');
axes(handles.axes3);
cla('reset');




function itersecante_Callback(hObject, eventdata, handles)
% hObject    handle to itersecante (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of itersecante as text
%        str2double(get(hObject,'String')) returns contents of itersecante as a double


% --- Executes during object creation, after setting all properties.
function itersecante_CreateFcn(hObject, eventdata, handles)
% hObject    handle to itersecante (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iterbise_Callback(hObject, eventdata, handles)
% hObject    handle to iterbise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iterbise as text
%        str2double(get(hObject,'String')) returns contents of iterbise as a double


% --- Executes during object creation, after setting all properties.
function iterbise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iterbise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function enewton_Callback(hObject, eventdata, handles)
% hObject    handle to enewton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of enewton as text
%        str2double(get(hObject,'String')) returns contents of enewton as a double


% --- Executes during object creation, after setting all properties.
function enewton_CreateFcn(hObject, eventdata, handles)
% hObject    handle to enewton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ebise_Callback(hObject, eventdata, handles)
% hObject    handle to ebise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ebise as text
%        str2double(get(hObject,'String')) returns contents of ebise as a double


% --- Executes during object creation, after setting all properties.
function ebise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ebise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eseca_Callback(hObject, eventdata, handles)
% hObject    handle to eseca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eseca as text
%        str2double(get(hObject,'String')) returns contents of eseca as a double


% --- Executes during object creation, after setting all properties.
function eseca_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eseca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bisenota.
function bisenota_Callback(hObject, eventdata, handles)
axes(handles.axes6);
[FileName Path]=uigetfile(('bise.txt'),'C:\Users\CESAR\Documents\MATLAB\metodos carrera\guide proyecto\bise.txt');
if isequal(FileName,0)
	return
else
	winopen(strcat(Path,Filename));
end


% --- Executes during object creation, after setting all properties.
function text42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
