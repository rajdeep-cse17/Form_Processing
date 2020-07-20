%%%%%%   batchFormation()

function batchFormation(dir_in,dir_in2,file_ext,file_ext2)
disp('WAIT! Execution begining...');

% list of files in the directory name with the input file extension
listing = dir(strcat(dir_in,'*.',file_ext));
file_names = {listing.name};
listing2 = dir(strcat(dir_in2,'*.',file_ext2));
file_names2 = {listing2.name};
% number of pages in the directory with this file extension
num_pages = length(file_names);
num_pages2 = length(file_names2);

%display(num_pages);
fprintf('Total number of pages = %d\n', num_pages);
%savingFile = 'C:\Users\Rajdeep Bhattacharya\Documents\project\form dataset\testing.csv';
%savingfile2= 'C:\Users\Rajdeep Bhattacharya\Documents\project\form dataset\testingcenters.csv';
% process all pages in the directory
for i = 1:num_pages
  %if((i>=120)&&(i<125))  
    fprintf('Processing page No: %d\n', i);    
    
    % load the image from the directory
    img1 = imread(strcat(dir_in,file_names{i}));
    img2=imread(strcat(dir_in2,file_names2{i}));
         
%     img2=imresize(imread(strcat(dir_in2,file_names2{i})),[h,w]);
    disp(file_names(i));
    disp(file_names2(i));
    
    % call the text line extraction code
    %[outputImg] = test5icdar2(img);
    %[img,mask,inpainted_img,normalised3] = main_function(img);
    %disp(file_names{i});
    %disp(file_names2{i});
    
    ch=(file_names{i});
    x=end2end(img1,img2);
    imwrite(x,strcat('C:\Users\rajde\OneDrive\Documents\clg\form dataset\70testop\',ch),'bmp');
%     imwrite(x,strcat('C:\Users\Rajdeep Bhattacharya\Documents\project\form dataset\g\',strcat(ch,'.bmp')),'bmp');
%    % a = sirmethod(x,img2);
    
   
    % remove the file extension from the file name
   % name = strrep(file_names{i},strcat('.',file_ext),'');
    %name1=strcat(name,'_1img');
    %name2=strcat(name,'_2mask');
    %name3=strcat(name,'_2F_img');
    %name4=strcat(name,'_4normalised');
    
    % create a directory with the file name with the extension    
    %saveFile1=strcat(dir_results,name1,'.bmp');
    %saveFile2=strcat(dir_results,name2,'.bmp');
   % saveFile3=strcat(dir_results,name3,'.PNG');
    %saveFile4=strcat(dir_results,name4,'.bmp');
    %dlmwrite(savingFile, a, '-append');
    % save output images
    %imwrite(img,saveFile1,'bmp');    
    %imwrite(mask,saveFile2,'bmp');
    %imwrite(F_img,saveFile3,'PNG');
    %imwrite(normalised3,saveFile4,'bmp');

end
disp('WOW! Successful Execution...');