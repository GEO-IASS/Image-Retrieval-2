%File name: IF1_Find_VisualTokens.m
%Author: Yan Naing Aye
%Website: http://cool-emerald.blogspot.com/
%-------------------------------------------------------------------------
%parameter settings
NRF=100; %number of random features taken from each training image
NVT=200; %number of visual tokens to find
FV_Size=128; %feature vector size
%-------------------------------------------------------------------------
sDir=[pwd,'/training_png/']; %source directory
sFile=[sDir,'*.sift']; %source files
fList=dir(sFile); %get file list
nFiles=size(fList,1); %number of files
%-------------------------------------------------------------------------
allFeatures=zeros(NRF*nFiles,FV_Size); %allocate and initialize for all features 
%(e.g. 100 random features each from 400 files and each feature has 128 dimensions)
selFeatures=zeros(NRF,FV_Size); %allocate and initialize for random features 
si=1; ei=100; %starting index and ending index for each file
for i=1:nFiles
    i %output progress
    sFile=[sDir,fList(i).name]
    %read all features from each file
    readFeatures=textread(sFile,'','headerlines',2);

    %each row has 133 elements and first 5 elements are u,v,a,b,c; feature vectors starts from 6th column
    readFeatures=readFeatures(:,6:end);

    %select random features
    nFeatures=size(readFeatures,1);
    p=randperm(nFeatures,NRF);
    selFeatures=readFeatures(p,:);

    %put the selected features to all features pool
    ei=i*NRF; si=ei-NRF+1;
    allFeatures(si:ei,:)=selFeatures;
end

%find feature centers by k-means clustering
[idx,FeatureCtrs] = KMeansCustom(allFeatures,NVT);

%save the feature centers to a file
save -ascii -double -tabs FeatureCtrs.dat FeatureCtrs;
