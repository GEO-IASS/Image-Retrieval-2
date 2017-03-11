%File name: IF2_Build_Histogram_of_VisualTokens.m
%Author: Yan Naing Aye
%Website: http://cool-emerald.blogspot.com/
%-------------------------------------------------------------------------
NVT=200; %number of visual tokens
sDir=[pwd,'/training_png/']; %source directory
sFile=[sDir, '*.sift']; %source files
sList=dir(sFile); %source file list
nFiles=size(sList,1); %number of files
AllHistVT=zeros(nFiles,NVT); %histograms of visual tokens of all files
%-------------------------------------------------------------------------
for i=1:nFiles 
    AllHistVT(i,:)=GetHistOfVT([sDir,sList(i).name]);
    i%output progress
end
save -ascii -double -tabs AllHistVT.dat AllHistVT;
