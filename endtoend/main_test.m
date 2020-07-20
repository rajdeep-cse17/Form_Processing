gt = imread('E:\collage_research_work\Form Processing\DATA\GT\gt_hwp00016.png');

img = imread('E:\collage_research_work\Form Processing\DATA\New folder\hwp00016.bmp');
img = im2bw(img);
%img = imread('16.bmp');
[fi]=accuracychk2_n(img,gt);