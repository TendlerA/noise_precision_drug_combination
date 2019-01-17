%plot the drug combination functions in performance space (only first order
%approx)

%plot the drug combination functions in performance space..

C=[-3:0.01:3];
B=1-2*C;
A=1-3*B-3*C;
noise=sqrt(A.^2+3*B.^2+3*C.^2);
sec_order=6*abs(1-C)+3*abs(1-B-2*C);


plot(sec_order,noise,'.b');
hold on
xlabel('ser order distance');
ylabel('noise');
xlim([0,3]);
ylim([0,3]);
hold off


