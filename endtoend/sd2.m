function [out_sd] = sd2(A)
   [r,c] = size(A);
   sum = 0;count = 1;
   data_array=[];
   for row=1:r
       for col=1:c
              data_array=[data_array A(row,col)];
              count = count + 1;
       end
   end
   data_array2 = double(data_array);
   out_sd = std(data_array2);
end