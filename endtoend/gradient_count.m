function [ g_hist ] = gradient_count( img )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[Gmag, Gdir] = imgradient(img,'prewitt');
level = linspace(-180,180,15);
quantiseddata = discretize(Gdir, level);

g_hist = zeros(1,15);
[r,c] = size(quantiseddata);

for i=1:r
    for j=1:c
        g_hist(quantiseddata(i,j)) = g_hist(quantiseddata(i,j)) + 1;
    end
end


    

end

