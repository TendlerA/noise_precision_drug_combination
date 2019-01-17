figure
subplot(1,2,1)
drawParetoDC
plot(0,0,'black.','MarkerSize',30)
text(-0.35,-0.25,sprintf('Minimal\n noise'),'FontSize',20)

subplot(1,2,2)
drawParetoFL
plot(1/7,1/7,'black.','MarkerSize',30)
text(-0.35,0,sprintf('Minimal\n noise'),'FontSize',20)