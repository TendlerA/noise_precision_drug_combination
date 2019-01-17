%plot linear regression of data
b=zeros(6,3);
b(1,:)=linRegDrugComb(cancer_doses_A549_1)';
b(2,:)=linRegDrugComb(cancer_doses_A549_2)';
b(3,:)=linRegDrugComb(cancer_H1299)';
b(4,:)=linRegDrugComb(cancer_HeLa)';
b(5,:)=linRegDrugComb(mutations_Hartl)';
eps=0.001;
Wood_bacteria_eps=Wood_bacteria+eps;
b(6,:)=linRegDrugComb(Wood_bacteria_eps)';

plot(b(1,3),b(1,2),'.r','MarkerSize',20)
plot(b(2,3),b(2,2),'.g','MarkerSize',20)
plot(b(6,3),b(6,2),'.b','MarkerSize',20)