B=[-1.5:0.01:1];
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