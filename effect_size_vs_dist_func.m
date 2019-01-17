%correlation between distance of approximation and effect size

dist=10.^[-2:0.3:1];
res=zeros(10,30);

for i=1:10
	for j=1:100
		A1=simulateCombinationData(dist(i),0);
		res(i,j)=mean((A1(:,1).*A1(:,5)-A1(:,2).*A1(:,3))./(A1(:,2).*A1(:,3)));
	end
end
		
plot(log10(dist),log10(abs(mean(res,2))),'.','MarkerSize',20)