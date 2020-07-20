function feature=sirfeatureNSEWgeocentre(binImage)
%     contourImage=boundaryExtraction(~binImage);
%     binImage=contourImage;
    feature=zeros(1,4);
    [r,c]=size(binImage);
%     disp('Centrod Value');
%     disp(centroid);
    %North Direction
   if r>1&&c>1
       
    farthestPixel=floor(r/2);
    for i=floor(r/2):-1:1
      if(binImage(i,floor(c/2))==0)
          if(i<farthestPixel)
              farthestPixel=i;
          end
      end
    end
    feature(1)=(floor(r/2)-farthestPixel)/floor(r/2);
    %South Direction
    farthestPixel=floor(r/2);
    for i=floor(r/2):size(binImage,1)
      if(binImage(i,floor(c/2))==0)
          if(i>farthestPixel)
              farthestPixel=i;
          end
      end
    end
    feature(2)=(farthestPixel-floor(r/2))/(size(binImage,1)-floor(r/2));
    %West Direction
    farthestPixel=floor(c/2);
    for i=floor(c/2):-1: 1
      if(binImage(floor(r/2),i)==0)
          if(i<farthestPixel)
              farthestPixel=i;
          end
      end
    end
    feature(3)=(floor(c/2)-farthestPixel)/floor(c/2);
    %East Direction
    farthestPixel=floor(c/2);
    for i=floor(c/2): size(binImage,2)
      if(binImage(floor(r/2),i)==0)
          if(i>farthestPixel)
              farthestPixel=i;
          end
      end
    end
    feature(4)=(farthestPixel-floor(c/2))/(size(binImage,2)-floor(c/2));
   end
end