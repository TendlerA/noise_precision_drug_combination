%draw Pareto front of different combinations 
getParetoParams


first_noiseDCline=[0,0;2/5,1/5];%format (gamma,beta)
first_noiseFLline=[1/7,1/7;1/2,0];%format (gamma,beta)

contour_draw_weight=20;
contour_draw_width=1;


figure
%DC noise-first order pareto front 
subplot(2,2,1)
hold on
contour(C,B,noiseDC,contour_draw_weight,'r','LineWidth',contour_draw_width);
contour(C,B,first_order,contour_draw_weight,'b','LineWidth',contour_draw_width);
plot(first_noiseDCline(:,1),first_noiseDCline(:,2),'black','LineWidth',2);
%minimal noise point first order
plot(2/5,1/5,'black.','MarkerSize',30)
%text(2/5+0.05,1/5,'Minimal noise point (first order)','FontSize',20)
%minimal noise point 
plot(0,0,'black.','MarkerSize',30)
text(-0.35,-0.25,sprintf('Minimal\n noise'),'FontSize',20)


setPlotPropertiesFormulaNames

%FL noise-first order pareto front
subplot(2,2,2)
hold on
contour(C,B,noiseFL,contour_draw_weight,'r','LineWidth',contour_draw_width);
contour(C,B,first_order,contour_draw_weight,'b','LineWidth',contour_draw_width);
plot(first_noiseFLline(:,1),first_noiseFLline(:,2),'black','LineWidth',2);
%minimal noise point first order
plot(1/2,0,'black.','MarkerSize',30)
%text(1/2+0.05,0,'Minimal noise point (first order)','FontSize',20)
%minimal noise point 
plot(1/7,1/7,'black.','MarkerSize',30)

text(-0.35,0,sprintf('Minimal\n noise'),'FontSize',20)


setPlotPropertiesFormulaNames

%DC noise-second order pareto front
subplot(2,2,3)
hold on
contour(C,B,noiseDC,contour_draw_weight,'r','LineWidth',contour_draw_width);
contour(C,B,sec_order,contour_draw_weight,'g','LineWidth',contour_draw_width);

%Pareto front
syms b1 c1
sol=solve(-2*c1^2+7*b1*c1+2*b1^2+c1-6*b1==0,b1);%drug combination
sol=sol(1);
c_vec=[0:0.01:1];
b_vec=subs(sol,'c1',c_vec);
plot(c_vec,b_vec,'black','LineWidth',2)

%second order approx point
plot(1,-1,'black.','MarkerSize',30)
%text(1+0.05,-1,'Second order approximation')
%minimal noise point 
plot(0,0,'black.','MarkerSize',30)
text(-0.35,-0.25,sprintf('Minimal\n noise'),'FontSize',20)

setPlotPropertiesFormulaNames

%FL noise-second order pareto front
subplot(2,2,4)
hold on
contour(C,B,noiseFL,contour_draw_weight,'r','LineWidth',contour_draw_width);
contour(C,B,sec_order,contour_draw_weight,'g','LineWidth',contour_draw_width);

%Pareto front
sol=solve(5*b1^2+28*b1*c1-22*b1+16*c1^2-20*c1+5==0,b1);%fitness landscape (noise in s0)
sol=sol(1);
c_vec=[1/7:0.001:1];
b_vec=subs(sol,'c1',c_vec);
plot(c_vec,b_vec,'black','LineWidth',2)

%second order approx point
plot(1,-1,'black.','MarkerSize',30)
%text(1+0.05,-1,'Second order approximation')
%minimal noise point 
plot(1/7,1/7,'black.','MarkerSize',30)
%text(1/7-0.3,1/7+0.2,'Minimal noise point','FontSize',20)
text(-0.35,0,sprintf('Minimal\n noise'),'FontSize',20)

setPlotPropertiesFormulaNames