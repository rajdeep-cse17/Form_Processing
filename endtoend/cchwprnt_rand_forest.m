function [label]= cchwprnt_rand_forest(attr)
X=csvread('C:\Users\rajde\OneDrive\Documents\clg\form dataset\train_knn_30.csv');
Y=csvread('C:\Users\rajde\OneDrive\Documents\clg\form dataset\class_knn_30.csv');
BaggedEnsemble = generic_random_forests(X,Y,60,'classification');
label=predict(BaggedEnsemble,attr);