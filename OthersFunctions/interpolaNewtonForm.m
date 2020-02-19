function varargout = interpolaNewtonForm(varargin)
% INTERPOLANEWTONFORM MATLAB code for interpolaNewtonForm.fig
%      INTERPOLANEWTONFORM, by itself, creates a new INTERPOLANEWTONFORM or raises the existing
%      singleton*.
%
%      H = INTERPOLANEWTONFORM returns the handle to a new INTERPOLANEWTONFORM or the handle to
%      the existing singleton*.
%
%      INTERPOLANEWTONFORM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERPOLANEWTONFORM.M with the given input arguments.
%
%      INTERPOLANEWTONFORM('Property','Value',...) creates a new INTERPOLANEWTONFORM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interpolaNewtonForm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interpolaNewtonForm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interpolaNewtonForm

% Last Modified by GUIDE v2.5 31-Jul-2014 15:04:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interpolaNewtonForm_OpeningFcn, ...
                   'gui_OutputFcn',  @interpolaNewtonForm_OutputFcn, ...
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


% --- Executes just before interpolaNewtonForm is made visible.
function interpolaNewtonForm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interpolaNewtonForm (see VARARGIN)

% Choose default command line output for interpolaNewtonForm
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interpolaNewtonForm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interpolaNewtonForm_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tabla=get(handles.uitable1,'Data');
tabla=str2double(tabla);

tabla2=get(handles.uitable2,'Data');
tabla2=str2double(tabla2);
n=str2double(get(handles.edit1,'String'))-1;

X=tabla;
Y=tabla2;

    intervalo=0:1:3 ; 
axes(handles.axes2)
hold on;
plot(X,Y,'*r')

DD=zeros(n+1);
    DD(:,1)=Y;
    for k=2:n+1
        for J=k:n+1
            DD(J,k)=[DD(J,k-1)-DD(J-1,k-1)]/[X(J)-X(J-k+1)];
        end
    end
    disp('La matriz de diferencias divididas es:');
    disp(DD);
    disp('El polinomio de newton es');
    syms x;
    polnew=DD(1,1);
    P=1;
    for i=1:n
        P=P*(x-X(i));
        polnew=polnew+P*DD(i+1,i+1);
    end
    polnew=expand(polnew);
    pretty(polnew);
    vi=eval(polnew);
    
    F=char(polnew);
    set(handles.text5, 'String',F); 
    %plot(x,vi,'r+');
    ezplot(vi,[-10,10])
    %x1 = [-10:0.01:10];
    %x2 = subs(vi,x,x1);
    %plot(x1,x2,'o'
    

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filas=str2double(get(handles.edit1,'String'));
columnas=1;
num_elem=cell(filas,columnas);
num_elem(:,:)={''};
set(handles.uitable2,'Data',num_elem);
set(handles.uitable2,'ColumnEditable',true());


set(handles.uitable1,'Data',num_elem);
set(handles.uitable1,'ColumnEditable',true());


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
imshow('loguito.jpg');
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3
