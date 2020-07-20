function [out_att]= quart(gray_cc)
A=gray_cc(:);
A=A';
A=sort(A);
n=size(A);
j=n(2);
while A(1,j)==255
    j=j-1;
end
B=A(1:ceil(j/4));
C=A(ceil((3*j)/4):j);
out_att(1)=mean(B);
out_att(2)=sd(B);
out_att(3)=mean(C);
out_att(4)=sd(C);