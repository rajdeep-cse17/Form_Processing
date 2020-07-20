function feature=sirFeatureCornerCentroid(binImage)
%     contourImage=boundaryExtraction(~binImage);
%     binImage=contourImage;
    feature=zeros(1,4);
    [r,c]=size(binImage);
    if r~=0&&c~=0
    centroid=centroid_feature(binImage,1);
%     disp('Centrod Value');
%     disp(centroid);
    %North East Direction
    xFarthestPixel=centroid(1);
    yFarthestPixel=centroid(2);
    for i=centroid(1):-1:1
        for j=centroid(2):size(binImage,2)
            if(i>0 && j<=size(binImage,2))
                if(binImage(i,j)==0)
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
    feature(1)=sqrt((xFarthestPixel-centroid(1))*(xFarthestPixel-centroid(1))+(yFarthestPixel-centroid(2))*(yFarthestPixel-centroid(2)))/sqrt(centroid(1)*centroid(1)+(c-centroid(2))*(c-centroid(2)));
    %South East Direction
    count=0;
    xFarthestPixel=centroid(1);
    yFarthestPixel=centroid(2);
    for i=centroid(1):size(binImage,1)
        for j=centroid(2):size(binImage,2)
            if(i<=size(binImage,1) && j<=size(binImage,2))
                if(binImage(i,j)==0)
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
    feature(2)=sqrt((xFarthestPixel-centroid(1))*(xFarthestPixel-centroid(1))+(yFarthestPixel-centroid(2))*(yFarthestPixel-centroid(2)))/sqrt((r-centroid(1))*(r-centroid(1))+(c-centroid(2))*(c-centroid(2)));
    %North West Direction
    xFarthestPixel=centroid(1);
    yFarthestPixel=centroid(2);
    for i=centroid(1):-1:1
        for j=centroid(2):-1:1
            if(i>0 && j>0)
                if(binImage(i,j)==0)
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
    feature(3)=sqrt((xFarthestPixel-centroid(1))*(xFarthestPixel-centroid(1))+(yFarthestPixel-centroid(2))*(yFarthestPixel-centroid(2)))/sqrt(centroid(1)*centroid(1)+centroid(2)*centroid(2));
    %South East Direction
    xFarthestPixel=centroid(1);
    yFarthestPixel=centroid(2);
    for i=centroid(1):size(binImage,1)
        for j=centroid(2):-1:1
            if(i<=size(binImage,1) && j>0)
                if(binImage(i,j)==0)
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
    feature(4)=sqrt((xFarthestPixel-centroid(1))*(xFarthestPixel-centroid(1))+(yFarthestPixel-centroid(2))*(yFarthestPixel-centroid(2)))/sqrt((r-centroid(1))*(r-centroid(1))+centroid(2)*centroid(2));
    end
end