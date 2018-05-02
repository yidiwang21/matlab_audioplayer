function varargout = B2(varargin)
% B2 MATLAB code for B2.fig
%      B2, by itself, creates a new B2 or raises the existing
%      singleton*.
%
%      H = B2 returns the handle to a new B2 or the handle to
%      the existing singleton*.
%
%      B2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in B2.M with the given input arguments.
%
%      B2('Property','Value',...) creates a new B2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before B2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to B2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help B2

% Last Modified by GUIDE v2.5 14-Jun-2016 20:38:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @B2_OpeningFcn, ...
                   'gui_OutputFcn',  @B2_OutputFcn, ...
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


% --- Executes just before B2 is made visible.
function B2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to B2 (see VARARGIN)

% Choose default command line output for B2
handles.output = hObject;
handles.Ap=1;
handles.As=32;
handles.sli=zeros(1,8);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes B2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = B2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in B_order.
function B_order_Callback(hObject, eventdata, handles)
% hObject    handle to B_order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns B_order contents as cell array
%        contents{get(hObject,'Value')} returns selected item from B_order


% --- Executes during object creation, after setting all properties.
function B_order_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B_order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in B_load.
function B_load_Callback(hObject, eventdata, handles)
% hObject    handle to B_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.wav', 'Pick an WAVE-file');
disp(['User selected', fullfile(pathname, filename)])
[handles.x,handles.fs]=audioread(filename);
	
handles.y=zeros(handles.sn,10);
handles.fpass=[100,200,500,1000,2100,4000,8000,16000]/(44100/2);                             %通带截频
handles.fstop=[30,380,130,800,300,1400,800,2400,1800,4500,3500,9000,7000,18000]/(44100/2);   %阻带截频
set(handles.B_pre,'Enable','on');
guidata(hObject,handles);


% --- Executes on selection change in B_Style.
function B_Style_Callback(hObject, eventdata, handles)
% hObject    handle to B_Style (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns B_Style contents as cell array
%        contents{get(hObject,'Value')} returns selected item from B_Style


% --- Executes during object creation, after setting all properties.
function B_Style_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B_Style (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on slider movement.
function B_slider1_Callback(hObject, eventdata, handles)
% hObject    handle to B_slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.sli(1)=get(handles.B_slider1,'Value');
guidata(hObject, handles);
set(handles.B_style,'Value',1);

% --- Executes during object creation, after setting all properties.
function B_slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B_slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function B_slider2_Callback(hObject, eventdata, handles)
% hObject    handle to B_slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.sli(2)=get(handles.B_slider2,'Value');
guidata(hObject, handles);
set(handles.B_style,'Value',1);

% --- Executes during object creation, after setting all properties.
function B_slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B_slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function B_slider3_Callback(hObject, eventdata, handles)
% hObject    handle to B_slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.sli(3)=get(handles.B_slider3,'Value');
guidata(hObject, handles);
set(handles.B_style,'Value',1);

% --- Executes during object creation, after setting all properties.
function B_slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B_slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function B_slider4_Callback(hObject, eventdata, handles)
% hObject    handle to B_slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.sli(4)=get(handles.B_slider4,'Value');
guidata(hObject, handles);
set(handles.B_style,'Value',1);

% --- Executes during object creation, after setting all properties.
function B_slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B_slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function B_slider5_Callback(hObject, eventdata, handles)
% hObject    handle to B_slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.sli(5)=get(handles.B_slider5,'Value');
guidata(hObject, handles);
set(handles.B_style,'Value',1);

% --- Executes during object creation, after setting all properties.
function B_slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B_slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function B_slider6_Callback(hObject, eventdata, handles)
% hObject    handle to B_slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.sli(6)=get(handles.B_slider6,'Value');
guidata(hObject, handles);
set(handles.B_style,'Value',1);


% --- Executes during object creation, after setting all properties.
function B_slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B_slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function B_slider7_Callback(hObject, eventdata, handles)
% hObject    handle to B_slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.sli(7)=get(handles.B_slider7,'Value');
guidata(hObject, handles);
set(handles.B_style,'Value',1);

% --- Executes during object creation, after setting all properties.
function B_slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B_slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function B_slider8_Callback(hObject, eventdata, handles)
% hObject    handle to B_slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.sli(8)=get(handles.B_slider8,'Value');
guidata(hObject, handles);
set(handles.B_style,'Value',1);

% --- Executes during object creation, after setting all properties.
function B_slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B_slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function B_slider9_Callback(hObject, eventdata, handles)
% hObject    handle to B_slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.sli(9)=get(handles.B_slider9,'Value');
guidata(hObject, handles);
set(handles.B_style,'Value',1);


% --- Executes during object creation, after setting all properties.
function B_slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B_slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function B_slider10_Callback(hObject, eventdata, handles)
% hObject    handle to B_slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.sli(10)=get(handles.B_slider10,'Value');
guidata(hObject, handles);
set(handles.B_style,'Value',1);


% --- Executes during object creation, after setting all properties.
function B_slider10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B_slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on button press in B_play.
function B_play_Callback(hObject, eventdata, handles)
% hObject    handle to B_play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('do play')
set(handles.B_play,'Enable','off');
set(handles.B_stop,'Enable','on');
set(handles.axes5,'Visible','off');
set(handles.axes6,'Visible','off');
handles.yy=zeros(handles.sn,1);
global seq_player
for k=1:2:7
    handles.yy=handles.yy+handles.y(:,k)*10^handles.sli(k)+handles.y(:,k+1)*10^handles.sli(k+1);
end
fs=floor(handles.fs/10);
ymax=max(handles.yy);
handles.yy=handles.yy/ymax;                                               
num=floor(handles.sn/handles.fs*10);
hannw=hann(16384);
tk=(1:handles.fs)/handles.fs;
fk=floor((1:8192)*44100/16384);
handles.yy=handles.yy*3;
seq_player=audioplayer(handles.yy,handles.fs);
play(seq_player);
%实时波形显示
for i=1:(num-10) 
    tic; 
    yt=handles.yy(((i-1)*fs+1):((i-1)*fs+handles.fs));
    yfw=handles.yy(((i-1)*fs+1):((i-1)*fs+16384)).*hannw;
    yf=fft(yfw,16384);
    plot(handles.axes1,tk,yt,'red');
    ylim(handles.axes1,[-3 3]);
    set(gcf,'doublebuffer','on');
    plot(handles.axes2,fk,20*(log(abs(yf(1:8192))/max(yf(1:8192)))));
    xlim(handles.axes2,[0 22050]);
    ylim(handles.axes2,[-100 0]);
    t1=toc;
    pause(1/10-t1); 
end
guidata(hObject, handles);
disp('play successful')

% --- Executes on button press in B_reset.
function B_reset_Callback(hObject, eventdata, handles)
% hObject    handle to B_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('do reset')
set(handles.B_slider1,'value',0);
set(handles.B_slider2,'value',0);
set(handles.B_slider3,'value',0);
set(handles.B_slider4,'value',0);
set(handles.B_slider5,'value',0);
set(handles.B_slider6,'value',0);
set(handles.B_slider7,'value',0);
set(handles.B_slider8,'value',0);
set(handles.B_slider9,'value',0);
set(handles.B_slider10,'value',0);

set(handles.B_style,'value',1);
handles.sli=zeros(1,8);
guidata(hObject, handles);
disp('reset successful')

% --- Executes on button press in B_pre.
function B_pre_Callback(hObject, eventdata, handles)
% hObject    handle to B_pre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('loading')
Wp1=100/handles.fs;Ws1=150/handles.fs;
[N,Wn]=cheb1ord(Wp1,Ws1,handles.Ap,handles.As);
[num,den]=cheby1(N,1,Wn);
handles.y(:,1)=filter(num,den,handles.x(:,1));
pause(0.0001);
for i=1:7    
    Wp1=handles.fpass(i);
    Wp2=handles.fpass(i+1);
    Ws1=handles.fstop(2*i-1);
    Ws2=handles.fstop(2*i);
    [N,Wn]=cheb1ord([Wp1 Wp2],[Ws1 Ws2],handles.Ap,handles.As);
    [num,den]=cheby1(N,1,Wn);
    handles.y(:,i+1)=filter(num,den,handles.x(:,1));
    pause(0.0001);
end
set(handles.B_play,'Enable','on');
set(handles.B_pre,'Enable','off');
guidata(hObject, handles);
disp('load successful')


% --- Executes on button press in B_style.
function B_style_Callback(hObject, eventdata, handles)
% hObject    handle to B_style (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of B_style


% --- Executes on button press in B_stop.
function B_stop_Callback(hObject, eventdata, handles)
% hObject    handle to B_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global seq_player
clear playsnd;
clear handles.yy;
stop(seq_player);
guidata(hObject, handles);
set(handles.B_stop,'Enable','off');
set(handles.B_play,'Enable','on');
set(handles.axes5,'Visible','on');
set(handles.axes6,'Visible','on');


% --- Executes on button press in B_style2.
function B_style2_Callback(hObject, eventdata, handles)
% hObject    handle to B_style2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of B_style2
%人声
set(handles.B_slider1,'value',0.4);
set(handles.B_slider2,'value',0);
set(handles.B_slider3,'value',0.1);
set(handles.B_slider4,'value',0.2);
set(handles.B_slider5,'value',0.3);
set(handles.B_slider6,'value',0.4);
set(handles.B_slider7,'value',0.5);
set(handles.B_slider8,'value',0.4);
set(handles.B_slider7,'value',0.3);
set(handles.B_slider8,'value',0.3);
handles.sli(1)=get(handles.B_slider1,'Value');
handles.sli(2)=get(handles.B_slider2,'Value');
handles.sli(3)=get(handles.B_slider3,'Value');
handles.sli(4)=get(handles.B_slider4,'Value');
handles.sli(5)=get(handles.B_slider5,'Value');
handles.sli(6)=get(handles.B_slider6,'Value');
handles.sli(7)=get(handles.B_slider7,'Value');
handles.sli(8)=get(handles.B_slider8,'Value');
guidata(hObject, handles);


% --- Executes on button press in B_style3.
function B_style3_Callback(hObject, eventdata, handles)
% hObject    handle to B_style3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of B_style3
%低音
set(handles.B_slider1,'value',0.6);
set(handles.B_slider2,'value',0.4);
set(handles.B_slider3,'value',-0.5);
set(handles.B_slider4,'value',0.2);
set(handles.B_slider5,'value',0.3);
set(handles.B_slider6,'value',0.4);
set(handles.B_slider7,'value',0.4);
set(handles.B_slider8,'value',0.5);
set(handles.B_slider9,'value',0.5);
set(handles.B_slider10,'value',0.6);
handles.sli(1)=get(handles.B_slider1,'Value');
handles.sli(2)=get(handles.B_slider2,'Value');
handles.sli(3)=get(handles.B_slider3,'Value');
handles.sli(4)=get(handles.B_slider4,'Value');
handles.sli(5)=get(handles.B_slider5,'Value');
handles.sli(6)=get(handles.B_slider6,'Value');
handles.sli(7)=get(handles.B_slider7,'Value');
handles.sli(8)=get(handles.B_slider8,'Value');
guidata(hObject, handles);


% --- Executes on button press in B_style4.
function B_style4_Callback(hObject, eventdata, handles)
% hObject    handle to B_style4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of B_style4
%摇滚
set(handles.B_slider1,'value',0);
set(handles.B_slider2,'value',0.6);
set(handles.B_slider3,'value',0.4);
set(handles.B_slider4,'value',-0.2);
set(handles.B_slider5,'value',-0.6);
set(handles.B_slider6,'value',0.1);
set(handles.B_slider7,'value',0.6);
set(handles.B_slider8,'value',0.9);
set(handles.B_slider7,'value',0.7);
set(handles.B_slider8,'value',0.9);
handles.sli(1)=get(handles.B_slider1,'Value');
handles.sli(2)=get(handles.B_slider2,'Value');
handles.sli(3)=get(handles.B_slider3,'Value');
handles.sli(4)=get(handles.B_slider4,'Value');
handles.sli(5)=get(handles.B_slider5,'Value');
handles.sli(6)=get(handles.B_slider6,'Value');
handles.sli(7)=get(handles.B_slider7,'Value');
handles.sli(8)=get(handles.B_slider8,'Value');
guidata(hObject, handles);
