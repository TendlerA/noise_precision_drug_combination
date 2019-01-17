%draw the Pareto front of all three performance functions 

B=[-1.5:0.01:0.5];
C=[-0.5:0.01:1.5];
b=length(B);
c=length(C);
noiseDC=zeros(b,c);
first_order=zeros(b,c);
noiseFL=zeros(b,c);
sec_order=zeros(b,c);

for i=1:b
    for j=1:c
        a=1-3*B(i)-3*C(j);%zeroth order approximations
        noiseFL(i,j)=sqrt(a^2+3*B(i)^2+3*C(j)^2);
        noiseDC(i,j)=sqrt(3*B(i)^2+3*C(j)^2);%no noise in alpha
        first_order(i,j)=3*abs(1-B(i)-2*C(j));
        sec_order(i,j)=(1-C(j))^2+(1/2-B(i)/2-C(j))^2;%incoherent variation
    end
end


subplot(1,2,1);
hold on
contour(C,B,noiseDC,30,'r');
contour(C,B,first_order,30,'b');
contour(C,B,sec_order,30,'g');

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
plot(1,-1,'black.','MarkerSize',20)
text(1+0.05,-1,'Second order approximation')
%minimal noise point 
plot(0,0,'black.','MarkerSize',20)
text(0.05,0,'Minimal noise point')
xlabel('\gamma');
ylabel('\beta');
plotBootstrapRealData
axis([-0.5 1.5 -1.5 0.5])

subplot(1,2,2);
hold on
contour(C,B,noiseFL,30,'r');
contour(C,B,first_order,30,'b');
contour(C,B,sec_order,30,'g');

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
plot(1,-1,'black.','MarkerSize',20)
text(1+0.05,-1,'Second order approximation')
%minimal noise point 
plot(1/7,1/7,'black.','MarkerSize',20)
text(1/7+0.05,1/7,'Minimal noise point')
xlabel('\gamma');
ylabel('\beta');
%plotBootstrapMutationData
axis([-0.5 1.5 -1.5 0.5])
plotUniProbeBetaGamma

