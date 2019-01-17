addpath('..')
figure
subplot(1,2,1)
drawParetoDC
plotBootstrapRealData
text(0.55,0,'Pairs','FontSize',20)
%xlim([0,1.5]);
%ylim([-0.5,0.5]);

subplot(1,2,2)
drawParetoFL
plotBootstrapMutationData
text(0.55,0,'Pairs','FontSize',20)
xlim([0,1]);
ylim([-0.5,0.5]);
