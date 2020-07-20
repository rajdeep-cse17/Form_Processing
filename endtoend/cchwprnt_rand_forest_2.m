function [label]= cchwprnt_rand_forest_2(attr)
X=csvread('C:\Users\rajde\OneDrive\Documents\clg\form dataset\train_knn_30.csv');
Y=csvread('C:\Users\rajde\OneDrive\Documents\clg\form dataset\class_knn_30.csv');
opts.classfierID= [2, 3]; % use both 2D-linear weak learners (2) and conic (3)
m= forestTrain(X, Y, opts);
label = forestTest(m,attr);