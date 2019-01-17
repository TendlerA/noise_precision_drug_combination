figure
drawParetoFL
load('../allUniprobeDat.mat')
plotUniProbeBetaGamma
plot(1/7,1/7,'black.','MarkerSize',30)
text(0.1,0.18,sprintf('Minimal noise'),'FontSize',20)

xlim([0,0.5]);
ylim([-0.2,0.2]);
