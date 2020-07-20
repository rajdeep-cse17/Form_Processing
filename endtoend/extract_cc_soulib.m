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
    img4=rgb2gray(img);
    img_gt = imread(in_gt_file);%this is the ground truth
    bw=joiningdashes(img);
img8=bw;

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
        wid=c;
        he=d;
        test_gray_cc=ones(d,c);
        test_gray_cc=test_gray_cc*255;
        test_gray_cc=uint8(test_gray_cc);

        hw=he/wid;
        wh=wid/he;
         text=0;
         non_text=0;
           for j=b:b+d-1
            for k=a:a+c-1
                test_gray_cc(j-b+1,k-a+1)=img4(j,k);                
                if im(j,k)==i
                    z(j-b+1,k-a+1)=0;
                    if (img_gt(j,k,1)==34 && img_gt(j,k,2)==177 && img_gt(j,k,3)==76 ) 
                          non_text = non_text + 1;
                    else
                        text=text+1;
                      end
                else
                    z(j-b+1,k-a+1)=1;
                end
            end
           end
           if(text>non_text)
            imwrite(test_gray_cc,strcat('C:\Users\rajde\OneDrive\Documents\clg\form dataset\CC_soulib\text\',num2str(page),'_',strcat(num2str(i),'.bmp')),'bmp');
           else
            imwrite(test_gray_cc,strcat('C:\Users\rajde\OneDrive\Documents\clg\form dataset\CC_soulib\non-text\',num2str(page),'_',strcat(num2str(i),'.bmp')),'bmp');
           end
    end
end
end
           