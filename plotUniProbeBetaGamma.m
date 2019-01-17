%plot bootstrap UniProbe data

len=length(allUniProbeDat);
beta=zeros(len,1);
gamma=zeros(len,1);
for i=1:len
    coeff=linRegDrugCombWithFirstMeasurement(allUniProbeDat{i});
    beta(i)=coeff(2);
    gamma(i)=coeff(3);
end

plot(gamma,beta,'.','MarkerSize',30)
