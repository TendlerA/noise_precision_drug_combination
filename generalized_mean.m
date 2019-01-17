
%simulate generalized mean noise
p_vec=[-100,-10,-1,1,10,100];
p_vec=[-9.5:1:9.5];
n=1000000;
res=zeros(size(p_vec));
for p=1:length(p_vec)
    
    res(p)=std((1/3*exp(randn(n,1)).^p+1/3*exp(randn(n,1)).^p+1/3*exp(randn(n,1)).^p).^(1/p));
end
fig=figure();
subplot(1,2,1);
hold on;
plot(p_vec,res,'.-','LineWidth',2,'MarkerSize',20);
xlabel('p');
ylabel('STD on simulated noisy data');
text(-0.2,1.05,'A','Units','normalized')

%% analysis of optimal generalized mean formula
get_drug_comb_data;

datasets={TaxolCisDox./100,cancer_doses_A549_1,mutations_Hartl,...
    Wood_bacteria,EcoliEmergent,cancer_H1299,cancer_HeLa,yeast_effects};

n=length(datasets);
opt_p=zeros(n,1);
win_class=zeros(n,1);
rms_LL=zeros(n,1);
rms_GM=zeros(n,1);
for i=1:n
   [x rms_LL(i)]=fminsearch(@(x)computeRMSLogLinear(x,datasets{i}),[0,0]);
   [opt_p(i) rms_GM(i)]=fminsearch(@(x)computeRMSGeneralizedMean(x,datasets{i}),1);
   if f2<f1%generalized mean is better
       win_class(i)=1;
   end
end


subplot(1,2,2);
c = categorical({'A549','A549 extra','Digydrofolate reductase','E. coli antibiotics ','E. coli antibiotics 2','H1299','HeLa','Yeast'});
bar(c,[rms_LL,rms_GM]);
legend({'Log-linear','Generalized mean'});
ylabel('RMSE');
text(-0.2,1.05,'B','Units','normalized')

set(findall(fig,'-property','FontSize'),'FontSize',18);

%yeast no nan is fine
%TaxolCisDox no nan is fine