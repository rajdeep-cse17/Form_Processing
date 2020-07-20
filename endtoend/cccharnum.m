function [label]= cccharnum(attr)
% X=csvread('C:\Users\rajde\OneDrive\Documents\clg\form dataset\endtoend\charnum\train_knn.csv');
% Y=csvread('C:\Users\rajde\OneDrive\Documents\clg\form dataset\endtoend\charnum\class_knn.csv');

% Mdl = fitcknn(X,Y,'NumNeighbors',5,'Standardize',1);
label = predict(Mdl,attr);