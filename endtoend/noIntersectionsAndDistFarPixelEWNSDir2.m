function feature=noIntersectionsAndDistFarPixelEWNSDir2(binImage)
    contourImage=boundaryExtraction(~binImage);
    binImage=contourImage;
    feature=zeros(1,8);
    [r,c]=size(binImage);
    if r~=0&&c~=0
    centroid=centroid_feature(binImage,1);
%     disp('Centrod Value');
%     disp(centroid);
    %North Direction
    count=0;
    farthestPixel=centroid(1);
    for i=centroid(1):-1:1
      if(binImage(i,centroid(2))==1)
          count=count+1;
          if(i<farthestPixel)
              farthestPixel=i;
          end
      end
    end
    feature(1)=count;
    feature(5)=centroid(1)-farthestPixel;
    %South Direction
    count=0;
    farthestPixel=centroid(1);
    for i=centroid(1):size(binImage,1)
      if(binImage(i,centroid(2))==1)
          count=count+1;
          if(i>farthestPixel)
              farthestPixel=i;
          end
      end
    end
    feature(2)=count;
    feature(6)=farthestPixel-centroid(1);
    %West Direction
    count=0;
    farthestPixel=centroid(2);
    for i=centroid(2):-1: 1
      if(binImage(centroid(1),i)==1)
          count=count+1;
          if(i<farthestPixel)
              farthestPixel=i;
          end
      end
    end
    feature(3)=count;
    feature(7)=centroid(2)-farthestPixel;
    %East Direction
    count=0;
    farthestPixel=centroid(2);
    for i=centroid(2): size(binImage,2)
      if(binImage(centroid(1),i)==1)
          count=count+1;
          if(i>farthestPixel)
              farthestPixel=i;
          end
      end
    end
    feature(4)=count;
    feature(8)=farthestPixel-centroid(2);
end