function varargout = compose(varargin)
% COMPOSE MATLAB code for compose.fig
%      COMPOSE, by itself, creates a new COMPOSE or raises the existing
%      singleton*.
%
%      H = COMPOSE returns the handle to a new COMPOSE or the handle to
%      the existing singleton*.
%
%      COMPOSE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPOSE.M with the given input arguments.
%
%      COMPOSE('Property','Value',...) creates a new COMPOSE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before compose_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to compose_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help compose

% Last Modified by GUIDE v2.5 02-Jul-2016 17:03:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @compose_OpeningFcn, ...
                   'gui_OutputFcn',  @compose_OutputFcn, ...
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


% --- Executes just before compose is made visible.
function compose_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to compose (see VARARGIN)

% Choose default command line output for compose
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes compose wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = compose_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SampleRate_
global tempo_
global tone_
global typ_
global jiepai
global music 
global val 
global player

jiepai=1;
typ_=get(handles.selection,'string');
SampleRate_=str2num(get(handles.SampleRate,'string'));
tempo_=str2num(get(handles.tempo,'string'));
tone_=str2num(get(handles.tone,'string'));
% if isempty(SampleRate_)
%     SampleRate_=44100;
% end
% if isempty(tempo_)
%     tempo_=200;
% end
% if isempty(tone_)
%     tone_=0;
% end

SampleRate_=44100;
tempo_=200;
tone_=0;

SampleRate=SampleRate_;
tempo=tempo_;
tone=tone_;

score=readscore(music,tone);
x=combsong(score,SampleRate,tempo,val);

% w=[2 5 2]/9;  y=filter(w,1,x);
player=audioplayer(x,SampleRate);
play(player);


% --- Executes on button press in read.
function read_Callback(hObject, eventdata, handles)
% hObject    handle to read (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global music
global jiepai
jiepai=0;
[filename,pathname]=uigetfile(...
    {'*.txt','voice files(*.txt)';...
    '*.*', 'all file(*.*)'}, ...
    'pick an music');
if isequal(filename,0)||isequal(pathname,0)
    return;
end
fpath=[pathname filename];
music=fpath;


% --- Executes on selection change in selection.
function selection_Callback(hObject, eventdata, handles)
% hObject    handle to selection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns selection contents as cell array
%        contents{get(hObject,'Value')} returns selected item from selection


% --- Executes during object creation, after setting all properties.
function selection_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global val
val=get(hObject,'Value');
switch val
    case 1
        
    case 2
end;



function tempo_Callback(hObject, eventdata, handles)
% hObject    handle to tempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tempo as text
%        str2double(get(hObject,'String')) returns contents of tempo as a double


% --- Executes during object creation, after setting all properties.
function tempo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SampleRate_Callback(hObject, eventdata, handles)
% hObject    handle to SampleRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SampleRate as text
%        str2double(get(hObject,'String')) returns contents of SampleRate as a double


% --- Executes during object creation, after setting all properties.
function SampleRate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SampleRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tone_Callback(hObject, eventdata, handles)
% hObject    handle to tone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tone as text
%        str2double(get(hObject,'String')) returns contents of tone as a double


% --- Executes during object creation, after setting all properties.
function tone_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
