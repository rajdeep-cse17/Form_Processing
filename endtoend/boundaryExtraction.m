function [boundaryImage]=boundaryExtraction(inputImage)
% MN=[2,2];
% structureElement=strel('rectangle',MN);
structureElement=strel('disk',1,0);%Structuring element
erodeImage=imerode(inputImage,structureElement);%Erode the image by structuring element
% figure,imshow(erodeImage);title('Original Image');
boundaryImage=inputImage-erodeImage;
% figure,imshow(boundaryImage);title('Boundary extracted Image');
end