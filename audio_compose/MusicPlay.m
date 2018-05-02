function music()
    clear;
    global fs musicType BSPlayer gqPlayer BSPlot gqPlot tempo tone isRead glof glotime gloj;
    fs = 44100;
    musicType = '钢琴';
    tone = 1;
    isRead = 0;

    fig = figure('units','normalized','position',[0.15 0.15 0.6 0.65],...
        'menubar','none','numberTitle','off','Name','MusicPlay');
    ax = axes('DrawMode','fast','position',[0,0.1,0.85,0.89]);
    I=imread('back1.jpg');
    image(I)
    %修改按钮
    change_tone_button = uicontrol(fig,'Style','pushbutton','units', 'normalized','position', [0.86,0.75,0.12,0.09], 'FontSize',10,'String','修改节拍','CallBack',@button_callback1);
    change_music_button = uicontrol(fig,'Style','pushbutton','units', 'normalized','position', [0.86,0.65,0.12,0.09], 'FontSize',10,'String','读取横向乐谱','CallBack',@button_callback2);
   
    gangqin_button = uicontrol(fig,'Style','pushbutton','units', 'normalized','position', [0.86,0.55,0.12,0.09], 'FontSize',10,'String','播放Piano','CallBack',@button_callback3);
    bassoon_button = uicontrol(fig,'Style','pushbutton','units', 'normalized','position', [0.86,0.45,0.12,0.09], 'FontSize',10,'String','播放Bassoon','CallBack',@button_callback3);
    
    resume_button = uicontrol(fig,'Style','pushbutton','units', 'normalized','position', [0.86,0.35,0.12,0.09], 'FontSize',10,'String','播放','CallBack',@button_callback3);
    pause_button = uicontrol(fig,'Style','pushbutton','units', 'normalized','position', [0.86,0.25,0.12,0.09], 'FontSize',10,'String','暂停','CallBack',@button_callback3);
    stop_button = uicontrol(fig,'Style','pushbutton','units', 'normalized','position', [0.86,0.15,0.12,0.09], 'FontSize',10,'String','结束','CallBack',@button_callback3);
   
end
function button_callback2(object,data,handles)
    global isRead glof glotime gloj
    D = uiimport();
    cell = struct2cell(D);%将结构体转化为元胞数组
    data = cell{1};%读取第一个数据，是一个三维矩阵
    glof = data(1,:);
    glotime =  data(2,:)/16;
    gloj= data(3,:);
    isRead = 1;

    gangqin(glof,glotime,gloj);
end
function button_callback3(object,data,handles)
    global fs musicType BSPlayer gqPlayer gqPlot BSPlot;
    switch(object.String)
        case '播放Bassoon'
            bassoon();
        case '播放Piano'
            musicType = '钢琴';
            sound(gqPlayer);
            subplot('position',[0.05 0.54 0.8 0.3]);
            plot(gqPlot);
            subplot('position',[0.05 0.1 0.8 0.3]);
            plot(abs(fft(gqPlot(1:fs))));
        case '继续播放'
            switch(musicType)
                case 'Bassoon'
                    resume(BSPlayer);
                case '钢琴'
                    resume(gqPlayer);
            end
        case '暂停'
            switch(musicType)
                case 'Bassoon'
                    pause(BSPlayer);
                case '钢琴'
                    pause(gqPlayer);
            end
        case '结束'
            switch(musicType)
                case 'Bassoon'
                    stop(BSPlayer);
                case '钢琴'
                    stop(gqPlayer);
            end
    end
end
function gangqin(varargin)
  global tone tempo fs gqPlot gqPlayer;
    %f=[1 2 3 3 5 6 6 3 2 1 1 6 5 5 5 6 5 5 3 2 1 6 1 3 2 1 3 2 1 2 3 3 5 6 6 3 2 1 1 2 1 5 5 3 7 1 1 2 3 2 1 1 ];
    %time=1/16*[2 2 4 2 2 4 2 2 2 2 2 2 4 2 2 2 2 2 2 2 2 2 2 2 2 2 2 4 2 2 4 2 2 4 2 2 2 2 2 2 8 4 2 2 2 2 2 2 8 16 ];
    %j=[2 2 2 2 2 2 2 3 3 3 3 2 2 2 2 2 2 2 2 2 2 1 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 2 2 2 2 3 2 2 2 2 2 2 2 ];
    
    f=[3 6 1 1 3 6 1 7 6 7 6 5 2 8 0 2 2 2 6 2 3 5 3 7 7 5 2 3 0 3 6 1 1 3 6 1 3 2 3 2 1 1 2 0 3 0 3 2 1 2 2 1 7 5 5 3 5 5 6 6];
   time=1/16*[2 2 2 2 2 2 4 2 1 1 2 2 2 4 2 2 2 2 2 2 4 2 2 2 2 2 4 2 2 2 2 2 2 2 4 2 1 1 2 2 2 4 2 2 2 1 2 2 2 1 2 2 2 1 1 2 1 1 4];
   j=[2 2 3 3 2 2 3 2 2 2 2 2 2 2 2 2 2 2 1 2 2 2 2 2 2 2 2 2 2 2 2 3 3 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 2 2 2 2 2 2 2];
   
    if(length(varargin) == 1)
        tempo = varargin{1};
        disp('默认乐谱');
    elseif(length(varargin) == 3)
        f = varargin{1};
        time = varargin{2};
        j = varargin{3};
    end
%     elseif(length(varargin) == 3)
%         f = varargin{1};
%         time = varargin{2};
%         j = varargin{3};
%     else
%         disp('未知情况');
%     end
%     tempo=84;%节拍
    jidiao=[0 2 4 5 7 9 11];
    f0=261.3*power(2,jidiao(tone)/12);
    fu=zeros(12,3);
    fu0 = 0;
    for i=1:12
         fu(i,1)=f0*power(2,(i-1)/12);
        for k=2:3
            fu(i,k)=2*fu(i,k-1);
        end
    end

    %a1=[210.6 163.2 100.6 144.8 137 49.88 51.67 27.23 9.2 5]/210.6;
    a1=[75.6 55.5 44.5 41.7 11.3 28.3 66.9 4.83 1.978 21.13 14.99 ]/75.6;
    a2=[119.2 274.6 73.17 87.02 60.23 33.93 32.7 21.35 9.312 9.6]/119.2;
    a3=[223.5 108.7 31.54 34.07 24.06 50.86 8.53 20.76 0 12.22]/223.5;
    a4=[288.5 153.9 29.16 30.56 29.78 37 9.7 21.1 0 9.44]/288.5;
    a5=[220.2 134.5 24 33.36 24.62 31.76 7.066 13.1 0 0]/220.2;
    a6=[442 108.5 90.53 19.26 35.08 24.34 20.02 5 0 0]/442;
    a7=[301.8 135.7 74.81 13.58 42.31 21.41 18.5 0 0 0 ]/301.8;
    b1=[68.6 95.13 90.53 82.77 17.36 64.26 61.26 6.739 31.8 60.59 16.64 22.41 8.541 10.69 27.42 4 7.362 4 6 7]/68.6;
    b2=[82.92 125.6 179.9 233.6 133.9 12.06 35.98 29.89 26.8 34 7.14 9.88 11.11 0 21.69 8.13 0]/82.92;
    b3=[122.9 172.6 129.7 107.8 102 13.81 37.04 42.57 30.85 30.86 10.31 11.18 10.3 4 16.72 9.848 0]/122.9;
    b4=[179.1 232.5 157.7 162.6 149.8 9.764 40.16 37.16 28.5 20.33 9.896 12.84 12.77 0 15.06 6.5 0]/179.1;
    b5=[216.2 175.1 206.9 110.9 101.3 9.807 30.95 44.31 23 24.11 6.4 20 7.72 0 14.89 6.32 0]/216.2;
    b6=[173.4 238.3 88.07 98.93 103.4 45.24 51.98 23.33 12.55 10.57 ]/173.4;
    b7=[222.6 105.2 98.61 83.06 46.3 43.82 29.04 19.47 11.51 0 0 9]/222.6;
    c1=[350.5 88.7 65.07 18.56 34.8 16.28 16.68]/350.5;
    c2=[141.6 161.6 85.12 8.251 6.9 11.69]/141.6;
    c3=[67.58 134.5 109.4 5.273 7.74]/67.58;
    c4=[126.9 118.6 89.89 6.23 5.88]/126.9;
    c5=[338.7 28.87 23.15 5.46]/338.7;
    c6=[233 24.32 19.55 8]/233;
    c7=[217.7 25.41 19.21]/217.7;
    b11=[118.8 87.64 113.2 101.7 15.89 87.39 46.09 5.5 50.81 42.68 14.39 22.15 8.613 8.939 33.39 9.065 6.856]/118.8;
    b21=[108.5 246.4 133.5 142.6 123.8 11.4 31.98 49.93 39.48 25.16 10.94 15.36 11.5 0 19.49]/108.5;
    b41=[128.7 183.5 106.5 101.1 93.76 10.84 37.53 42.96 38.38 21.35 11.3 10.61 10.97 0 15.5]/128.7;
    b51=[272.2 283.4 136.4 176.5 72.2 54.95 46.13 24.65 10.82 14.7]/272.2;
    b61=[305.3 198.6 154.5 112 83.87 41.04 40.66 25.03 13.06 10.69]/305.3;
    a11=[216.4 189.7 142.9 94.08 88.2 32.87 39.89 21.37 8.174]/216.4;
    a21=[320 153.3 31.18 26.03 24.61 46.51 12.54 24.8]/320;
    a41=[236.7 124.5 27.7 33.86 29.33 32.04 10.4 14.02]/236.7;
    a51=[361.4 160.2 91.52 13 58.02 22.05 24.59]/361.4;
    a61=[300 138.4 82.78 18.44 29.35 25.44 21.86]/300;
    c11=[87.63 186.3 87.69 12.46 8.59 10.95 6.797]/87.63;
    c21=[156.9 110 104 6.853 7.749 12.45]/156.9;
    c41=[329.4 35.55 20.74 10.54]/329.4;
    c51=[420.2 24.11 23.07]/420.2;
    c61=[254.5 25.74 15.79]/254.5;
    N=length(time);
    east=zeros(1,N);

    %C调：
    wav=0;
    for n=1:N
        t=0:1/fs:240/tempo*time(n);
        ss=0;
        x=tempo/240/time(n)*t;
       b=0.04924/0.0515*x.*(x<=0.0515)+((0.02353-0.04924)*(x-0.0515)/(0.1496-0.0515)+0.04924).*(0.0515<x&x<=0.1496)+0.02353*(x>0.1496&x<0.2044)+((0.01556-0.02353)*(x-0.2044)/(0.2379-0.2044)+0.02353).*(x>0.2044&x<0.2379)+0.01556*(x>0.2379&x<0.4115)+0.01556*exp(-3*(x-0.4115)).*(x>0.4115);
    %包络
         switch(f(n))     

                 case 1
                        if j(n)==2
                        for k=1:length(a1)
                            ss=ss+a1(k).*sin(2*pi*k*fu(1,j(n))*t);
                        end
                        end
                        if j(n)==1
                          for k=1:length(b1)
                            ss=ss+b1(k).*sin(2*pi*k*fu(1,j(n))*t);
                          end
                        end
                         if j(n)==3
                          for k=1:length(c1)
                            ss=ss+c1(k).*sin(2*pi*k*fu(1,j(n))*t);
                          end
                        end

                    east=ss.*b;
                 case '1#'
                        if j(n)==2
                        for k=1:length(a11)
                            ss=ss+a11(k).*sin(2*pi*k*fu(1,j(n))*t);
                        end
                        end
                        if j(n)==1
                          for k=1:length(b11)
                            ss=ss+b11(k).*sin(2*pi*k*fu(1,j(n))*t);
                          end
                        end
                         if j(n)==3
                          for k=1:length(c11)
                            ss=ss+c11(k).*sin(2*pi*k*fu(1,j(n))*t);
                          end
                        end

                    east=ss.*b;
            case 2

                        if j(n)==2
                        for k=1:length(a2)
                            ss=ss+a2(k).*sin(2*pi*k*fu(3,j(n))*t);
                        end
                        end
                        if j(n)==1
                          for k=1:length(b2)
                            ss=ss+b2(k).*sin(2*pi*k*fu(3,j(n))*t);
                          end
                        end
                       if j(n)==3
                          for k=1:length(c2)
                            ss=ss+c2(k).*sin(2*pi*k*fu(3,j(n))*t);
                          end
                        end
                    east=ss.*b;

            case '2#'
                        if j(n)==2
                        for k=1:length(a21)
                            ss=ss+a21(k).*sin(2*pi*k*fu(1,j(n))*t);
                        end
                        end
                        if j(n)==1
                          for k=1:length(b21)
                            ss=ss+b21(k).*sin(2*pi*k*fu(1,j(n))*t);
                          end
                        end
                         if j(n)==3
                          for k=1:length(c21)
                            ss=ss+c21(k).*sin(2*pi*k*fu(1,j(n))*t);
                          end
                        end

                    east=ss.*b;
            case 3

                        if j(n)==2
                        for k=1:length(a3)
                            ss=ss+a3(k).*sin(2*pi*k*fu(5,j(n))*t);
                        end
                        end
                        if j(n)==1
                          for k=1:length(b3)
                            ss=ss+b3(k).*sin(2*pi*k*fu(5,j(n))*t);
                          end
                        end
                        if j(n)==3
                          for k=1:length(c3)
                            ss=ss+c3(k).*sin(2*pi*k*fu(5,j(n))*t);
                          end
                        end
                    east=ss.*b;


            case 4
                        if j(n)==2
                        for k=1:length(a4)
                            ss=ss+a4(k).*sin(2*pi*k*fu(6,j(n))*t);
                        end
                        end
                        if j(n)==1
                          for k=1:length(b4)
                            ss=ss+b4(k).*sin(2*pi*k*fu(6,j(n))*t);
                          end
                        end
                     if j(n)==3
                          for k=1:length(c4)
                            ss=ss+c4(k).*sin(2*pi*k*fu(6,j(n))*t);
                          end
                        end
                    east=ss.*b;
               case '4#'
                        if j(n)==2
                        for k=1:length(a41)
                            ss=ss+a41(k).*sin(2*pi*k*fu(1,j(n))*t);
                        end
                        end
                        if j(n)==1
                          for k=1:length(b41)
                            ss=ss+b41(k).*sin(2*pi*k*fu(1,j(n))*t);
                          end
                        end
                         if j(n)==3
                          for k=1:length(c41)
                            ss=ss+c41(k).*sin(2*pi*k*fu(1,j(n))*t);
                          end
                        end

                    east=ss.*b;
            case 5
                        if j(n)==2
                        for k=1:length(a5)
                            ss=ss+a5(k).*sin(2*pi*k*fu(8,j(n))*t);
                        end
                        end
                        if j(n)==1
                          for k=1:length(b5)
                            ss=ss+b5(k).*sin(2*pi*k*fu(8,j(n))*t);
                          end
                        end
                          if j(n)==3
                          for k=1:length(c5)
                            ss=ss+c5(k).*sin(2*pi*k*fu(8,j(n))*t);
                          end
                        end
                    east=ss.*b;
                case '5#'
                        if j(n)==2
                        for k=1:length(a51)
                            ss=ss+a51(k).*sin(2*pi*k*fu(1,j(n))*t);
                        end
                        end
                        if j(n)==1
                          for k=1:length(b51)
                            ss=ss+b51(k).*sin(2*pi*k*fu(1,j(n))*t);
                          end
                        end
                         if j(n)==3
                          for k=1:length(c51)
                            ss=ss+c51(k).*sin(2*pi*k*fu(1,j(n))*t);
                          end
                        end

                    east=ss.*b;
            case 6
                        if j(n)==2
                        for k=1:length(a6)
                            ss=ss+a6(k).*sin(2*pi*k*fu(10,j(n))*t);
                        end
                        end
                        if j(n)==1
                          for k=1:length(b6)
                            ss=ss+b6(k).*sin(2*pi*k*fu(10,j(n))*t);
                          end
                        end
                 if j(n)==3
                          for k=1:length(c6)
                            ss=ss+c6(k).*sin(2*pi*k*fu(10,j(n))*t);
                          end
                        end
                    east=ss.*b;
                 case '6#' 
                        if j(n)==2
                        for k=1:length(a61)
                            ss=ss+a61(k).*sin(2*pi*k*fu(1,j(n))*t);
                        end
                        end
                        if j(n)==1
                          for k=1:length(b61)
                            ss=ss+b61(k).*sin(2*pi*k*fu(1,j(n))*t);
                          end
                        end
                         if j(n)==3
                          for k=1:length(c61)
                            ss=ss+c61(k).*sin(2*pi*k*fu(1,j(n))*t);
                          end
                        end

                    east=ss.*b;
            case 7
                        if j(n)==2
                        for k=1:length(a7)
                            ss=ss+a7(k).*sin(2*pi*k*fu(12,j(n))*t);
                        end
                        end
                        if j(n)==1
                          for k=1:length(b7)
                            ss=ss+b7(k).*sin(2*pi*k*fu(12,j(n))*t);
                          end
                        end
                 if j(n)==3
                          for k=1:length(c7)
                            ss=ss+c7(k).*sin(2*pi*k*fu(12,j(n))*t);
                          end
                        end
                    east=ss.*b;


            case 0
                  east=sin(2*pi*fu0*t).*abs(hilbert(sin(2*pi*fu0*t)));
         end
        wav=[wav east];
    end
    gqPlot = wav;
    %gqPlayer = audioplayer(gqPlot,fs);
    disp('钢琴乐谱初始化成功');
    sound(wav,fs);
end
function bassoon()
    II=imread('back2.jpg');
    image(II)
% 提取的Bassoon双簧管音调信息弹奏音乐
 global tone tempo fs BSPlot BSPlayer;
A=[174.61 196 220 246.94 261.62 293.66 329.63 349.23 392 440 493.88 523.25 587.33 659.25 698.45 739.99 783.99]; 
% 定义各调频率 
fs=8000; 
%修改频率

     notation=[ 6 6 6 1 6 5 5 3 1  4 4 4 5  1 2 3 3 3  1 1 2 7 5 5 3 5 5  1 1 2 3 2 1 7 1 1  1 6 1 1 6 6 5 5 3 5 5  4 4 4 5 5 1 2 3 5 3 3  6 1 6 7 7 5 5 5 5 5 5 3  1 1 2 3 2 1 7 1 1];
last_time=1/16*[ 2 2 2 4 2 2 2 2 2  2 2 2 4  2 2 4 2 4  4 2 4 4 2 2 2 2 8  1 1 2 2 2 2 2 2 8  2 2 2 2 4 2 2 2 2 2 4  2 2 2 4 2 2 2 2 2 2 4  2 2 2 2 4 2 2 2 2 2 4 8  1 1 2 2 2 2 2 2 16];
            j=[ 2 2 2 3 2 2 2 2 3  2 2 2 2  2 2 2 2 2  3 3 3 2 2 2 2 2 2  3 3 3 3 3 3 2 3 3  2 2 2 2 2 2 2 2 2 2 2  2 2 2 2 2 2 2 2 2 2 2  1 2 1 1 1 1 2 2 2 2 2 2  2 2 2 2 2 2 1 2 2];
%在此处输入音谱
%notation =[1 1 1 3 5 5 5 5 6 6 6 8 5 4 4 6 6 3 3 3 3 2 2 2 2 5 5 1 1 1 3 5 5 5 5 6 6 6 8 5 4 4 4 6 3 3 3 3 3 2 2 2 3 1 ];

p=0.5;

%last_time=[p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p p p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p/2 p ]; 
%在notation 中只需输入乐谱数字，在下面B=A-什么什么那部分调整音调，省去了写频率的麻烦
%各乐音持续时间

h=[1 0.307149 0 0.057298 0.075386 0 0;...

1 0.307149 0 0.057298602 0.075386 0 0;...


1 0.205838 0.157080 0 0.088917 0 0.065977;...

1 0.108616 0.069072 0 0 0 0;...

1 0.275786 0.175812 0 0.056035 0 0;...

1 0.275786 0.175812 0 0.056035 0 0;...

1 0.520305 0 0 0.052802 0.095940 0;...

1 0.108616 0.069072 0 0 0 0]; 
%波形幅值矩阵

N=length(notation);

f=zeros(1,N);

B=A-4;

for i=1:N
    f(i)=B(notation(i)); 
    %f为各个乐音对应的频率，修改其它调
end

point=fs*last_time; %各个乐音的抽样点数

total_point=sum(point); %这段音乐的总抽样点数

store=zeros(1,total_point); %用store向量来储存抽样点

m=1;

for num=1:N %利用循环产生抽样数据，num表示乐音编号 
    t=1/fs:1/fs:point(num)/fs; %产生第num个乐音的抽样点
    baoluo=zeros(1,point(num)); %包络
    for j=1:point(num)
        if (j<0.2*point(num))
            y=7.5*j/point(num);
        else
            if(j<0.333*point(num))
            y=-15/4*j/point(num)+9/4;
            else
                if (j<0.666*point(num))
                    y=1;
                else
                    y=-3*j/point(num)+3;
                end
            end
        end
        baoluo(j)=y;
    end
    xiebo=zeros(1,length(t));
    for ix=1:7
        xiebo=xiebo+h(notation(num),ix)*sin(2*ix*pi*f(num)*t); %加谐波 
    end
    store(m:m+point(num)-1)=xiebo.*baoluo(1:point(num)); %储存抽样点对应的幅值
    m=m+point(num);
end
    sound(store,5000); %播放出store
    disp('Bassoon乐谱初始化成功');
end
