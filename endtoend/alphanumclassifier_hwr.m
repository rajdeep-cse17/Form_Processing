function [label]= alphanumclassifier_hwr(attr)
% X=csvread('C:\Users\rajde\OneDrive\Documents\clg\form dataset\endtoend\charnum\handwritten\train_knn_30.csv');
% Y=csvread('C:\Users\rajde\OneDrive\Documents\clg\form dataset\endtoend\charnum\handwritten\class_knn_30.csv');
% Mdl = fitcknn(X,Y,'NumNeighbors',5,'Standardize',1);
load 'anum_hw.mat'
label = predict(BaggedEnsemble,attr);
label=cell2mat(label);
label=str2num(label);
end