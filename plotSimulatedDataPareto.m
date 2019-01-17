%plot randomize data with different parameters
k=10;
n=10;
m=10;
w=zeros(n,m);
x=zeros(n,m);
y=zeros(n,m);
for j=1:k
    j
for i=1:n
    for i2=1:m
    M=simulateCombinationData(0.03*2^i2,0.0000001*2^i);%i2=eps=0.03,i=sigma=0.01
    %M=simulateCombinationData(0.5*i2,1*i);%not bad simulation
    %M=simulateCombinationData(0.1*i2,0.3*i);
    %M(:,1)=0;
    DATA{i,i2,j}=M;
    c=linRegDrugCombWithFirstMeasurement(M);
    w(i,i2)=w(i,i2)+c(1);
    x(i,i2)=x(i,i2)+c(3);
    y(i,i2)=y(i,i2)+c(2);
    end
end
end
w=w/k;
x=x/k;
y=y/k;
%plot(reshape(x,[m*n 1]),reshape(y,[m*n 1]),'r.','MarkerSize',20)


%%
figure
imagesc(x([size(x,2):-1:1],:))
axis off
xlabel('Effect Size','FontSize',24)
ylabel('Noise','FontSize',24)
title('\gamma','FontSize',24)