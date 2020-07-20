function [feat] = variance_nd_mean(A)
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
   out_mean= mean(data_array2);
   out_var = var(data_array2);
   feat=horzcat(out_var,out_mean);
end