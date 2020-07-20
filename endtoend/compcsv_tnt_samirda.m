savingFile = 'C:\Users\rajde\OneDrive\Documents\clg\form dataset\text_nontext_samir_da_all_final.csv';
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
        wid=c;
        he=d;
        hw=he/wid;
        wh=wid/he;
         text=0;
         non_text=0;
           for j=b:b+d-1
            for k=a:a+c-1
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
           output=getfeatures_tnt(z);
           if(~(wh>50||hw>50||he>0.16*r||wid>0.4*c3))
           if(text>non_text)
               output(1,18)=1;
               output(1,19)=page;
               output(1,20)=i;
               dlmwrite(savingFile,output,'-append');
           else
               output(1,18)=2;
               output(1,19)=page;
               output(1,20)=i;
               dlmwrite(savingFile,output,'-append');
           end
           end
    end
end
end
           