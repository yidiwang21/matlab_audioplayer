function varargout = D(varargin)
% D MATLAB code for D.fig
%      D, by itself, creates a new D or raises the existing
%      singleton*.
%
%      H = D returns the handle to a new D or the handle to
%      the existing singleton*.
%
%      D('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in D.M with the given input arguments.
%
%      D('Property','Value',...) creates a new D or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before D_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to D_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help D

% Last Modified by GUIDE v2.5 02-Jul-2016 10:24:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @D_OpeningFcn, ...
                   'gui_OutputFcn',  @D_OutputFcn, ...
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


% --- Executes just before D is made visible.
function D_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to D (see VARARGIN)

% Choose default command line output for D
handles.output = hObject;

set(handles.reverberation,'Enable','off');
set(handles.filter,'Enable','off');
set(handles.stop,'Enable','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes D wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = D_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function D_uipanel2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D_uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
%ktv = importdata('KTV2.JPG');
%set(handles.D_uipanel2,'CDATA',ktv);

%������
% --- Executes on button press in D_pushbutton1.
function D_pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to D_pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.y,handles.fs]=audioread('five.wav');
sound(handles.y,handles.fs);

% --- Executes on button press in D_pushbutton2.
function D_pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to D_pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in D_pushbutton3.
function D_pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to D_pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in D_pushbutton4.
function D_pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to D_pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%����
% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
ha=axes('units','normalized','position',[0 0 1 1]); 
uistack(ha,'bottom') ;
A=imread('ktv_bg.jpg'); 
image(A);
colormap gray ;
set(ha,'handlevisibility','off','visible','off'); 

%������
% --- Executes on button press in E_pushbutton3.
function E_pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to E_pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.y,handles.fs]=audioread('good.wav');
sound(handles.y,handles.fs);

%����
% --- Executes on button press in E_pushbutton5.
function E_pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to E_pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.y,handles.fs]=audioread('hiss.wav');
sound(handles.y,handles.fs);

%Ц��
% --- Executes on button press in E_pushbutton4.
function E_pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to E_pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.y,handles.fs]=audioread('laugh.wav');
sound(handles.y,handles.fs);

% --- Executes on button press in E_pushbutton2.
function E_pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to E_pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in D_pushbutton1.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to D_pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%����Ч��
% --- Executes on button press in reverberation.
function reverberation_Callback(hObject, eventdata, handles)
% hObject    handle to reverberation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%[handles.y,handles.fs]=audioread('daycws.wav',[100 100000]);
handles.y=handles.y(:,1);
n1=0:20000;
N=size(handles.y,1);
k=[handles.y;zeros(10000,1)];
z=[zeros(10000,1);handles.y];
y1=k+z;
axes(handles.D_axes1);
plot(y1);
title('�����ʱ��ͼ','fontname','����');
Y1=fft(y1,20001);
axes(handles.D_axes2);
%plot(n1,Y1);
plot(n1(1:1000),Y1(1:1000));
title('�����Ƶ��ͼ','fontname','����');
%audiowrite('hunxiang.wav',y1,handles.fs);
sound(y1,handles.fs);
%audiowrite('hunxiang.wav',y1,handles.fs);
guidata(hObject,handles);

%�������˲���
% --- Executes on button press in filter.
function filter_Callback(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('play');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n1=0:20000;
N=size(handles.y,1);
k=[handles.y;zeros(100,1)];
z=[zeros(100,1);handles.y];
a=0.5;
y2=k+z*a;
axes(handles.D_axes1);
plot(y2);
title('�������˲�ʱ��ͼ','fontname','����');
Y2=fft(y2,20001);
axes(handles.D_axes2)
plot(n1(1:1000),Y2(1:1000));
title('�������˲�Ƶ��ͼ','fontname','����');
sound(y2,handles.fs);
%robj = audiorecorder(44100,16,1);  %���ò���Ƶ�ʡ�����λ����ͨ����
%recordblocking(robj,1);            %�ɼ��������ݣ�1s���ȣ�
%rdata = getaudiodata(robj);        %��ȡ��Ƶ����
drawnow                            %ˢ����ʾ
n = 100;                           %�趨�����Ĳ������´�����n��m�����ϼ����������ʱ�䳤��
m = 0.1;                           %�趨���¼����mԽС����Խ����
while n>1
    recordblocking(y2,m);
    rlen = length(y2);          %��ȡ���ݳ���
    olddata = y2(floor(rlen*m):rlen,1);     %�����ľ�����
    y2 = [olddata ; getaudiodata(y2)];    %����ʾ������ = ������ + ������
    axes(handles.D_axes2)
    plot(y2);
    %axis([1,44100,-0.1,0.1]);
    drawnow
    n = n-1;
end



%ֹͣ����
% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear sound;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.wav', 'Pick an WAVE-file');
if isequal(filename,0)
   disp('User selected Cancel')
else
   disp(['User selected', fullfile(pathname, filename)])
   [handles.y,handles.fs]=audioread(filename);
   handles.y=handles.y(:,1);
   guidata(hObject,handles);
end
set(handles.reverberation,'Enable','on');
set(handles.filter,'Enable','on');
set(handles.stop,'Enable','on');
