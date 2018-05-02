function varargout = E(varargin)
% E MATLAB code for E.fig
%      E, by itself, creates a new E or raises the existing
%      singleton*.
%
%      H = E returns the handle to a new E or the handle to
%      the existing singleton*.
%
%      E('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in E.M with the given input arguments.
%
%      E('Property','Value',...) creates a new E or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before E_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to E_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help E

% Last Modified by GUIDE v2.5 02-Jul-2016 09:26:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @E_OpeningFcn, ...
                   'gui_OutputFcn',  @E_OutputFcn, ...
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


% --- Executes just before E is made visible.
function E_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to E (see VARARGIN)

% Choose default command line output for E
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes E wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = E_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function playsound(tonename,typ)
global SampleRate Tempo;
timlen = 2;
x = mscale(tonename,timlen,SampleRate,Tempo,typ);
w=[2 5 2]/9;  y=filter(w,1,x);
sound(y,SampleRate);

% --- Executes on button press in pushbuttonC_.
function pushbuttonC__Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonC_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global name;
tonename = 6;
playsound(tonename,name);

% --- Executes on button press in pushbuttonD_.
function pushbuttonD__Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonD_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonF_.
function pushbuttonF__Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonF_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonG_.
function pushbuttonG__Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonG_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonA.
function pushbuttonA_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonB.
function pushbuttonB_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonCD_.
function pushbuttonCD__Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonCD_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonFG_.
function pushbuttonFG__Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonFG_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonDE_.
function pushbuttonDE__Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonDE_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonGA_.
function pushbuttonGA__Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonGA_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonAB.
function pushbuttonAB_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonAB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonC.
function pushbuttonC_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonE.
function pushbuttonE_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonD.
function pushbuttonD_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonF.
function pushbuttonF_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonG.
function pushbuttonG_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonAP.
function pushbuttonAP_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonAP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonBP.
function pushbuttonBP_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonBP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonCD.
function pushbuttonCD_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonCD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonFG.
function pushbuttonFG_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonFG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonDE.
function pushbuttonDE_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonDE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonGA.
function pushbuttonGA_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonGA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbuttonABP.
function pushbuttonABP_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonABP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

