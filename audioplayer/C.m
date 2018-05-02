function varargout = C(varargin)
% C MATLAB code for C.fig
%      C, by itself, creates a new C or raises the existing
%      singleton*.
%
%      H = C returns the handle to a new C or the handle to
%      the existing singleton*.
%
%      C('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in C.M with the given input arguments.
%
%      C('Property','Value',...) creates a new C or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before C_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to C_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help C

% Last Modified by GUIDE v2.5 14-Jun-2016 11:36:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @C_OpeningFcn, ...
                   'gui_OutputFcn',  @C_OutputFcn, ...
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


% --- Executes just before C is made visible.
function C_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to C (see VARARGIN)

% Choose default command line output for C
handles.output = hObject;
set(handles.C_showfile,'Visible','off');
set(handles.C_filter,'Enable','off');
set(handles.C_stop,'Enable','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes C wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = C_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function C_freq1_Callback(hObject, eventdata, handles)
% hObject    handle to C_freq1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C_freq1 as text
%        str2double(get(hObject,'String')) returns contents of C_freq1 as a double


% --- Executes during object creation, after setting all properties.
function C_freq1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C_freq1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C_freq2_Callback(hObject, eventdata, handles)
% hObject    handle to C_text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C_text2 as text
%        str2double(get(hObject,'String')) returns contents of C_text2 as a double


% --- Executes during object creation, after setting all properties.
function C_freq2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C_text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in C_open.
function C_open_Callback(hObject, eventdata, handles)
% hObject    handle to C_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.wav', 'Pick an WAVE-file');
if isequal(filename,0)
   disp('User selected Cancel')
else
   disp(['User selected', fullfile(pathname, filename)])
   [handles.y,handles.Fs]=audioread(filename);
   set(handles.C_showfile,'Visible','on');
   set(handles.C_showfile,'String',filename);
   handles.y=handles.y(:,1);
   guidata(hObject,handles);
end
set(handles.C_filter,'Enable','on');


% --- Executes on button press in C_filter.
function C_filter_Callback(hObject, eventdata, handles)
% hObject    handle to C_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%set(handles.C_axes2,'Visible','off');
js=str2double(get(handles.C_js,'String'));
W1=str2double(get(handles.C_freq1,'String'));
W2=str2double(get(handles.C_freq2,'String'));
if W1>1
    W1=2*W1/handles.Fs;
end
if W2>1
    W2=2*W2/handles.Fs;
end
if get(handles.C_radiobutton1,'Value')==1
   [b a]=butter(js,W1,'low');
elseif get(handles.C_radiobutton2,'Value')==1
   [b a]=butter(js,W1,'high');
elseif get(handles.C_radiobutton3,'Value')==1
[b a]=butter(js,[W1 W2]);
elseif get(handles.C_radiobutton4,'Value')==1
[b a]=butter(js,[W1 W2],'stop');
else
    errordlg('Filter type chosen error!lowpass,highpass,bandpass or bandstop?');
    return;
end

set(handles.C_stop,'Enable','on');
[H f]=freqz(b,a,512);
plot(handles.C_axes1,f,abs(H));
maxf=max(f)/2;
axis(handles.C_axes1,[0 maxf 0 max(abs(H))*1.5]);

handles.y=filter(b,a,handles.y);
handles.f=f;
handles.H=abs(H);
%play & plot 
Y=fft(handles.y);
%switch get(findobj('Tag','popupmenu5'),'Value')
%    case 1
      f=linspace(0,handles.Fs/2,length(handles.y)/2);
       Y=Y(1:length(handles.y)/2);

      % plot(handles.C_axes1,f,2*sqrt(Y.*conj(Y))/length(handles.y));
        x=linspace(1,length(handles.y)/handles.Fs,length(handles.y));

       plot(handles.C_axes2,x,handles.y);
       sound(handles.y,handles.Fs);
       %player=audioplayer(handles.y,handles.Fs);
       %play(player);
guidata(hObject, handles);


function C_js_Callback(hObject, eventdata, handles)
% hObject    handle to C_js (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C_js as text
%        str2double(get(hObject,'String')) returns contents of C_js as a double


% --- Executes during object creation, after setting all properties.
function C_js_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C_js (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in C_stop.
function C_stop_Callback(hObject, eventdata, handles)
% hObject    handle to C_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear sound;


% --- Executes during object creation, after setting all properties.
function C_showfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C_showfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
