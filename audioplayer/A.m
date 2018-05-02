function varargout = A(varargin)
% A MATLAB code for A.fig
%      A, by itself, creates a new A or raises the existing
%      singleton*.
%
%      H = A returns the handle to a new A or the handle to
%      the existing singleton*.
%
%      A('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A.M with the given input arguments.
%
%      A('Property','Value',...) creates a new A or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A

% Last Modified by GUIDE v2.5 03-Jul-2016 05:59:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @A_OpeningFcn, ...
                   'gui_OutputFcn',  @A_OutputFcn, ...
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

% --- Executes just before A is made visible.
function A_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A (see VARARGIN)

% Choose default command line output for A
handles.output = hObject;
clear global;
ha=axes('units','normalized','position',[0 0 1 1]); 
uistack(ha,'down') ;
II=imread('background1.jpg');
image(II) ;
 set(ha,'handlevisibility','off','visible','off');
global  i MyIrc MyIrc1 MyIrc2 MyIrc3 MyIrc4 MyIrc5;
i=1;
MyIrc1={' ',' ',' ','�����-СС',...
'����:�ܽ�������:����ɽ',...
'�ݳ�:�����',' ',' ',' ',' ',' ',...
'�������˵�����',...
'�ó��������Ŀ���',...
'����ˮ���ƹ�С��',...
'��������Ե��',...
'���������һ����',...
'˵����ҪȢ�ҹ���',...
'ת�������������',...
'�����ഺ',...
'СС�����Ի�����',...
'СС����ˮ���ڳ�',...
'���۵Ĵ���˵���',...
'СС�ĸж���׷�',...
'СС�ı�Ť������',...
'СС���˻�������',...
'�ҵ�����Ӵ�ס��һ����',...
'����ģ��СС������',...
'�������СС�İ��',...
'ΪϷ������Ҳһ·��',...
'�������Ǹ����������',...
'���ǲ���ȱ�ٵĲ���',...
'��������СС�Ĵ���',...
'СС����ɵɵ��'};
MyIrc2={' ',...
    ' ',...
    ' ',...
    ' ',...
    ' ',...
    ' ',...
    ' ',...
'������-lilei&hanmeimei',...
'����:������',...
' ',...
' ',' ',' ',' ',' ',...
'һ�д��Ǳ�Ӣ���鿪ʼ��',...
'�����е��к�lilei',...
'��ߵ�Ů������hanmeimei',...
'����jimlily��lucy',...
'kitelintao��unclewang',...
'һֻ��˵�������Ľ�polly��������',...
' ',...
'�ö���û����һ�η�����',...
'����һ��˵��˭��˭',...
'ż������ϸϸ��ζ',...
'�������ǵ�ϲ�뱯',...
'�������������',...
'��������ԼԼ����',...
'һ�𳤴��С����',...
'������˵lilei��hanmeimei',...
'˭Ҳδ��ǣ��˭����',...
'lucy�ع�lilyȥ���Ϻ�',...
'��߻�������ô��������',...
'jim����������˾����',...
'Ȣ���й�̫̫��ʳ����',...
'litao���˾���',...
'unclewang��ȥ��������'};

MyIrc3={' ',' ',' ',' ',' ',' ',' ','������-����',...
'����:����������:������',' ',' ',' ',' ',' '...
'���㿴���������ε��˺�',...
'��ö��Ҳ����Ǻ�ʤ',...
'��а�����һ���˭������',...
'������ʱ�ٵ���',...
'˵���ź��������ж����',...
'����������ʲôƾ֤',...
'��ϲ�뱯��������������',...
'�Ƿ�����������',...
'û����������ȴ����ָ��',...
'����ȴ���ܹ���',...
'����©�������ұȵжԲ���',...
'����ȴ�ǽ��ƻ�'};
MyIrc4={' ',' ',' ',' ',' ','����ʹ',' ',...
'�ݳ�:�����',' ',' ',...
'��õ��Ǹ���ʹ',...
'������Ϥ�������������',...
'���ǻ��д��ķ���',...
'�������һ��Сʫ',...
'����Ǹ���ʹ',...
'������ľ����������',...
'�������ž������ɵ���˼',...
'�����ű˴˵��Դ�',...
'������Ǹ���ʹ',...
'��������ȥ��',...
'������������',...
'��ȫϨ��',...
'���Ҫ��������',...
'����޵ľ����Ǹ���ʹ',...
'�޵�����ȥ��',...
'�޵�����Լ���ȫ������',...
'���Ҫ��������',' ',' ',...
'�������ô�ö���������һ��',...
'��㵱Զ�����������˼',...
'������������������',...
'����Ҫ�õ����ʧȥ',...
'��������������Ҫ',...
'��Զ�ľ������������',...
'�����˵���Һ���',...
'�����Һ�������Ұ���'};

MyIrc5={' ',' ',' ',' ',' ','û���ҵ���Ӧ�ĸ��',' ',' ',' ',' ',' '};
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes A wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = A_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in A_listbox.
function A_listbox_Callback(hObject, eventdata, handles)
% hObject    handle to A_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns A_listbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from A_listbox

% --- Executes during object creation, after setting all properties.
function A_listbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: A_listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function A_Lyrics_Callback(hObject, eventdata, handles)
% hObject    handle to A_Lyrics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of A_Lyrics as text
%        str2double(get(hObject,'String')) returns contents of A_Lyrics as a double

% --- Executes during object creation, after setting all properties.
function A_Lyrics_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A_Lyrics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in A_LastSong.
function A_LastSong_Callback(hObject, eventdata, handles)
% hObject    handle to A_LastSong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global player y Fs counter Num; %������������ȫ�ֻ�
    str = get(handles.A_listbox, 'string'); %��ȡ�����б�
    N = get(handles.A_listbox, 'value');    %��ȡ��ǰ��ѡ�ĸ���������
    n = N(1);
    [y,Fs]=audioread(str{n-counter});
    player=audioplayer(y,Fs);
    play(player);
    counter=counter+1;
    
% --- Executes on button press in A_Pause_Start.
function A_Pause_Start_Callback(hObject, eventdata, handles)
% hObject    handle to A_Pause_Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player y Fs counter;%������������ȫ�ֻ�
global n i  x  MyIrc MyIrc1 MyIrc2 MyIrc3 MyIrc4  MyIrc5 N ;
n=1;
i=1;
counter=0;
    str = get(handles.A_listbox, 'string'); %��ȡ�����б�
 %  msgbox(str);
    n = get(handles.A_listbox, 'value');    %��ȡ��ǰ��ѡ�ĸ���������
    n = n(1);
    pathList = get(handles.A_listbox, 'userData');  %��ȡ���и�����·������
    if isempty(pathList)  %���û�д������и�����·������������һ��
        pathList = repmat({pwd}, length(str), 1);%�ٶ����и����ڵ�ǰĿ¼
        set(handles.A_listbox, 'userData', pathList); %��·���������벥���б��UserData
    end
%     if iscell(str{n})
%         msgbox('Yes');
%     else
%         msgbox('No');
%         msgbox(str{n});
%     end
%    [y,Fs]=audioread(str{n});
    [y,Fs]=audioread(str);
    player=audioplayer(y,Fs);
    

 
if get(hObject, 'value')   %���²��Ű�ť
    %A_Pause_Play��ťͼƬ����
    [A,map]=imread('play.png');
    [r,c,d]=size(A); 
    x=ceil(r/80); 
    y=ceil(c/80); 
    g=A(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(hObject, 'CData', g);
     play(player);
     if (strcmp(str{n},'�����-СС.wav'))
     MyIrc=MyIrc1;
 elseif (strcmp(str{n},'Lilei&Hanmeimei.wav'))
     MyIrc=MyIrc2;
 elseif(strcmp(str{n},'������-����.wav'))
     MyIrc=MyIrc3;
 elseif (strcmp(str{n},'�����-����ʹ.wav'))
     MyIrc=MyIrc4;
 else 
     MyIrc=MyIrc5;
 end
 [M,N]=size(MyIrc);
 for i=1:(N-10)
     pause(2);
     Str1 = MyIrc{i};
     Str2 = MyIrc{i+1};
     Str3 = MyIrc{i+2};
     Str4 = MyIrc{i+3};
     Str5 = MyIrc{i+4};
     Str6 = MyIrc{i+5};
     Str7 = MyIrc{i+6};
     Str8= MyIrc{i+7};
     Str9 = MyIrc{i+8};
     Str10 = MyIrc{i+9};
    TemStr = char(Str1,Str2, Str3, Str4, Str5,Str6,Str7,Str8,Str9,Str10);
    set(handles.A_Lyrics,'string',TemStr);
 end;
else    %��ͣ״̬
    %A_Pause_Play��ťͼƬ����
    [A,map]=imread('stop.png');
    [r,c,d]=size(A); 
    x=ceil(r/80); 
    y=ceil(c/80); 
    g=A(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(hObject, 'CData', g);
   
     stop(player);
     set(handles.A_Lyrics,'string',' ');
end
guidata(hObject, handles);

% --- Executes on button press in A_NextSong.
function A_NextSong_Callback(hObject, eventdata, handles)
% hObject    handle to A_NextSong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global player y Fs counter;%������������ȫ�ֻ�
global n i  x  MyIrc MyIrc1 MyIrc2 MyIrc3 MyIrc4  MyIrc5 N ;
n=1;
i=1;
    counter=counter+1;
    str = get(handles.A_listbox, 'string'); %��ȡ�����б�
    N = get(handles.A_listbox, 'value');    %��ȡ��ǰ��ѡ�ĸ���������
    n = N(1);
    [y,Fs]=audioread(str{n+counter});
    
    player=audioplayer(y,Fs);
    play(player);       
    if (strcmp(str{n+counter},'�����-СС.wav'))
     MyIrc=MyIrc1;
 elseif (strcmp(str{n+counter},'Lilei&Hanmeimei.wav'))
     MyIrc=MyIrc2;
 elseif(strcmp(str{n+counter},'������-����.wav'))
     MyIrc=MyIrc3;
 elseif (strcmp(str{n+counter},'�����-����ʹ.wav'))
     MyIrc=MyIrc4;
 else 
     MyIrc=MyIrc5;
 end
 [M,N]=size(MyIrc);
 for i=1:(N-10)
     pause(2);
     Str1 = MyIrc{i};
     Str2 = MyIrc{i+1};
     Str3 = MyIrc{i+2};
     Str4 = MyIrc{i+3};
     Str5 = MyIrc{i+4};
     Str6 = MyIrc{i+5};
     Str7 = MyIrc{i+6};
     Str8= MyIrc{i+7};
     Str9 = MyIrc{i+8};
     Str10 = MyIrc{i+9};
    TemStr = char(Str1,Str2, Str3, Str4, Str5,Str6,Str7,Str8,Str9,Str10);
    set(handles.A_Lyrics,'string',TemStr);
 end;
  


% --------------------------------------------------------------------
function A_Menu_Callback(hObject, eventdata, handles)
% hObject    handle to A_Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function A_input1_Callback(hObject, eventdata, handles)
% hObject    handle to A_input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fName, pName, index] = uigetfile('*.wav', '�������', 'MultiSelect', 'on');
if index == 1
    strName = get(handles.A_listbox, 'string');
    if ~isempty(strName)
        nMusic = size(strName, 1);
    else
        nMusic = 0;
    end
    if iscell(fName)
        nMusicAdd = size(fName, 2);
    else
        nMusicAdd = 1;
    end
    
    if ~nMusic
        pathList = repmat({pName}, nMusicAdd, 1);
    else
        pathList = get(handles.A_listbox, 'userData');  %��ȡ���и�����·������
        if nMusicAdd > 1
            pathList = [pathList; repmat({pName}, nMusicAdd, 1)];
        else
            pathList = [pathList; {pName}];
        end
    end
    set(handles.A_listbox, 'userData', pathList);
    set(handles.A_listbox, 'string', fName);
end

% --------------------------------------------------------------------
function A_input2_Callback(hObject, eventdata, handles)
% hObject    handle to A_input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run(record_audio);

% --------------------------------------------------------------------
function A_input3_Callback(hObject, eventdata, handles)
% hObject    handle to A_input3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run(audio_project);

% --------------------------------------------------------------------
function A_Menu2_Callback(hObject, eventdata, handles)
% hObject    handle to A_Menu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run(B2);

% --------------------------------------------------------------------
function A_Menu3_Callback(hObject, eventdata, handles)
% hObject    handle to A_Menu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run(C);

% --------------------------------------------------------------------
function A_Menu4_Callback(hObject, eventdata, handles)
% hObject    handle to A_Menu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run(D);

% --------------------------------------------------------------------
function A_Menu5_Callback(hObject, eventdata, handles)
% hObject    handle to A_Menu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run(E);

function A_Menu6_Callback(hObject, eventdata, handles)
% hObject    handle to A_Menu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run(fast);

% --- Executes during object creation, after setting all properties.
function A_NextSong_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A_NextSong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
    %A_NextSong��ťͼƬ����
    [A,map]=imread('next.png');
    [r,c,d]=size(A); 
    x=ceil(r/80); 
    y=ceil(c/80); 
    g=A(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(hObject, 'CData', g);

% --- Executes during object creation, after setting all properties.
function A_LastSong_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A_LastSong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
    %A_LastSong��ťͼƬ����
    [A,map]=imread('last.jpg');
    [r,c,d]=size(A); 
    x=ceil(r/80); 
    y=ceil(c/80); 
    g=A(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(hObject, 'CData', g);

% --- Executes during object creation, after setting all properties.
function A_Pause_Start_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A_Pause_Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
    %A_Pause_Start��ťͼƬ����
    [A,map]=imread('play.png');
    [r,c,d]=size(A); 
    x=ceil(r/80); 
    y=ceil(c/80); 
    g=A(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(hObject, 'CData', g);


% --- Executes during object creation, after setting all properties.
function A_uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A_uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% II=imread('background2.jpg'); 
% image(II);


% --------------------------------------------------------------------
function A_Menu7_Callback(hObject, eventdata, handles)
% hObject    handle to A_Menu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run(compose);