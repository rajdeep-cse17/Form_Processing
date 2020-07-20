function [fi]=optilltnt(bw,img)
 %img8=im2bw(img);
 img4=rgb2gray(img);
 %imwrite(img4,strcat('C:\Users\rajde\OneDrive\Documents\clg\form dataset\',strcat('21gray','.bmp')),'bmp');
% %img3 = img;
 %bw=joiningdashes(img);
%touching separation

img8=bw;

[r,c2]=size(bw);
%figure;imshow(bw);
im=bwlabel(~bw);
stats=regionprops(~bw,'BoundingBox','Area','Solidity');
[n,c]=size(stats);
savingFile = 'C:\Users\rajde\OneDrive\Documents\clg\form dataset\hwpr.csv';
savingFile2 = 'C:\Users\rajde\OneDrive\Documents\clg\form dataset\charnum.csv';
count=0;
fi=ones(r,c2,3,'uint8');
fi=fi*255;
count=0;
for i=1:n
    if stats(i).Area>6
        i
        count=count+1;
        a=ceil(stats(i).BoundingBox(1));
        b=ceil(stats(i).BoundingBox(2));
        c=ceil(stats(i).BoundingBox(3));
        d=ceil(stats(i).BoundingBox(4));
        z=zeros(d,c);
        test_gray_cc=ones(d,c);
        test_gray_cc=test_gray_cc*255;
        test_gray_cc=uint8(test_gray_cc);
        black=0;
        for j=b:b+d-1
            for k=a:a+c-1
                test_gray_cc(j-b+1,k-a+1)=img4(j,k);
                if im(j,k)==i
                    z(j-b+1,k-a+1)=0;
                    black=black+1;
                else
                    z(j-b+1,k-a+1)=1;
                end
            end
        end
        ch=num2str(i);
        wid(i)=c;
        he(i)=d;
        hw(i)=he(i)/wid(i);
        wh(i)=wid(i)/he(i);
        if (wh(i)>50||hw(i)>50||he(i)>0.16*r||wid(i)>0.4*c2)
            tnt=2;
        else
        feattnt=getfeatures_tnt(z);
        imwrite(z,strcat('C:\Users\rajde\OneDrive\Documents\clg\form dataset\finalcomp\binary\',strcat(ch,'.bmp')),'bmp');        
        imwrite(test_gray_cc,strcat('C:\Users\rajde\OneDrive\Documents\clg\form dataset\finalcomp\gray\',strcat(ch,'.bmp')),'bmp');
        tnt=textnontextclassifier(feattnt);
        end
        if tnt==2
            for j=b:b+d-1
            for k=a:a+c-1
                if im(j,k)==i&&img8(j,k)==0
                    fi(j,k,1)=0;
                        fi(j,k,2)=255;
                        fi(j,k,3)=0;
                end
            end
            end
        else
            for j=b:b+d-1
            for k=a:a+c-1
                if im(j,k)==i&&img8(j,k)==0
                    fi(j,k,1)=0;
                        fi(j,k,2)=0;
                        fi(j,k,3)=0;
                end
            end
            end
        end
    end
end
imwrite(fi,strcat('C:\Users\rajde\OneDrive\Documents\clg\form dataset\Journal paper\',strcat('op81tilltnt','.bmp')),'bmp');