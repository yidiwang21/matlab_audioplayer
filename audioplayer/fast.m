function varargout = fast(varargin)
% FAST MATLAB code for fast.fig
%      FAST, by itself, creates a new FAST or raises the existing
%      singleton*.
%
%      H = FAST returns the handle to a new FAST or the handle to
%      the existing singleton*.
%
%      FAST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FAST.M with the given input arguments.
%
%      FAST('Property','Value',...) creates a new FAST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fast_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fast_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fast

% Last Modified by GUIDE v2.5 02-Jul-2016 11:52:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fast_OpeningFcn, ...
                   'gui_OutputFcn',  @fast_OutputFcn, ...
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


% --- Executes just before fast is made visible.
function fast_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fast (see VARARGIN)

% Choose default command line output for fast
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fast wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fast_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in choose.
function choose_Callback(hObject, eventdata, handles)
% hObject    handle to choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global audio pathname filename 
[filename, pathname] = uigetfile('*.wav', 'Pick an WAVE-file');
if isequal(filename,0)
  disp('User selected Cancel')
else
  disp(['User selected', fullfile(pathname, filename)])
  [handles.y,handles.fs]=audioread(filename);
  %handles.y=handles.y(:,1);
  guidata(hObject,handles);
end



% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%handles.y=handles.y(:,1);
%s=round(length(handles.y)/1000);
global audio songname songpath prog
prog=0;
%x=audioread(songname);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    b=get(handles.slider1,'value');
    set(handles.text2,'string',b);
%z=round(s*b);
%y=zeros(1000,z);
    if b>1
        yy=handles.y;
        %yy=handles.y(:,1);
        s=round(length(yy)/1000);
        z=round(s*b);
        y=zeros(1000,z);
        for i=1:1000
            for j=1:s
                y(i,j)=yy(j+(i-1)*s);
            end
            for j=(s+1):z
                y(i,j)=yy(j+(i-2)*s);
            end
        end
        yy=reshape (y',1,[]);
    else
    %fast
        yy=handles.y;
        %yy=handles.y(:,1);
        s=round(length(yy)/1000);
        z=round(s*b);   
        y=zeros(1000,z);
        for i=1:1000
            for j=1:z
                y(i,j)=yy(j+(i-1)*s);
            end
        end
        yy=reshape (y',1,[]);
    end

    %yt=yy(((i-1)*fs+1):((i-1)*fs+handles.fs));

audio=audioplayer(yy,handles.fs); 
play(audio);
N=length(yy); 
timelength=fix(N/handles.fs);
set(handles.progress,'Max',timelength);
set(handles.wholetime,'string',timelength)
%波形实时显示，但是不能确定插值之后的fs
for k=1:timelength
   tic;
   a=yy(handles.fs*(k-1)+1:handles.fs*k);
   set(handles.progress,'value',k); 
   set(handles.nowtime,'string',k);
   plot(handles.axes1,a);
   ylim(handles.axes1,[-1 1]);
   xlim(handles.axes1,[0 2000]);
   set(gcf,'doublebuffer','on');
   %plot(handles.axes2,
   t=toc;
   pause(1-t);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
guidata(hObject,handles);


% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Stop
global audio
stop(audio);
if get(handles.Stop,'value')==1
    uiwait;
else
    uiresume;
end
clear sound

% --- Executes on slider movement.
function progress_Callback(hObject, eventdata, handles)
% hObject    handle to progress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function progress_CreateFcn(hObject, eventdata, handles)
% hObject    handle to progress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
