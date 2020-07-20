%This function classifies a component as text or non text acc to whether it is a strikethrough
%or not
function [nt]=strikethrough(z)
nt=0;
z2=swell_filter(z,3,0.51);
            image=bwmorph(~z2,'skel',inf);

          %  imwrite(image,strcat('C:\Users\Rajdeep Bhattacharya\Documents\project\form dataset\skel\',strcat(ch,'.bmp')),'bmp');
            eul=bweuler(image,8);
            [size1,size2]=size(image);
            cnt=0;
            for i1=ceil(0.4*size1):ceil(0.8*size1)
                for i2=1:size2
                    if image(i1,i2)==1
                        cnt=cnt+1;
                    end
                end
            end
            arr=cnt/(size1*size2);
        if (eul<-9&&arr>0.035)
        nt=1;
        end
end
