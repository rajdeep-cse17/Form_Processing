function [count] = localmax(A)
   A=padarray(A,1,255);
   [r,c] = size(A);
   count=0;
   for row=2:r-1
       for col=2:c-1
            if A(row,col)>A(row,col-1)&&A(row,col)>A(row-1,col)&&A(row,col)>A(row+1,col)&&A(row,col)>A(row,col+1)
                count=count+1;
            end
       end
   end
end
