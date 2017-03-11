function h=GetHistOfVT(sFile)
%Get histogram of visual tokens
%Input: feature file path
%Output: a row (1D array) of histogram
%File name: GetHistOfVT.m
%Author: Yan Naing Aye
%Website: http://cool-emerald.blogspot.com/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %read all features from each file
    readFeatures=textread(sFile,'','headerlines',2);

    %each row has 133 elements and first 5 elements are u,v,a,b,c; feature vectors starts from 6th column
    readFeatures=readFeatures(:,6:end);

    %load feature centers (visual tokens)
    load('FeatureCtrs.dat');
    
    nf=size(readFeatures,1);
    nc=size(FeatureCtrs,1);
    %----------------------------------------------------------------
    %initialize histogram
    h=zeros(1,nc);
    for i=1:nf
        minD=ChiDist(readFeatures(i,:),FeatureCtrs(1,:));
        minC=1;
        for j=2:nc
            d=ChiDist(readFeatures(i,:),FeatureCtrs(j,:));
            if (d<minD)
                minD=d;
                minC=j; 
            end
        end
        h(minC)=h(minC)+1;
    end
end
