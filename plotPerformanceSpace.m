%plot the drug combination functions in performance space..

B=[-3:0.01:3];
C=[-3:0.01:3];
b=length(B);
c=length(C);
noise=zeros(b,c);
first_order=zeros(b,c);
sec_order=zeros(b,c);
for i=1:b
    for j=1:c
        a=1-3*B(i)-3*C(j);
        noise(i,j)=sqrt(a^2+3*B(i)^2+3*C(j)^2);
        first_order(i,j)=3*abs(1-B(i)-2*C(j));
        sec_order(i,j)=6*abs(1-C(j))+3*abs(1-B(i)-2*C(j));
    end
end
%plot3(first_order,sec_order,noise,'.');
%hold on
%xlabel('first order distance');
%ylabel('second order distance');
%zlabel('noise')
plot(first_order,sec_order,'.b');
hold on
xlabel('first order distance');
ylabel('sec order distance');
xlim([0,3]);
ylim([0,3]);
hold off
figure;
plot(first_order,noise,'b.');
hold on
xlabel('first order distance');
ylabel('noise distance');
xlim([0,3]);
ylim([0,3]);
hold off
figure;
plot(sec_order,noise,'b.')
hold on
xlabel('sec order distance');
ylabel('noise distance');
xlim([0,3]);
ylim([0,3]);
hold off
