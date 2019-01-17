function [ res ] = computeRMSGeneralizedMean( p,data )
%compute the generalized mean RMS of a formula on a given dataset
S1=data(:,1);
S2=data(:,2);
S3=data(:,3);
S12=data(:,4);
S13=data(:,5);
S23=data(:,6);
S123=data(:,7);
if p<-100
    res=rms(S123-min(S1.*S23,min(S2.*S13,S3.*S12)));
elseif p>100
    res=rms(S123-max(S1.*S23,max(S2.*S13,S3.*S12)));
else
    res=rms(S123-(1/3*((S1.*S23).^p+(S2.*S13).^p+(S3.*S12).^p)).^(1./p));
end
%res=rms(S123-min([S1.*S23,S2.*S12,S3.*S12]')');

end

