function rettone=mscale(tonename,timlen,SampleRate,Tempo,typ)
%������������
%������ tonename
%ʱ�䳤�� timlen �ķ�����=1���˷�����=0.5����������=2
%������ SampleRate
%�������� ������/ÿ���� Tempo �ķ�����Ϊһ��
%�������� typ={'��Ƶ��','С����','����','����','����˹','����'}
%���� Harmonic���� Hһά���� �����±�Ϊ����г��������Ϊ��г��ǿ��
%ʱ����磺����ǿ�ȱ仯��ʱ����
fs=SampleRate;
t=0:(1/(SampleRate-1)):(60/Tempo)*timlen;
slen=SampleRate*timlen*60/Tempo;


if(tonename==9999) rettone=t*0;  return;  end  

ATone=220;
MTone=2*pi*ATone*2.^(tonename/12);

switch typ
    case 2        
        guitar0=audioread('С��������.wav');       
    case 4
        guitar0=audioread('piano.wav');
    case 1
         guitar0=audioread('guitar.wav');
    case 3
         guitar0=audioread('����˹����.wav');
    case 5
        guitar0=audioread('ͭ��������.wav');
    case 6
        guitar0=audioread('��������.wav');
end
        guitar=guitar0(1:fs);
        Fguitar=abs(fft(guitar));
        % y=reshape(guitar,50,882);
        y=reshape(guitar,441,100);
        y=max(y);y(101)=0;
        x=0:1/100:1;
        pp=csape(x,y,'second');   
        X=0:1/(fs-1):(60/Tempo)*timlen; 
        Y=ppval(pp,X); 
        if length(Y)>fs
        Y(fs/2:length(Y))=Y(fs/2).*exp(-log(2)*t(fs/2:length(Y)))+0.003;
        end
        yexpand=Y;
        rettone=0;
        
        if typ=='����˹'
            rettone=yexpand.*sin(MTone.*t)+0.5*yexpand.*sin(MTone.*t*2)+0.2*yexpand.*sin(MTone.*t*3)+0.1*yexpand.*sin(MTone.*t*4);
            rettone=100*rettone;
%              rettone=216*yexpand.*sin(MTone.*t)+376*yexpand.*sin(MTone.*t*2)+246*yexpand.*sin(MTone.*t*3)+280*yexpand.*sin(MTone.*t*4)+241*yexpand.*sin(MTone.*t*5);
%              rettone=100*yexpand.*sin(MTone.*t)+50*yexpand.*sin(MTone.*t*2)+20*yexpand.*sin(MTone.*t*3)+10*yexpand.*sin(MTone.*t*4);
        else%��������
        for i=1:15
                if Fguitar(i*262)>0.001
                    rettone=rettone+1/30*Fguitar(i*262)*yexpand.*sin(MTone*i*t);
%                     rettone=rettone+1/30*Fguitar(i*262)*sin(MTone*i*t);
                end
        end
        end