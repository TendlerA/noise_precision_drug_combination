function [ res ] = computeRMSLogLinear( v,data )
%compute the log linear RMS of a formula on a given dataset
S1=data(:,1)+0.01;
S2=data(:,2)+0.01;
S3=data(:,3)+0.01;
S12=data(:,4)+0.01;
S13=data(:,5)+0.01;
S23=data(:,6)+0.01;
S123=data(:,7)+0.01;

    res=rms(S123-(S1.*S2.*S3).^v(1).*(S12.*S13.*S23).^v(2));


end