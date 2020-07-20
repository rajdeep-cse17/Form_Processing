function [ result ] = line(img)
%It checks whether a given component is line or not 
%   result=0 : if not line
%   result=1 : if it is a line 
single_one=0;
% gry=rgb2gray(img);
% th=graythresh(gry);
% matrix=im2bw(gry,th);
matrix=~bwmorph(~img,'skel',inf);
more_one=0;
%imshow(matrix);
resultH=0;
resultV=0;
single_one2=0;
more_one2=0;
% result=0;
[height width]=size(matrix);

    %************************Horizontal***************************%
   % if(height>width)
        for i=1:height
            count=0;
            for j=1:width
                if(matrix(i,j)==0)
                    count=count+1;
                end
            end
            if(count>=2)
                more_one=more_one+1;
%               break;
            else
                single_one=single_one+1;
            end
        end
%         more_one
%         single_one
%         matrix
        if(single_one>more_one)
            resultH=1;
        else
            resultH=0;
        end 
        %resultH=1;
    %else
    %******************************End*****************************%
    %******************************Vertical************************%
    single_one2=0;
    more_one2=0;
        for i=1:width
            count2=0;
            for j=1:height
                if(matrix(j,i)==0)
                    count2=count2+1;
                end
            end
            if(count2>=2)
                more_one2=more_one2+count2;
%             break;
            else
                single_one2=single_one2+1;
            end
        end
        if(single_one2>more_one2)
            resultV=1;
        else
            resultV=0;
        end  
    %*********************************End**************************%
    
 %   end
    
     if((resultH==1)||(resultV==1))
            result=1;
     else
            result=0;
     end
% single_one
% more_one
% height
% width
end

