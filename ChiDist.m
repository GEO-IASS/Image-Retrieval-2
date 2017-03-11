function d=ChiDist(v1,v2)
%Find Chi Square distance between two vectors
%Input: 2 vectors 
%Output: a scalar distance
%File name: ChiDist.m


    dv=(v1-v2).^2;
    sv=abs(v1)+abs(v2);
    sv(sv==0)=1e-9; %eliminate zero denominator
    d=sum(dv./sv)./2;    
end
