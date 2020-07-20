function [feat]=getfeatures_stateoftheart_hwpr_2(z,test_gray_cc)
[r2,c2]=size(z);  %2
variance_m=variance_nd_mean(test_gray_cc);
sd_cc=sd2(test_gray_cc);
otsut=graythresh(test_gray_cc)*255;
locmax=localmaximahist(test_gray_cc);
feat=horzcat(variance_m(2),sd_cc,otsut,locmax);




