%draw contours of first order performnace function and noise

B=[-1.5:0.01:0.5];
C=[-0.5:0.01:1.5];
b=length(B);
c=length(C);
noiseDC=zeros(b,c);
first_order=zeros(b,c);
noiseFL=zeros(b,c);
for i=1:b
    for j=1:c
        a=1-3*B(i)-3*C(j);%zeroth order approximations
        noiseFL(i,j)=sqrt(a^2+3*B(i)^2+3*C(j)^2);
        noiseDC(i,j)=sqrt(3*B(i)^2+3*C(j)^2);%no noise in alpha
        first_order(i,j)=3*abs(1-B(i)-2*C(j));
    end
end
first_noiseDCline=[0,0;2/5,1/5];%format (gamma,beta)
first_noiseFLline=[1/7,1/7;1/2,0];%format (gamma,beta)


subplot(1,2,1);
hold on
contour(C,B,noiseDC,30,'r');
contour(C,B,first_order,30,'b');
plot(first_noiseDCline(:,1),first_noiseDCline(:,2),'black','LineWidth',2);
%minimal noise point first order
plot(2/5,1/5,'black.','MarkerSize',20)
text(2/5+0.05,1/5,'Minimal noise point (first order)')
%minimal noise point 
plot(0,0,'black.','MarkerSize',20)
text(0.05,0,'Minimal noise point')
xlabel('\gamma');
ylabel('\beta');

subplot(1,2,2);
hold on
contour(C,B,noiseFL,30,'r');
contour(C,B,first_order,30,'b');
plot(first_noiseFLline(:,1),first_noiseFLline(:,2),'black','LineWidth',2);
%minimal noise point first order
plot(1/2,0,'black.','MarkerSize',20)
text(1/2+0.05,0,'Minimal noise point (first order)')
%minimal noise point 
plot(1/7,1/7,'black.','MarkerSize',20)
text(1/7+0.05,1/7,'Minimal noise point')
xlabel('\gamma');
ylabel('\beta');

