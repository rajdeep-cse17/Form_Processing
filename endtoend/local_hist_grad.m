function [ g_hist ] = local_hist_grad( img )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[ img1, img2, img3, img4 ] = four_parts( img );
g_hist1 = gradient_count( img1 );
g_hist2 = gradient_count( img2 );
g_hist3  = gradient_count( img3 );
g_hist4 = gradient_count( img4 );
g_hist5 = gradient_count(img);

g_hist = [g_hist1 g_hist2 g_hist3 g_hist4 g_hist5];


end

