getParetoParams


contour_draw_weight=20;
contour_draw_width=1;

%1 - only front. 2 - bootstrapped data. 3 - Uniprobe data. 4 - simulated
%data
type_fig=1;


subplot(1,2,1);
hold on
contour(C,B,noiseDC,contour_draw_weight,'r','LineWidth',contour_draw_width);
contour(C,B,first_order,contour_draw_weight,'b','LineWidth',contour_draw_width);
contour(C,B,sec_order,contour_draw_weight,'g','LineWidth',contour_draw_width);

%Pareto front
sol=solve('-2*c^2+7*b*c+2*b^2+c-6*b=0','b');%drug combination
%this expression interesect first order contour at c=1/2
sol=sol(1);
c_vec=[1/2:0.001:1];
b_vec=subs(sol,'c',c_vec);
fill(c_vec,b_vec,'black')


c_vec=[0:0.001:1/2];
b_vec=subs(sol,'c',c_vec);
c_vec=[c_vec,2/5];
b_vec=[b_vec,1/5];
fill(c_vec,b_vec,'black')

%second order approx point
%plot(1,-1,'black.','MarkerSize',20)
%text(1+0.05,-1,'Second order approximation')
%minimal noise point 
%plot(0,0,'black.','MarkerSize',20)
%text(0.05,0,'Minimal noise point')



%optionals
if type_fig==2
    plotBootstrapRealData
end


setPlotPropertiesFormulaNames


contour_draw_weight=20;
contour_draw_width=1;

subplot(1,2,2);
hold on
contour(C,B,noiseFL,contour_draw_weight,'r','LineWidth',contour_draw_width);
contour(C,B,first_order,contour_draw_weight,'b','LineWidth',contour_draw_width);
contour(C,B,sec_order,contour_draw_weight,'g','LineWidth',contour_draw_width);

%Pareto front
sol=solve('5*b^2+28*b*c-22*b+16*c^2-20*c+5=0','b');%fitness landscape (noise in s0)
%this expression interesect first order contour at c=3/5

sol=sol(1);
c_vec=[3/5:0.001:1];
b_vec=subs(sol,'c',c_vec);
fill(c_vec,b_vec,'black')

c_vec=[1/7:0.001:3/5];
b_vec=subs(sol,'c',c_vec);
c_vec=[c_vec,1/2];
b_vec=[b_vec,0];
fill(c_vec,b_vec,'black')



%second order approx point
%plot(1,-1,'black.','MarkerSize',20)
%text(1+0.05,-1,'Second order approximation')
%minimal noise point 
%plot(1/7,1/7,'black.','MarkerSize',20)
%text(1/7+0.05,1/7,'Minimal noise point')

setPlotPropertiesFormulaNames

if type_fig==2
    plotBootstrapMutationData
end

%plotUniProbeBetaGamma


