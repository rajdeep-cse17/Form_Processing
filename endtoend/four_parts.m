function [ img1, img2, img3, img4 ] = four_parts( img )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[r,c] = size(img);
x = round(r/2);
y = round(c/2);
img1 = img(1:x, 1:y);
img2 = img(1:x, y+1:c);
img3 = img(x+1:r, y+1:c);
img4 = img(x+1:r, 1:y);



end

