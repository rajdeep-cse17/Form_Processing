function [image]=daag(image)
[r,c]=size(image);
centroid=centroid_feature(image,1);
for i=1:r
    image(i,centroid(2))=0;
end
for i=1:c
    image(centroid(1),i)=0;
end