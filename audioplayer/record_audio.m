function varargout = record_audio(varargin)
% RECORD_AUDIO M-file for record_audio.fig
%      RECORD_AUDIO, by itself, creates a new RECORD_AUDIO or raises the existing
%      singleton*.
%
%      H = RECORD_AUDIO returns the handle to a new RECORD_AUDIO or the handle to
%      the existing singleton*.
%
%      RECORD_AUDIO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECORD_AUDIO.M with the given input arguments.
%
%      RECORD_AUDIO('Property','Value',...) creates a new RECORD_AUDIO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before record_audio_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to record_audio_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help record_audio

% Last Modified by GUIDE v2.5 11-Nov-2007 11:07:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @record_audio_OpeningFcn, ...
                   'gui_OutputFcn',  @record_audio_OutputFcn, ...
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


% --- Executes just before record_audio is made visible.
function record_audio_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to record_audio (see VARARGIN)

% Choose default command line output for record_audio
handles.output = hObject;

micrecorder = audiorecorder(22050,8,1);;

handles.micrecorder=micrecorder;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes record_audio wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = record_audio_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% micrecorder = handles.micrecorder;
record(handles.micrecorder);
% Now, speak into microphone

% stop(micrecorder);
% speechplayer = play(micrecorder); 
% % Now, listen to the recording
% 
% stop(speechplayer);
guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% micrecorder = handles.micrecorder;
stop(handles.micrecorder);
micrecorder = handles.micrecorder;
speechdata = getaudiodata(micrecorder, 'uint8');
%Fs = get(micrecorder, 'SampleRate');
size(speechdata);
[filename, pathname] = uiputfile({'*.wav';'*.*'},'Save as','savespeechdata');
audiowrite('savespeechdata.wav',speechdata,22050);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fName, pName] = uigetfile('*.wav', 'ÃÌº”“Ù¿÷', 'MultiSelect', 'on');
 [y,Fs]=audioread(fName);
% player=audioplayer(y,Fs);
% axes(handles.axes1);
% play(player);
sound(y,Fs);
sigLength=length(y);
Y = fft(y,sigLength);
Pyy = Y.* conj(Y) / sigLength;
halflength=floor(sigLength/2);
f=Fs*(0:halflength)/sigLength;
figure;
plot(f,Pyy(1:halflength+1));xlabel('Frequency(Hz)');
t=(0:sigLength-1)/Fs;
figure;
plot(t,y);xlabel('Time(s)');




% Now, listen to the recording

% stop(speechplayer);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);

% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

