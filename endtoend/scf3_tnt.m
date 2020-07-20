function feature=scf3_tnt(binImage)
    contourImage=boundaryExtraction(~binImage);
    binImage=contourImage;
    feature=zeros(1,4);
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
end