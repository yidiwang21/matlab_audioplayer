%readscore
function score=readscore(filename,tone)

sfile=fopen(filename,'r');

do=15+tone;

tmp1=fgetl(sfile);
tmp2=fgetl(sfile);
l1=tmp1;
l2=tmp2;

while length(tmp2)~=1
    tmp1=fgetl(sfile);
    tmp2=fgetl(sfile);
    l1=[l1 tmp1];
    l2=[l2 tmp2];
end
        
strlen=length(l1);
j=0;

for i=1:strlen                       
    if l1(i)==' ', continue; end
    switch l1(i)
        case {'0'}
            j=j+1;
            ll1(j)=9999;          
        case {'1'}
            j=j+1;
            ll1(j)=do+0;
        case {'2'}
            j=j+1;
            ll1(j)=do+2;
        case {'3'}
            j=j+1;
            ll1(j)=do+4;
        case {'4'}
            j=j+1;
            ll1(j)=do+5;    
        case {'5'}
            j=j+1;
            ll1(j)=do+7;
        case {'6'}
            j=j+1;
            ll1(j)=do+9;
        case {'7'}
            j=j+1;
            ll1(j)=do+11;  
        case {''''}
            ll1(j)=ll1(j)+12;   
        case {'.'}
            ll1(j)=ll1(j)-12;  
        case {'#'}
            ll1(j)=ll1(j)+1;  
        case {'b'}
            ll1(j)=ll1(j)-1; 
    end
end
   
ll2=sscanf(l2,'%f');  
 score=[ll1 ; ll2'];     
end