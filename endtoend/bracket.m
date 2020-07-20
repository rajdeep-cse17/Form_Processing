%This function takes a connected component as input and classifies it as
%non-text or text according to whether it is a bracket or not
function [nt]=bracket(z,i)
z2=swell_filter(z,3,0.51);
image=bwmorph(~z2,'skel',inf);
arr2=test(z2);
l=line(z2);
nt=0;
array(i,1)=arr2(1);
array(i,2)=arr2(2);
array(i,3)=arr2(3);
array(i,4)=arr2(4);
array(i,5)=l;
array(i,6)=(array(i,3)+array(i,4))/2;
[d,c]=size(z2);
flag=0;
for j=1:floor(d/2)
    ct=0;
    for k=1:c
        if image(j,k)==1
            ct=ct+1;
        end 
    end
    
    if ct>5
       
        flag=1;
    end
end
if flag==0
    for j=ceil(d/2):d
    ct=0;
    for k=1:c
        if image(j,k)==1
            ct=ct+1;
        end 
    end
    
    if ct>5
        flag=1;
    end
    end
end
if array(i,5)==1&&flag==0&&(~((array(i,3)>=0.25&&array(i,3)<=0.35)||(array(i,4)>=0.25&&array(i,4)<=0.35)))
    nt=1;
end
