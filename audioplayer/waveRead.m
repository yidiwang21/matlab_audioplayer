function varargout = waveRead(pathList, str, n)
%两种用法：
%player = waveRead(pathList, str, n);
%[player strFull] = waveRead(pathList, str, n);

if n > 1
    strTemp = deblank(str{n});
    strFull =[pathList{n} strTemp(4 : end)];
else
    strTemp = deblank(str);
    strFull =[pathList strTemp(4 : end)];
end
[data, Fs, nBits] = wavread(strFull);
player = audioplayer(data, Fs, nBits);
total = get(player, 'TotalSamples');
sampleRate = get(player, 'SampleRate');
nChannel = get(player, 'NumberOfChannels');
totalTime = floor(total/sampleRate);
min = floor(totalTime/60);
sec = rem(totalTime, 60);
strName = deblank(str{n});
info.strName = sprintf('歌曲名：%s', strName(4 : end-4));
info.time = sprintf('总时长：%d分%d秒', min, sec);
info.sample = sprintf('采样率：%5.3fkHz  %d声道  采样位数：%d', Fs/1000, ...
                        nChannel, nBits);
info.iShow = 0;
info.iMusic = n;
%将音乐信息存入player对象的UserData中
set(player, 'UserData', info);
if nargout == 1
    varargout{1} = player;
elseif nargout == 2
    varargout{1} = player;
    varargout{2} = strFull;
else
    error('输出参数个数有误')
end