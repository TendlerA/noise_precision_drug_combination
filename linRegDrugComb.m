function [ coeffs ] = linRegDrugComb( data )
%find the best linear regression model for the given dataset.
[len n]=size(data);
if n==7
    X1=sum(log(data(:,[1:3])),2);
    X2=sum(log(data(:,[4:6])),2);
    y=log(data(:,7));
    X=[X1,X2];
    ind=randi(len,len,1);
    coeffs=regress(y(ind),X(ind,:));
else
    X0=log(data(:,1));
    X1=sum(log(data(:,[2:4])),2);
    X2=sum(log(data(:,[5:7])),2);
    y=log(data(:,8));
    X=[X0,X1,X2];
    ind=randi(len,len,1);
    coeffs=regress(y(ind),X(ind,:));
end

end

