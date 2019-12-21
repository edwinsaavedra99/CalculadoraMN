function varargout = LUForm(varargin)
% LUFORM MATLAB code for LUForm.fig
%      LUFORM, by itself, creates a new LUFORM or raises the existing
%      singleton*.
%
%      H = LUFORM returns the handle to a new LUFORM or the handle to
%      the existing singleton*.
%
%      LUFORM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LUFORM.M with the given input arguments.
%
%      LUFORM('Property','Value',...) creates a new LUFORM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LUForm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LUForm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LUForm

% Last Modified by GUIDE v2.5 31-Jul-2014 15:00:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LUForm_OpeningFcn, ...
                   'gui_OutputFcn',  @LUForm_OutputFcn, ...
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


% --- Executes just before LUForm is made visible.
function LUForm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LUForm (see VARARGIN)

% Choose default command line output for LUForm
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LUForm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LUForm_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filas=str2double(get(handles.edit1,'String'));
num_elem=cell(filas,filas);
num_elem(:,:)={''};
set(handles.uitable1,'Data',num_elem);
set(handles.uitable1,'ColumnEditable',true());

num_elem=cell(filas,1);
num_elem(:,:)={''};
set(handles.uitable3,'Data',num_elem);
set(handles.uitable3,'ColumnEditable',true());



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tabla=get(handles.uitable1,'Data');
tabla=str2double(tabla);

tabla2=get(handles.uitable3,'Data');
tabla2=str2double(tabla2);

resultado=LU(tabla,tabla2);
set(handles.uitable2, 'Data',resultado); 

axes(handles.axes1)
plot(tabla(:,1),tabla(:,2))


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
imshow('loguito.jpg');
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
