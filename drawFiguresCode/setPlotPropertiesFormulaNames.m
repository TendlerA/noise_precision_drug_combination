function [ output_args ] = setPlotPropertiesFormulaNames()
% set axis, add formula names, more

hold on
xlabel('\gamma','FontSize',20);
ylabel('\beta','FontSize',20);

%regress
plot(1,-1,'black.','MarkerSize',30)
%text(1.05,-1,'Regression','FontSize',20)
text(0.75,-1.1,'Regression','FontSize',20)

%bliss
plot(0,1,'black.','MarkerSize',30)
%text(0.05,1,'Bliss','FontSize',20)
text(0.05,0.9,'Bliss','FontSize',20)


%pairs
plot(0.5,0,'black.','MarkerSize',30)
text(0.55,0,'Pairs','FontSize',20)

set(gca,'FontSize',20)
axis([-0.5,1.5,-1.5,1])

end

