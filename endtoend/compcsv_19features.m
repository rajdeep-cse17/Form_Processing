savingFile = 'C:\Users\rajde\OneDrive\Documents\clg\form dataset\hw_pr_notincludinglvp_19_features_final.csv';
for page=17:70
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
count=0;
for i=1:n
    if stats(i).Area>6
                count=count+1;
                
        a=ceil(stats(i).BoundingBox(1));
        b=ceil(stats(i).BoundingBox(2));
        c=ceil(stats(i).BoundingBox(3));
        d=ceil(stats(i).BoundingBox(4));
        z=zeros(d,c);
        test_gray_cc=ones(d,c);
        test_gray_cc=test_gray_cc*255;
        test_gray_cc=uint8(test_gray_cc);
         hw = 0; 
           printed = 0;
           non_text = 0;
           alpha=0;
           num=0;
           for j=b:b+d-1
            for k=a:a+c-1
                test_gray_cc(j-b+1,k-a+1)=img4(j,k);
                if im(j,k)==i
                    z(j-b+1,k-a+1)=0;
                    if((img_gt(j,k,1)==237 && img_gt(j,k,2)==28 && img_gt(j,k,3)==36 )|| (img_gt(j,k,1)==255 && img_gt(j,k,2)==242 && img_gt(j,k,3)==0 ))
                          printed = printed + 1;
                    elseif((img_gt(j,k,1)==63 && img_gt(j,k,2)==72 && img_gt(j,k,3)==204 )|| (img_gt(j,k,1)==195 && img_gt(j,k,2)==195 && img_gt(j,k,3)==195))
                          hw = hw + 1;
                    else
                          non_text = non_text + 1;
                      end
                else
                    z(j-b+1,k-a+1)=1;
                end
            end
           end
            if(printed>hw && printed>non_text)
                  attrib_1 = otsu_sd_pI(test_gray_cc);
                  attrib_3 = test_stroke(z);
                 attrib_16 = quart(test_gray_cc);
                  attrib_17 = sd2(test_gray_cc);
                  attrib_18 = meanforegd(test_gray_cc);                  
                  output = horzcat(attrib_1,attrib_3,attrib_16,attrib_17,attrib_18); 
                  output(1,20)=1;
                  output(1,21)=page;
                  output(1,22)=i;
                  dlmwrite(savingFile,output,'-append');
            end
           if(hw>printed && hw>non_text)   
               attrib_1 = otsu_sd_pI(test_gray_cc);
                  attrib_3 = test_stroke(z);
                 attrib_16 = quart(test_gray_cc);
                  attrib_17 = sd2(test_gray_cc);
                  attrib_18 = meanforegd(test_gray_cc);                  
                  output = horzcat(attrib_1,attrib_3,attrib_16,attrib_17,attrib_18); 
                  output(1,20)=2;
                  output(1,21)=page;
                  output(1,22)=i;
                  dlmwrite(savingFile,output,'-append');
           end
    end
end
end
