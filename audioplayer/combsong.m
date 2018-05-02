function retsong = combsong(songdata,SampleRate,tempo,typ)
%songdata两维数据 第一维为音阶序列 第二维为对应音阶的时间序列
%采样率 SampleRate
%放音速率 节拍数/每分钟 Tempo 四分音符为一拍
%演奏类型 typ={'单频率','小提琴','钢琴','吉他','萨克斯','弦乐'}
%返回合成的音乐序列

songlength=length(songdata(1,:));

retsong=mscale(songdata(1,1),songdata(2,1),SampleRate,tempo,typ);
for i=2:songlength
    retsong=[retsong mscale(songdata(1,i),songdata(2,i),SampleRate,tempo,typ)];
end
    

end

