for page=2:70
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
                    if (pc>pn&&pc>hwn&&pc>hwc&&pc>non_text)
            imwrite(test_gray_cc,strcat('C:\Users\rajde\OneDrive\Documents\clg\form dataset\CC_soulib\pr\alphabet\',num2str(page),'_',strcat(num2str(i),'.bmp')),'bmp');
                    elseif (pn>pc&&pn>hwn&&pn>hwc&&pn>non_text)
            imwrite(test_gray_cc,strcat('C:\Users\rajde\OneDrive\Documents\clg\form dataset\CC_soulib\pr\numeric\',num2str(page),'_',strcat(num2str(i),'.bmp')),'bmp');
                    elseif (hwn>hwc&&hwn>pn&&hwn>pc&&hwn>non_text)
            imwrite(test_gray_cc,strcat('C:\Users\rajde\OneDrive\Documents\clg\form dataset\CC_soulib\hw\numeric\',num2str(page),'_',strcat(num2str(i),'.bmp')),'bmp');
                    elseif (hwc>hwn&&hwc>pc&&hwc>pn&&hwc>non_text)
            imwrite(test_gray_cc,strcat('C:\Users\rajde\OneDrive\Documents\clg\form dataset\CC_soulib\hw\alphabet\',num2str(page),'_',strcat(num2str(i),'.bmp')),'bmp');
                    end
                            
           end
    end
end
