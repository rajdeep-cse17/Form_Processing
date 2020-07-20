function [feat]=localmaximahist(test_gray_cc)
[counts,binLocations]=imhist(test_gray_cc);
local=0;
[ht,wid]=size(test_gray_cc);
flag1=0;
lowest=-1;
highest=-1;
for i=1:size(binLocations)
    if i==1
        if counts(i)>counts(i+1)
        local=local+1;
        end
    elseif i==256
        if counts(i)>counts(i-1)
        local=local+1;
        end
    elseif counts(i-1)<counts(i)&&counts(i+1)<counts(i)
        local=local+1;
    end
    if flag1==0&&counts(i)>0
        lowest=i;
        flag1=1;
    end
    if counts(i)>0
        highest=i;
    end
end
r=floor((highest-lowest)/4);
lowerqtr=0;
higherqtr=0;
for i=lowest:lowest+r
    lowerqtr=lowerqtr+counts(i);
end
for i=highest-r:highest
    higherqtr=higherqtr+counts(i);
end
perclower=lowerqtr/(ht*wid)*100;
perchigher=higherqtr/(ht*wid)*100;
feat=horzcat(local,perchigher,perclower);