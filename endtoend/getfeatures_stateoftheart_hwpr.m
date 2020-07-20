function [feat]=getfeatures_stateoftheart_hwpr(z,test_gray_cc)
[r2,c2]=size(z);  %2
dens=density(z);
variance_m=variance_nd_mean(test_gray_cc);
sd_cc=sd2(test_gray_cc);
qtri=qtr(z);
otsut=graythresh(test_gray_cc)*255;
locmax=localmax(test_gray_cc);
feat=horzcat(dens,variance_m,sd_cc,qtri,otsut,locmax);




