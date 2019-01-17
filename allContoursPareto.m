B=[-1.5:0.01:1];
C=[-0.5:0.01:1.5];
b=length(B);
c=length(C);
noise=zeros(b,c);
first_order=zeros(b,c);
sec_order=zeros(b,c);
for i=1:b
    for j=1:c
        a=1-3*B(i)-3*C(j);%zeroth order approximations
        noise(i,j)=sqrt(3*B(i)^2+3*C(j)^2);%no noise in alpha
        first_order(i,j)=3*abs(1-B(i)-2*C(j));
        sec_order(i,j)=(1-C(j))^2+(1/2-B(i)/2-C(j))^2;%incoherent variation
    end
end




%Pareto front
sol=solve('-2*c^2+7*b*c+2*b^2+c-6*b=0','b');%drug combination
%this expression interesect first order contour at c=1/2
sol=sol(1);
c_vec=[1/2:0.001:1];
b_vec=subs(sol,'c',c_vec);
fill(c_vec,b_vec,'black')
hold on

c_vec=[0:0.001:1/2];
b_vec=subs(sol,'c',c_vec);
c_vec=[c_vec,2/5];
b_vec=[b_vec,1/5];
fill(c_vec,b_vec,'black')



contour(C,B,noise,30,'r','LineWidth',2);
contour(C,B,sec_order,30,'g','LineWidth',2);
contour(C,B,first_order,30,'b','LineWidth',2);
xlabel('\gamma','FontSize',20);
ylabel('\beta','FontSize',20);

%regress
plot(1,-1,'black.','MarkerSize',30)
text(1.05,-1,'Regression','FontSize',20)

%bliss
plot(0,1,'black.','MarkerSize',30)
text(0.05,1,'Bliss','FontSize',20)

%pairs
plot(0.5,0,'black.','MarkerSize',30)
text(0.55,0,'Pairs','FontSize',20)

plotBootstrapRealData
axis([-0.5 1.5 -1.5 1])
