getParetoParams
draw_contours=0;

hold on
if (draw_contours)
    contour(C,B,noiseDC,30,'r','LineWidth',2);
    contour(C,B,first_order,30,'b','LineWidth',2);
    contour(C,B,sec_order,30,'g','LineWidth',2);
end
%Pareto front
syms b1 c1
sol=solve(-2*c1^2+7*b1*c1+2*b1^2+c1-6*b1==0,b1);%drug combination
%this expression interesect first order contour at c=1/2
sol=sol(1);
c_vec=[1/2:0.001:1];
b_vec=subs(sol,'c1',c_vec);
fill(c_vec,b_vec,'black')


c_vec=[0:0.001:1/2];
b_vec=subs(sol,'c1',c_vec);
c_vec=[c_vec,2/5];
b_vec=[b_vec,1/5];
fill(c_vec,b_vec,'black')

%second order approx point
%plot(1,-1,'black.','MarkerSize',20)
%text(1+0.05,-1,'Second order approximation')
%minimal noise point 
%plot(0,0,'black.','MarkerSize',20)
%text(0.05,0,'Minimal noise point')
setPlotPropertiesFormulaNames