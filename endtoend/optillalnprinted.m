function [fi]=end2end(bw,img)
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
            feathwpr=getfeatures_hwpr(z,test_gray_cc);                  
            hwpr=hwprclassifier(feathwpr);
            featchnum=getfeatures_alphanum(z,test_gray_cc);
            an=0;
            if hwpr==1
                an=alphanumclassifier_printed(featchnum);
            end
            for j=b:b+d-1
                        for k=a:a+c-1
                            if im(j,k)==i&&img8(j,k)==0
                                if hwpr==1&&an==1
                                    fi(j,k,1)=237;
                                     fi(j,k,2)=28;
                                    fi(j,k,3)=36;
                                elseif hwpr==1&&an==2
                                    fi(j,k,1)=255;
                                     fi(j,k,2)=242;
                                    fi(j,k,3)=0;
                                elseif hwpr==2
                                    fi(j,k,1)=63;
                                     fi(j,k,2)=72;
                                    fi(j,k,3)=204;
                                end
                            end
                        end
            end
%                     [r2,c2]=size(z);
%                   img2=zeros(floor(r2/2),floor(c2/2));
%                   img3=zeros(floor(r2/2),floor(c2/2));
%                   for l1=1:floor(r2/2)
%                       for l2=1:floor(c2/2)
%                           img2(l1,l2)=z(l1,l2);
%                           img3(l1,l2)=test_gray_cc(l1,l2);
%                       end
%                   end
%                     attrib_4=otsu_sd_pI(img3);
%                   attrib_5=test(img2);
%                   attrib_6=test_stroke(img2);
%                   img2=zeros(r2-floor(r2/2),floor(c2/2));
%                   img3=zeros(r2-floor(r2/2),floor(c2/2));
%                   for l1=r2-floor(r2/2):r2
%                       for l2=1:c2/2
%                           img2(l1,l2)=z(l1,l2);
%                           img3(l1,l2)=test_gray_cc(l1,l2);
%                       end
%                   end
%                   attrib_7=otsu_sd_pI(img3);
%                   attrib_8=test(img2);
%                   attrib_9=test_stroke(img2);
%                   img2=zeros(floor(r2/2),c2-floor(c2/2));
%                   img3=zeros(floor(r2/2),c2-floor(c2/2));
%                   for l1=1:floor(r2/2)
%                       for l2=c2-floor(c2/2):c2
%                           img2(l1,l2)=z(l1,l2);
%                           img3(l1,l2)=test_gray_cc(l1,l2);
%                       end
%                   end
%                   attrib_10=otsu_sd_pI(img3);
%                   attrib_11=test(img2);
%                   attrib_12=test_stroke(img2);
%                   img2=zeros(r2-floor(r2/2),c2-floor(c2/2));
%                   img3=zeros(r2-floor(r2/2),c2-floor(c2/2));
%                   for l1=r2-floor(r2/2):r2
%                       for l2=c2-floor(c2/2):c2
%                           img2(l1,l2)=z(l1,l2);
%                           img3(l1,l2)=test_gray_cc(l1,l2);
%                       end
%                   end
%                   
%                   attrib_13=otsu_sd_pI(img3);
%                   attrib_14=test(img2);
%                   attrib_15=test_stroke(img2);
%                   output2 = local_hist_grad(test_gray_cc);
%                   output = horzcat(attrib_1,attrib_2,attrib_3,attrib_4,attrib_5,attrib_6,attrib_7,attrib_8,attrib_9,attrib_10,attrib_11,attrib_12,attrib_13,attrib_14,attrib_15,output2);
%                   lb=(cccharnum_rand_forest_2(output));
%                   dlmwrite(savingFile2,output, '-append');
%                      for j=b:b+d-1
%                         for k=a:a+c-1
%                             if im(j,k)==i&&img8(j,k)==0
%                                 if la==1
%                                     %'c'
%                                     fi(j,k,1)=255;
%                                      fi(j,k,2)=0;
%                                     fi(j,k,3)=0;
% %                                 elseif la==1&&lb==2
% %                                     %'d'
% %                                     fi(j,k,1)=255;
% %                                      fi(j,k,2)=255;
% %                                     fi(j,k,3)=0;
%                                 elseif la==2
%                                     fi(j,k,1)=0;
%                                      fi(j,k,2)=0;
%                                     fi(j,k,3)=255;
% %                                 else
% %                                     fi(j,k,1)=128;
% %                                      fi(j,k,2)=128;
% %                                     fi(j,k,3)=128;
%                                 end
%                             end 
%                         end
%                      end
        end
    end
end
imwrite(fi,strcat('C:\Users\rajde\OneDrive\Documents\clg\form dataset\Journal paper\',strcat('op72tillanpr','.bmp')),'bmp');
