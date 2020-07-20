function [label]= cccharnum_rand_forest_2(attr)
X=csvread('C:\Users\rajde\OneDrive\Documents\clg\form dataset\endtoend\charnum\train_knn.csv');
Y=csvread('C:\Users\rajde\OneDrive\Documents\clg\form dataset\endtoend\charnum\class_knn.csv');
opts.classfierID= [2, 3]; % use both 2D-linear weak learners (2) and conic (3)
m= forestTrain(X, Y, opts);
label = forestTest(m, attr);
