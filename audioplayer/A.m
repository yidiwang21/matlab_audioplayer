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
MyIrc1={' ',' ',' ','容祖儿-小小',...
'作曲:周杰伦作词:方文山',...
'演唱:容祖儿',' ',' ',' ',' ',' ',...
'回忆像个说书的人',...
'用充满乡音的口吻',...
'跳过水坑绕过小村',...
'等相遇的缘分',...
'你用泥巴捏一座城',...
'说将来要娶我过门',...
'转多少身过几次门',...
'虚掷青春',...
'小小的誓言还不稳',...
'小小的泪水还在撑',...
'稚嫩的唇在说离分',...
'小小的感动雨纷纷',...
'小小的别扭惹人疼',...
'小小的人还不会吻',...
'我的心里从此住了一个人',...
'曾经模样小小的我们',...
'那年你搬小小的板凳',...
'为戏入迷我也一路跟',...
'我在找那个故事里的人',...
'你是不能缺少的部分',...
'你在树下小小的打盹',...
'小小的我傻傻等'};
MyIrc2={' ',...
    ' ',...
    ' ',...
    ' ',...
    ' ',...
    ' ',...
    ' ',...
'徐誉滕-lilei&hanmeimei',...
'词曲:徐誉滕',...
' ',...
' ',' ',' ',' ',' ',...
'一切从那本英语书开始的',...
'那书中的男孩lilei',...
'身边的女孩名叫hanmeimei',...
'还有jimlily和lucy',...
'kitelintao和unclewang',...
'一只会说话的鹦鹉叫polly他到处飞',...
' ',...
'好多年没有再一次翻开它',...
'但那一段说的谁和谁',...
'偶尔还能细细回味',...
'书中他们的喜与悲',...
'书外身后的是与非',...
'还有隐隐约约和我',...
'一起长大的小暧昧',...
'后来听说lilei和hanmeimei',...
'谁也未能牵着谁的手',...
'lucy回国lily去了上海',...
'身边还有了那么多男朋友',...
'jim做了汽车公司经理',...
'娶了中国太太衣食无忧',...
'litao当了警察',...
'unclewang他去年退了休'};

MyIrc3={' ',' ',' ',' ',' ',' ',' ','黄晓明-风声',...
'作词:李焯雄作曲:曹轩宾',' ',' ',' ',' ',' '...
'若你看出我那无形的伤痕',...
'你该懂我不光是好胜',...
'亦邪亦正我会是谁的替身',...
'真作假时假当真',...
'说来遗憾就算我有多坚忍',...
'若有似无有什么凭证',...
'半喜半悲爱本来是两面刃',...
'是非由他们议论',...
'没半点风声命运却留下指纹',...
'爱你却不能过问',...
'别走漏风声爱我比敌对残忍',...
'灿烂却是近黄昏'};
MyIrc4={' ',' ',' ',' ',' ','最天使',' ',...
'演唱:曾轶可',' ',' ',...
'最好的那个天使',...
'我最熟悉的字是你的名字',...
'我们会有大大的房子',...
'你会送我一首小诗',...
'最坏的那个天使',...
'我最爱画的就是你的样子',...
'我们守着距离拉成的相思',...
'温柔着彼此的言辞',...
'我最爱的那个天使',...
'爱到可以去死',...
'爱到整个世界',...
'灯全熄灭',...
'最后还要给你体贴',...
'我最恨的就是那个天使',...
'恨到可以去死',...
'恨到快把自己的全部忘记',...
'最后还要刺青铭记',' ',' ',...
'最恨你那么久都不来见我一次',...
'最爱你当远处传来你的相思',...
'最容易想起最难忘记',...
'最想要得到最害怕失去',...
'最初的陪伴最后的需要',...
'最远的距离最近的心跳',...
'最后我说了我恨你',...
'可是我恨你就是我爱你'};

MyIrc5={' ',' ',' ',' ',' ','没有找到相应的歌词',' ',' ',' ',' ',' '};
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
    global player y Fs counter Num; %将播放器对象全局化
    str = get(handles.A_listbox, 'string'); %获取播放列表
    N = get(handles.A_listbox, 'value');    %获取当前所选的歌曲索引号
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
global player y Fs counter;%将播放器对象全局化
global n i  x  MyIrc MyIrc1 MyIrc2 MyIrc3 MyIrc4  MyIrc5 N ;
n=1;
i=1;
counter=0;
    str = get(handles.A_listbox, 'string'); %获取播放列表
 %  msgbox(str);
    n = get(handles.A_listbox, 'value');    %获取当前所选的歌曲索引号
    n = n(1);
    pathList = get(handles.A_listbox, 'userData');  %获取所有歌曲的路径变量
    if isempty(pathList)  %如果没有创建所有歌曲的路径变量，创建一个
        pathList = repmat({pwd}, length(str), 1);%假定所有歌曲在当前目录
        set(handles.A_listbox, 'userData', pathList); %将路径变量存入播放列表的UserData
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
    

 
if get(hObject, 'value')   %按下播放按钮
    %A_Pause_Play按钮图片加载
    [A,map]=imread('play.png');
    [r,c,d]=size(A); 
    x=ceil(r/80); 
    y=ceil(c/80); 
    g=A(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(hObject, 'CData', g);
     play(player);
     if (strcmp(str{n},'容祖儿-小小.wav'))
     MyIrc=MyIrc1;
 elseif (strcmp(str{n},'Lilei&Hanmeimei.wav'))
     MyIrc=MyIrc2;
 elseif(strcmp(str{n},'黄晓明-风声.wav'))
     MyIrc=MyIrc3;
 elseif (strcmp(str{n},'曾轶可-最天使.wav'))
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
else    %暂停状态
    %A_Pause_Play按钮图片加载
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

global player y Fs counter;%将播放器对象全局化
global n i  x  MyIrc MyIrc1 MyIrc2 MyIrc3 MyIrc4  MyIrc5 N ;
n=1;
i=1;
    counter=counter+1;
    str = get(handles.A_listbox, 'string'); %获取播放列表
    N = get(handles.A_listbox, 'value');    %获取当前所选的歌曲索引号
    n = N(1);
    [y,Fs]=audioread(str{n+counter});
    
    player=audioplayer(y,Fs);
    play(player);       
    if (strcmp(str{n+counter},'容祖儿-小小.wav'))
     MyIrc=MyIrc1;
 elseif (strcmp(str{n+counter},'Lilei&Hanmeimei.wav'))
     MyIrc=MyIrc2;
 elseif(strcmp(str{n+counter},'黄晓明-风声.wav'))
     MyIrc=MyIrc3;
 elseif (strcmp(str{n+counter},'曾轶可-最天使.wav'))
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
[fName, pName, index] = uigetfile('*.wav', '添加音乐', 'MultiSelect', 'on');
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
        pathList = get(handles.A_listbox, 'userData');  %获取所有歌曲的路径变量
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
    %A_NextSong按钮图片加载
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
    %A_LastSong按钮图片加载
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
    %A_Pause_Start按钮图片加载
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