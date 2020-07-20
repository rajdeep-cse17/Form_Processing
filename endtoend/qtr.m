function [count] = qtr(A)
   [r,c] = size(A);
   count=0;
   for row=1:floor(r/4)
       for col=1:c
            if A(row,col)==0
                count=count+1;
            end
       end
   end
end

   