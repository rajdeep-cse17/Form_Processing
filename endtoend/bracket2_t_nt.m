%This function takes a connected component as input and classifies it as
%non-text or text according to whether it is a bracket or not
function [ct]=bracket2_t_nt(z)
z2=swell_filter(z,3,0.51);
image=bwmorph(~z2,'skel',inf);
[d,c]=size(z2);
ct=0;
for j=1:d
    for k=1:c-1
        if (image(j,k)==1&&image(j,k+1)==0)||(image(j,k)==0&&image(j,k+1)==1)
            ct=ct+1;
        end 
    end
end
ct=ct/d;
end
