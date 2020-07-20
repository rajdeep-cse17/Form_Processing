function [cog]=cg(test_gray_cc)
binaryImage = true(size(test_gray_cc));
measurements = regionprops(binaryImage, test_gray_cc, 'WeightedCentroid');
[r,c]=size(test_gray_cc);
if r==0||c==0
    cog(1)=0;
    cog(2)=0;
else
cog = measurements(1).WeightedCentroid;
end