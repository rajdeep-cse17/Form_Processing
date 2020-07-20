function [label]= cccharnum_rand_forest(attr)
X=csvread('C:\Users\rajde\OneDrive\Documents\clg\form dataset\endtoend\charnum\train_knn.csv');
Y=csvread('C:\Users\rajde\OneDrive\Documents\clg\form dataset\endtoend\charnum\class_knn.csv');
BaggedEnsemble = generic_random_forests(X,Y,60,'classification');
label=predict(BaggedEnsemble,attr);