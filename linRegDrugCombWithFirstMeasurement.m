function [ coeffs ] = linRegDrugCombWithFirstMeasurement( data )
%find the best linear regression model for the given dataset.
m=size(data,1);
X0=data(:,1);
X1=sum(data(:,[2:4]),2);
X2=sum(data(:,[5:7]),2);
y=data(:,8);
X=[X0,X1,X2];
coeffs=regress(y,X);

end