%This function takes a round connected component as input and returns whether it is text or non-text
function [nt]=dots(bw,x,z,a,b)
 [d,c]=size(z);
 [d1,d2]=size(bw);
% count=0;
% for j=b:b-10
%     if bw(j,(a+c)/2)==0
%         count=count+1;
%     end
% end
% if count>5
%     nt=0;
% else
%     nt=1;
% end
% end
nt=0;
if x>50&&x<100&&d>7&&c>7
    count=0;
    if b-40<=0
        temp=1;
    else
        temp=b-40;
    end
for j=temp:b-1
    if a+c>d2
        temp2=d2;
    else
        temp2=a+c;
    end
    if bw(j,((temp2)))==0
        count=count+1;
    end
end

if count>3
    nt=0;
else
    nt=1;
end
elseif x>100&&x<130&&d>10&&c>10
        nt=1;
end
% for j=ceil(0.4*d):ceil(0.6*d)
%     for k=ceil(0.4*c):ceil(0.6*c)
%         if z(j,k)==0
%             nt=0;
%         end
%     end
% end
end
        