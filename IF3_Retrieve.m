%File name: IF3_Retrieve.m
%Author: Yan Naing Aye
%Website: http://cool-emerald.blogspot.com/
%-------------------------------------------------------------------------
%Get test file
featureDir=[pwd,'/test_png/'];
[uFileName,uPathName] = uigetfile('*.png','Select a test file',featureDir);
[pathstr, fileNameWithoutExt, ext, versn] = fileparts(uFileName);
featurefile=[featureDir, fileNameWithoutExt,'.png.harhes.sift'];
%-------------------------------------------------------------------------
%show test image
figure;
imshow([pwd,'/test_png/', fileNameWithoutExt,'.png']);
title('Test image');
%-------------------------------------------------------------------------
%Get histogram for test image
figure;
h=GetHistOfVT(featurefile);
bar(h);
title('Test image histogram');
%-------------------------------------------------------------------------
%Load trained data
load('AllHistVT.dat');
n=size(AllHistVT,1);
cDist=zeros(n,1);
for i=1:n; cDist(i)=ChiDist(h,AllHistVT(i,:)); end
[B, IX] = sort(cDist);
%-------------------------------------------------------------------------
%Get folder path and wildcard
imgDir=[pwd,'/training_png/'];
imgFile=[imgDir, '*.png'];
%Get file list and number of files
fileList=dir(imgFile);
%-------------------------------------------------------------------------
%Show results
nr=9;%number of results to show
%settings
cs=3;
rs=ceil(nr./cs);
figure;
for i=1:nr
    imgFileName=fileList(IX(i)).name;
    subplot(rs,cs,i);
    imshow([imgDir,imgFileName]);
    title(['Rank ',num2str(i)]);    
end
%-------------------------------------------------------------------------
