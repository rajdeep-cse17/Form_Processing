%This function takes an image as input and joins the dashes/dots and returns the final image 
function [kl]=joiningdashes(img)
%img=imread('C:\Users\Rajdeep Bhattacharya\Documents\project\form dataset\GT\GT_hwp00001.PNG');
gray=rgb2gray(img);
th=graythresh(gray);
bnw=im2bw(gray,0.8);
% imshow(bnw);

% bnw = img;
[r,c2]=size(bnw);
%imwrite(bw,strcat('C:\Users\Rajdeep Bhattacharya\Documents\project\form dataset\',strcat('1','.bmp')),'bmp');
im=bwlabel(~bnw);
stats=regionprops(~bnw,'BoundingBox','Area');
[n,c]=size(stats);
mina=ones(1,r);
mina=mina*100000;
maxa=zeros(1,r);
cn=zeros(1,r);
coun=0;
t=zeros(1,r);
for i=1:n
    if stats(i).Area>6
        a=ceil(stats(i).BoundingBox(1));
        b=ceil(stats(i).BoundingBox(2));
        c=ceil(stats(i).BoundingBox(3));
        d=ceil(stats(i).BoundingBox(4));
        z=zeros(d,c);
        black=0;
        e=max(c,d)/min(c,d);
        if(e>3&&c<30&&d<8)
%             for j=b:b+d-1
%             for k=a:a+c-1
%                 if im(j,k)==i
%                     z(j-b+1,k-a+1)=0;                 
%                 else
%                     z(j-b+1,k-a+1)=255;
%                 end
%             end
%             end
        ch=num2str(i);
        %imwrite(z,strcat('C:\Users\Rajdeep Bhattacharya\Documents\project\form dataset\idc\',strcat(ch,'.bmp')),'bmp');
            coun=coun+1;           
            cn(b)=cn(b)+1;
            if(a<mina(b))
                mina(b)=a;
            end
            if((a+c-1)>maxa(b))
                maxa(b)=a+c-1;
            end
            t(b)=b+d;
            if t(b)>r
                t(b)=r;
            end
        end
    end
end
fi=zeros(r,c2);
for j=1:r
    if cn(j)>0
        minb=1000000;
        maxb=0;
        for loop=j:t(j)
            if mina(loop)<minb
                minb=mina(loop);
            end
            if maxa(loop)>maxb
                maxb=maxa(loop);
            end
        end
        for j2=j:t(j)
            for k=minb:maxb
                bnw(j2,k)=0;
            end
        end
    end
    j=t(j);
end
kl=bnw;
