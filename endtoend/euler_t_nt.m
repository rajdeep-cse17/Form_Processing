function [eul]=euler_t_nt(z)
[r,c]=size(z);
if r~=0&&c~=0
z2=swell_filter(z,3,0.51);
image=bwmorph(~z2,'skel',inf);
eul=bweuler(image,8);
else
    eul=0;
end
