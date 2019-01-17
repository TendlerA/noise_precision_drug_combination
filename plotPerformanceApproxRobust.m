B=[-1.5:0.01:0.5];
C=[-0.5:0.01:1.5];
b=length(B);
c=length(C);
noise=zeros(b,c);
first_order=zeros(b,c);
sec_order=zeros(b,c);
for i=1:b
    for j=1:c
        a=1-3*B(i)-3*C(j);%zeroth order approximations
        %noise(i,j)=sqrt(a^2+3*B(i)^2+3*C(j)^2);
        noise(i,j)=sqrt(3*B(i)^2+3*C(j)^2);%no noise in alpha
        first_order(i,j)=3*abs(1-B(i)-2*C(j));
        %sec_order(i,j)=6*abs(1-C(j))+3*abs(1-B(i)-2*C(j));
        sec_order(i,j)=(1-C(j))^2+(1/2-B(i)/2-C(j))^2;%incoherent variation
    end
end
contour(C,B,noise,30,'r');
hold on
contour(C,B,sec_order,100,'g');
contour(C,B,first_order,30,'b');
xlabel('\gamma');
ylabel('\beta');

%second order approximation point
plot(1,-1,'black.','MarkerSize',20)
text(1.05,-1,'Second order approximation')

%minimal noise point first order
plot(1/2,0,'black.','MarkerSize',20)
text(1/2+0.05,0,'Minimal noise point (first order)')

%minimal noise point 
plot(1/7,1/7,'black.','MarkerSize',20)
text(1/7+0.05,1/7,'Minimal noise point')


%pareto of first order exact function, between noise and second order
%precision
plot([1,1/2],[-1,0],'c','LineWidth',2)
text(0.75,-0.5,'Pareto of first order exact functions','Color','c')
legend({'Noise contours','Second order contours','First order contours'});

sol=solve('-2*c^2+7*b*c+2*b^2+c-6*b=0','b');%drug combination (no noise in s0)
%sol=solve('5*b^2+28*b*c-22*b+16*c^2-20*c+5=0','b');%fitness landscape (noise in s0)


%Pareto of second order as quadratic and noise
sol=sol(1);
c_vec=[0:0.01:1];
b_vec=subs(sol,'c',c_vec);
plot(c_vec,b_vec,'r','LineWidth',2)

%pareto of first order and noise perfformance
plot([1/7,1/2],[1/7,0],'c','LineWidth',2)
text(1/4,1/4,'First order and noise contour intersection','Color','c')



plot([1/7,15/26],[1/7,-2/13],'c','LineWidth',2)


legend({'Noise contours','Second order contours','First order contours'});


