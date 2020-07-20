function feature=centroid_feature(inputImage, flag)  % 0 for feature and 1 for position
dim=size(inputImage);
centroid_c=0;
centroid_r=0;
count=0;
centroid_col=0;
centroid_row=0;
for i=1:dim(1)
    for j=1:dim(2)
        if(inputImage(i,j)==1)
            centroid_r=centroid_r+i;
            centroid_c=centroid_c+j;
            count=count+1;
        end
    end
end
if(count>0)
    centroid_row=centroid_r/count;
    centroid_col=centroid_c/count;
else
    centroid_row=1;
    centroid_col=1;
end
if(flag==0)
    feature(1)=centroid_row/dim(1);
    feature(2)=centroid_col/dim(2);
else
    feature(1)=floor(centroid_row+0.5);
    feature(2)=floor(centroid_col+0.5);
end
end