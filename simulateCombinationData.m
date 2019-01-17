function [ dataMatrix ] = simulateCombinationData( eps,sigma )
% generate a simulated dataset
data_size=300;
dataMatrix=zeros(data_size,8);
coeffs=rand(1,7);
for i=1:data_size
    r=rand(1,3);
    dataMatrix(i,1)=randomFunctionDeg3Var3(r.*[0,0,0],coeffs)+normrnd(0,sigma);
    dataMatrix(i,2)=randomFunctionDeg3Var3(r.*[eps,0,0],coeffs)+normrnd(0,sigma);
    dataMatrix(i,3)=randomFunctionDeg3Var3(r.*[0,eps,0],coeffs)+normrnd(0,sigma);
    dataMatrix(i,4)=randomFunctionDeg3Var3(r.*[0,0,eps],coeffs)+normrnd(0,sigma);
    dataMatrix(i,5)=randomFunctionDeg3Var3(r.*[eps,eps,0],coeffs)+normrnd(0,sigma);
    dataMatrix(i,6)=randomFunctionDeg3Var3(r.*[eps,0,eps],coeffs)+normrnd(0,sigma);
    dataMatrix(i,7)=randomFunctionDeg3Var3(r.*[0,eps,eps],coeffs)+normrnd(0,sigma);
    dataMatrix(i,8)=randomFunctionDeg3Var3(r.*[eps,eps,eps],coeffs)+normrnd(0,sigma);
end


end

