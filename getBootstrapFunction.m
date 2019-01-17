function [ res ] = getBootstrapFunction( data )
%get bootstrap of beta gamma on data
count=30;
eps=0.01;

res=[];
for i=1:count
    res=[res,linRegDrugComb(data+eps)];
end

end

