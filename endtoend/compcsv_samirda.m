savingFile = 'C:\Users\rajde\OneDrive\Documents\clg\form dataset\char_num_samir_da_printed.csv';
savingFile2 = 'C:\Users\rajde\OneDrive\Documents\clg\form dataset\char_num_samir_da_handwritten.csv';
for page=2:100
    if page==4||page==24||page==66
        page=page+1;
        continue;
    end
    page
    if page<10 
       in_file = fullfile('C:\Users\rajde\OneDrive\Documents\clg\form dataset\DATA',[ num2str(page) '.bmp']);
    elseif page>=10 && page<100
       in_file = fullfile('C:\Users\rajde\OneDrive\Documents\clg\form dataset\DATA',[ num2str(page) '.bmp']); 
    else
       in_file = fullfile('C:\Users\rajde\OneDrive\Documents\clg\form dataset\DATA',[ num2str(page) '.bmp']);  
    end
    img = imread(in_file);
    if page<10 
       in_gt_file = fullfile('C:\Users\rajde\OneDrive\Documents\clg\form dataset\GT',[ num2str(page) '.png']);
    elseif page>=10 && page<100
       in_gt_file = fullfile('C:\Users\rajde\OneDrive\Documents\clg\form dataset\GT',[ num2str(page) '.png']); 
    else
       in_gt_file = fullfile('C:\Users\rajde\OneDrive\Documents\clg\form dataset\GT',[ num2str(page) '.png']);  
    end
    img_gt = imread(in_gt_file);%this is the ground truth
    img8=im2bw(img);
img4=rgb2gray(img);
bw=joiningdashes(img);
[r,c3]=size(bw);
%figure;imshow(bw);
im=bwlabel(~bw);
stats=regionprops(~bw,'BoundingBox','Area','Solidity');
[n,c]=size(stats);
ar=0;
count=0;
for i=1:n
    if stats(i).Area>6
                count=count+1;
                
        a=ceil(stats(i).BoundingBox(1));
        b=ceil(stats(i).BoundingBox(2));
        c=ceil(stats(i).BoundingBox(3));
        d=ceil(stats(i).BoundingBox(4));
        z=zeros(d,c);
        ar=c/d;
        test_gray_cc=ones(d,c);
        test_gray_cc=test_gray_cc*255;
        test_gray_cc=uint8(test_gray_cc);
         hwc=0;
         pc=0;
           non_text = 0;
           hwn=0;
           pn=0;
           dp=0;
           for j=b:b+d-1
            for k=a:a+c-1
                test_gray_cc(j-b+1,k-a+1)=img4(j,k);
                if im(j,k)==i
                    z(j-b+1,k-a+1)=0;
                    dp=dp+1;
                    if (img_gt(j,k,1)==237 && img_gt(j,k,2)==28 && img_gt(j,k,3)==36 ) 
                          pc=pc+1;
                    elseif (img_gt(j,k,1)==255 && img_gt(j,k,2)==242 && img_gt(j,k,3)==0 )
                        pn=pn+1;
                    elseif(img_gt(j,k,1)==63 && img_gt(j,k,2)==72 && img_gt(j,k,3)==204 ) 
                          hwc = hwc + 1;
                    elseif (img_gt(j,k,1)==195 && img_gt(j,k,2)==195 && img_gt(j,k,3)==195)
                        hwn=hwn+1;
                    else
                          non_text = non_text + 1;
                      end
                else
                    z(j-b+1,k-a+1)=1;
                end
            end
           end
           density=dp/(c*d);
           cog=cg(test_gray_cc);
           cog(1)=cog(1)/c;
           cog(2)=cog(2)/d;
           attrib=test(z);
           attrib_new1=noIntersectionsAndDistFarPixelEWNSDir(z);
           attrib_new2=noIntersectionsAndDistFarPixelCornerEWNSDir(z);
           [r2,c2]=size(z);
                  img2=zeros(floor(r2/2),floor(c2/2));
                  img3=zeros(floor(r2/2),floor(c2/2));
                  for l1=1:floor(r2/2)
                      for l2=1:floor(c2/2)
                          img2(l1,l2)=z(l1,l2);
                          img3(l1,l2)=test_gray_cc(l1,l2);
                      end
                  end
                  
           output=horzcat(ar,density,cog,attrib,attrib_new1,attrib_new2);
%             if(printed>hw && printed>non_text)
%                   attrib_1 = otsu_sd_pI(test_gray_cc);
%                   attrib_3 = test_stroke(z);
%                  attrib_16 = quart(test_gray_cc);
%                   attrib_17 = sd2(test_gray_cc);
%                   attrib_18 = meanforegd(test_gray_cc);                  
%                   output = horzcat(attrib_1,attrib_3,attrib_16,attrib_17,attrib_18); 
%                   output(1,20)=1;
%                   output(1,21)=page;
%                   output(1,22)=i;
%                   dlmwrite(savingFile,output,'-append');
%             end
%            if(hw>printed && hw>non_text)   
%                attrib_1 = otsu_sd_pI(test_gray_cc);
%                   attrib_3 = test_stroke(z);
%                  attrib_16 = quart(test_gray_cc);
%                   attrib_17 = sd2(test_gray_cc);
%                   attrib_18 = meanforegd(test_gray_cc);                  
%                   output = horzcat(attrib_1,attrib_3,attrib_16,attrib_17,attrib_18); 
%                   output(1,20)=2;
%                   output(1,21)=page;
%                   output(1,22)=i;
%                   dlmwrite(savingFile,output,'-append');
                    if (pc>pn&&pc>hwn&&pc>hwc&&pc>non_text)
                        output(1,25)=1;
                        output(1,26)=page;
                        output(1,27)=i;
                        dlmwrite(savingFile,output,'-append');
                    elseif (pn>pc&&pn>hwn&&pn>hwc&&pn>non_text)
                        output(1,25)=2;
                        output(1,26)=page;
                        output(1,27)=i;
                        dlmwrite(savingFile,output,'-append');
                    elseif (hwn>hwc&&hwn>pn&&hwn>pc&&hwn>non_text)
                        output(1,25)=2;
                        output(1,26)=page;
                        output(1,27)=i;
                        dlmwrite(savingFile2,output,'-append');
                    elseif (hwc>hwn&&hwc>pc&&hwc>pn&&hwc>non_text)
                        output(1,25)=1;
                        output(1,26)=page;
                        output(1,27)=i;
                        dlmwrite(savingFile2,output,'-append');
                    end
                            
           end
    end
end
