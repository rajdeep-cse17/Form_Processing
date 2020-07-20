function feature=sirfeatureNSEWcentroid(binImage)
%     contourImage=boundaryExtraction(~binImage);
%     binImage=contourImage;
    feature=zeros(1,4);
    [r,c]=size(binImage);
    if r~=0&&c~=0
    centroid=centroid_feature(binImage,1);
%     disp('Centrod Value');
%     disp(centroid);
    %North Direction
    farthestPixel=centroid(1);
    for i=centroid(1):-1:1
      if(binImage(i,centroid(2))==0)
          if(i<farthestPixel)
              farthestPixel=i;
          end
      end
    end
    feature(1)=(centroid(1)-farthestPixel)/centroid(1);
    %South Direction
    farthestPixel=centroid(1);
    for i=centroid(1):size(binImage,1)
      if(binImage(i,centroid(2))==0)
          if(i>farthestPixel)
              farthestPixel=i;
          end
      end
    end
    feature(2)=(farthestPixel-centroid(1))/(size(binImage,1)-centroid(1));
    %West Direction
    farthestPixel=centroid(2);
    for i=centroid(2):-1: 1
      if(binImage(centroid(1),i)==0)
          if(i<farthestPixel)
              farthestPixel=i;
          end
      end
    end
    feature(3)=(centroid(2)-farthestPixel)/centroid(2);
    %East Direction
    farthestPixel=centroid(2);
    for i=centroid(2): size(binImage,2)
      if(binImage(centroid(1),i)==0)
          if(i>farthestPixel)
              farthestPixel=i;
          end
      end
    end
    feature(4)=(farthestPixel-centroid(2))/(size(binImage,2)-centroid(2));
    end
end