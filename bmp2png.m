%File name: bmp2png.m
%-------------------------------------------------------------------------
sDir=[pwd,'/test/']; %source folder
sFile=[sDir, '*.bmp']; %source files
dFile=[pwd,'/test_png/test_']; %destination
%-------------------------------------------------------------------------
sList=dir(sFile); %Get file list
nFiles=size(sList,1) %number of files
%-------------------------------------------------------------------------
for i=1:nFiles 
    Img=imread([sDir,sList(i).name]);
    imwrite(Img,[dFile,sprintf('%03d',i),'.png']);
    i %output progress
end
