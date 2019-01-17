getParetoParams
draw_contours=0;

hold on
if (draw_contours)
    contour(C,B,noiseFL,30,'r','LineWidth',2);
    contour(C,B,first_order,30,'b','LineWidth',2);
    contour(C,B,sec_order,30,'g','LineWidth',2);
end
%Pareto front
syms b1 c1
sol=solve(5*b1^2+28*b1*c1-22*b1+16*c1^2-20*c1+5==0,b1);%fitness landscape (noise in s0)
%this expression interesect first order contour at c=3/5

sol=sol(1);
c_vec=[3/5:0.001:1];
b_vec=subs(sol,'c1',c_vec);
fill(c_vec,b_vec,'black')

c_vec=[1/7:0.001:3/5];
b_vec=subs(sol,'c1',c_vec);
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
