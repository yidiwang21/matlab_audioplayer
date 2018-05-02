function varargout = waveRead(pathList, str, n)
%�����÷���
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
info.strName = sprintf('��������%s', strName(4 : end-4));
info.time = sprintf('��ʱ����%d��%d��', min, sec);
info.sample = sprintf('�����ʣ�%5.3fkHz  %d����  ����λ����%d', Fs/1000, ...
                        nChannel, nBits);
info.iShow = 0;
info.iMusic = n;
%��������Ϣ����player�����UserData��
set(player, 'UserData', info);
if nargout == 1
    varargout{1} = player;
elseif nargout == 2
    varargout{1} = player;
    varargout{2} = strFull;
else
    error('���������������')
end