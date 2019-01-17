%taylor approx for different formula
syms x y z p a b c

S0=1;
S1=1+x+x^2/2;
S2=1+y+y^2/2;
S3=1+z+z^2/2;
S12=1+x+y+x^2/2+y^2/2+x*y;
S13=1+x+z+x^2/2+z^2/2+x*z;
S23=1+y+z+y^2/2+z^2/2+y*z;
S123=1+x+y+z+x^2/2+y^2/2+z^2/2+x*y+x*z+y*z;

% log linear

simplify(taylor(1/S123*(S12*S13*S23)^c*(S1*S2*S3)^b*S0^a,[x y z],[0 0 0],'Order',3))
simplify(taylor(S123-c*(S12+S13+S23)-b*(S1+S2+S3)-a*S0,[x y z],[0 0 0],'Order',3))

% GM
%All GM Are exact to second order!
aa=simplify(taylor(S123-(1/3*((S1*S23)^p+(S2*S13)^p+(S3*S12)^p))^(1./p),[x y z],[0 0 0],'Order',4))
res=sum(subs(abs(children(aa)),[x y z],[1 1 1]))

%%
%generalized mean script

tt=[-10.005:0.01:10];
wood_err=zeros(size(tt));
can_err=zeros(size(tt));
for i=1:length(tt)
    wood_err(i)=computeRMSGeneralizedMean(tt(i),Wood_bacteria);
    can_err(i)=computeRMSGeneralizedMean(tt(i),[cancer_doses_A549_1;cancer_doses_A549_2]);
end

figure
plot(tt,wood_err)
hold on
plot(tt,can_err)