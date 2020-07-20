function [feat]=getfeatures_hwpr(z,test_gray_cc)
attrib_1 = otsu_sd_pI(test_gray_cc);
attrib_3 = test_stroke(z);
attrib_16 = quart(test_gray_cc);
attrib_17 = sd2(test_gray_cc);
attrib_18 = meanforegd(test_gray_cc); 
feat = horzcat(attrib_1,attrib_3,attrib_16,attrib_17,attrib_18); 
