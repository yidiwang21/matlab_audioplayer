function retsong = combsong(songdata,SampleRate,tempo,typ)
%songdata��ά���� ��һάΪ�������� �ڶ�άΪ��Ӧ���׵�ʱ������
%������ SampleRate
%�������� ������/ÿ���� Tempo �ķ�����Ϊһ��
%�������� typ={'��Ƶ��','С����','����','����','����˹','����'}
%���غϳɵ���������

songlength=length(songdata(1,:));

retsong=mscale(songdata(1,1),songdata(2,1),SampleRate,tempo,typ);
for i=2:songlength
    retsong=[retsong mscale(songdata(1,i),songdata(2,i),SampleRate,tempo,typ)];
end
    

end

