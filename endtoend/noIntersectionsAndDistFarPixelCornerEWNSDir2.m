function feature=noIntersectionsAndDistFarPixelCornerEWNSDir2(binImage)
    contourImage=boundaryExtraction(~binImage);
    binImage=contourImage;
    feature=zeros(1,8);
    [r,c]=size(binImage);
    if r~=0&&c~=0
    centroid=centroid_feature(binImage,1);
%     disp('Centrod Value');
%     disp(centroid);
    %North East Direction
    count=0;
    xFarthestPixel=centroid(1);
    yFarthestPixel=centroid(2);
    for i=centroid(1):-1:1
        for j=centroid(2):size(binImage,2)
            if(i>0 && j<=size(binImage,2))
                if(binImage(i,j)==1)
                    count=count+1;
                    if(i<xFarthestPixel)
                        xFarthestPixel=i;
                    end
                    if(j>yFarthestPixel)
                        yFarthestPixel=j;
                    end
                end
            end
        end
    end
    feature(1)=count;
    feature(5)=sqrt((xFarthestPixel-centroid(1))*(xFarthestPixel-centroid(1))+(yFarthestPixel-centroid(2))*(yFarthestPixel-centroid(2)));
    %South East Direction
    count=0;
    xFarthestPixel=centroid(1);
    yFarthestPixel=centroid(2);
    for i=centroid(1):size(binImage,1)
        for j=centroid(2):size(binImage,2)
            if(i<=size(binImage,1) && j<=size(binImage,2))
                if(binImage(i,j)==1)
                    count=count+1;
                    if(i>xFarthestPixel)
                        xFarthestPixel=i;
                    end
                    if(j>yFarthestPixel)
                        yFarthestPixel=j;
                    end
                end
            end
        end
    end
    feature(2)=count;
    feature(6)=sqrt((xFarthestPixel-centroid(1))*(xFarthestPixel-centroid(1))+(yFarthestPixel-centroid(2))*(yFarthestPixel-centroid(2)));
    %North West Direction
   count=0;
    xFarthestPixel=centroid(1);
    yFarthestPixel=centroid(2);
    for i=centroid(1):-1:1
        for j=centroid(2):-1:1
            if(i>0 && j>0)
                if(binImage(i,j)==1)
                    count=count+1;
                    if(i<xFarthestPixel)
                        xFarthestPixel=i;
                    end
                    if(j<yFarthestPixel)
                        yFarthestPixel=j;
                    end
                end
            end
        end
    end
    feature(3)=count;
    feature(7)=sqrt((xFarthestPixel-centroid(1))*(xFarthestPixel-centroid(1))+(yFarthestPixel-centroid(2))*(yFarthestPixel-centroid(2)));
    %South East Direction
    count=0;
    xFarthestPixel=centroid(1);
    yFarthestPixel=centroid(2);
    for i=centroid(1):size(binImage,1)
        for j=centroid(2):-1:1
            if(i<=size(binImage,1) && j>0)
                if(binImage(i,j)==1)
                    count=count+1;
                    if(i>xFarthestPixel)
                        xFarthestPixel=i;
                    end
                    if(j<yFarthestPixel)
                        yFarthestPixel=j;
                    end
                end
            end
        end
    end
    feature(4)=count;
    feature(8)=sqrt((xFarthestPixel-centroid(1))*(xFarthestPixel-centroid(1))+(yFarthestPixel-centroid(2))*(yFarthestPixel-centroid(2)));
end