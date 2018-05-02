function varargout = audio_project(varargin)
% AUDIO_PROJECT M-file for audio_project.fig
%      AUDIO_PROJECT, by itself, creates a new AUDIO_PROJECT or raises the existing
%      singleton*.
%
%      H = AUDIO_PROJECT returns the handle to a new AUDIO_PROJECT or the handle to
%      the existing singleton*.
%
%      AUDIO_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUDIO_PROJECT.M with the given input arguments.
%
%      AUDIO_PROJECT('Property','Value',...) creates a new AUDIO_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before audio_project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to audio_project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help audio_project

% Last Modified by GUIDE v2.5 03-Jul-2016 03:55:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @audio_project_OpeningFcn, ...
                   'gui_OutputFcn',  @audio_project_OutputFcn, ...
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

% --- Executes just before audio_project is made visible.
function audio_project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to audio_project (see VARARGIN)

% Choose default command line output for audio_project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes audio_project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = audio_project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function samplerate_Callback(hObject, eventdata, handles)
% hObject    handle to samplerate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samplerate as text
%        str2double(get(hObject,'String')) returns contents of samplerate as a double

% --- Executes during object creation, after setting all properties.
function samplerate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samplerate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function samplenum_Callback(hObject, eventdata, handles)
% hObject    handle to samplenum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samplenum as text
%        str2double(get(hObject,'String')) returns contents of samplenum as a double


% --- Executes during object creation, after setting all properties.
function samplenum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samplenum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function freq_Callback(hObject, eventdata, handles)
% hObject    handle to freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq as text
%        str2double(get(hObject,'String')) returns contents of freq as a double

% --- Executes during object creation, after setting all properties.
function freq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function amp_Callback(hObject, eventdata, handles)
% hObject    handle to amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amp as text
%        str2double(get(hObject,'String')) returns contents of amp as a double


% --- Executes during object creation, after setting all properties.
function amp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function phase_Callback(hObject, eventdata, handles)
% hObject    handle to phase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phase as text
%        str2double(get(hObject,'String')) returns contents of phase as a double


% --- Executes during object creation, after setting all properties.
function phase_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in add.
function add_Callback(hObject, eventdata, handles)
% hObject    handle to add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of add


% --- Executes during object creation, after setting all properties.
function add_CreateFcn(hObject, eventdata, handles)
% hObject    handle to add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in gensig.
function gensig_Callback(hObject, eventdata, handles)
% hObject    handle to gensig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=str2double(get(findobj('Tag','samplerate'),'String'));
handles.new_FS=Fs;
N=str2double(get(findobj('Tag','samplenum'),'String'));
x=linspace(0,N/Fs,N);
soundtype=get(handles.wavetype,'Value');
frequency=str2double(get(handles.freq,'String'));
amp=str2double(get(handles.amp,'String'));
phase=str2double(get(handles.phase,'String'));
switch soundtype
    case 1
        y=amp*sin(2*pi*x*frequency+phase);
    case 2
        y=amp*sign(sin(2*pi*x*frequency+phase));
    case 3
        y=amp*sawtooth(2*pi*x*frequency+phase,0.5);
    case 4
        y=amp*sawtooth(2*pi*x*frequency+phase);
    case 5
        y=amp*(2*rand(size(x))-1);
    otherwise
        errordlg('Illegal wave type','Choose errer');
end
if get(handles.add,'Value')==0.0
    handles.y=y;
else
    handles.y=handles.y+y;
end
handles.inputtype=3;
guidata(hObject,handles);
plot(handles.time,handles.y);
title('WAVE');
axis([0 N -1.5*str2double(get(handles.amp,'String')) 1.5*str2double(get(handles.amp,'String'))]);



% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=str2double(get(findobj('Tag','samplerate'),'String'));
wavplay(handles.y,Fs);

% --- Executes on slider movement.
function scale_Callback(hObject, eventdata, handles)
% hObject    handle to scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val=get(hObject,'value');
val=10^(val*5+1);
x=get(handles.xmove,'Value')*str2double(get(handles.samplenum,'String'));
axis(handles.time,[x val+x 1.5*min(handles.y) 1.5*max(handles.y)]);

% --- Executes during object creation, after setting all properties.
function scale_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function xmove_Callback(hObject, eventdata, handles)
% hObject    handle to xmove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val=get(handles.scale,'value');
val=10^(val*5+1);
x=get(hObject,'Value')*str2double(get(handles.samplenum,'String'));
axis(handles.time,[x val+x 1.5*min(handles.y) 1.5*max(handles.y)]);


% --- Executes during object creation, after setting all properties.
function xmove_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in new_time_button.
function new_time_button_Callback(hObject, eventdata, handles)
% hObject    handle to new_time_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

new_y=handles.y;
new_inputtype=handles.inputtype;
new_samplerate=handles.samplerate;
new_samplenum=handles.samplenum;
new_Fs=handles.new_FS
save signal.mat new_y new_inputtype new_samplerate new_samplenum new_Fs;
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!此处保存产生的序列至signal.mat，给后面文件用
time_analy;
%运行time_analy

% --- Executes on button press in new_freq_button.
function new_freq_button_Callback(hObject, eventdata, handles)
% hObject    handle to new_freq_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
new_y=handles.y;
new_inputtype=handles.inputtype;
new_samplerate=handles.samplerate;
new_samplenum=handles.samplenum;
new_Fs=handles.new_FS
save signal.mat new_y new_inputtype new_samplerate new_samplenum new_Fs;
freq_analy;

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
new_y=handles.y;
new_inputtype=handles.inputtype;
new_samplerate=handles.samplerate;
new_samplenum=handles.samplenum;
new_Fs=handles.new_FS
save signal.mat new_y new_inputtype new_samplerate new_samplenum new_Fs;
one_third_freq;


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in generator.
function generator_Callback(hObject, eventdata, handles)
% hObject    handle to generator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of generator
h=findobj('Tag','freq');
set(h,'enable','on');
h=findobj('Tag','amp');
set(h,'enable','on');
h=findobj('Tag','phase');
set(h,'enable','on');
set(handles.gensig,'enable','on');
set(handles.wavetype,'enable','on');
set(handles.add,'enable','on');

% --- Executes on button press in close_button.
function close_button_Callback(hObject, eventdata, handles)
% hObject    handle to close_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
