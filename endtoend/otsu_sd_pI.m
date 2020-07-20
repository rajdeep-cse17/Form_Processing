function [out_attrib] = otsu_sd_pI(gray_cc)
%here we calculate the otsu threshold of the printed and the handwritten
%...image
%-------------------------------------------------------------------------%
% now here we pass the gray scale CC image into the function
% From this image we calculate the otsu threshold, standard deviation of
% ... the pixel intensity and the entropy.
[r,c]=size(gray_cc);
if r>1&&c>1
    
    out_attrib(1,1) = sd(gray_cc);
    out_attrib(1,2) = graythresh(gray_cc);
    out_attrib(1,3) = entropy(gray_cc);
else
    out_attrib(1,1) = 0;
    out_attrib(1,2) = 0;
    out_attrib(1,3) = 0;
end