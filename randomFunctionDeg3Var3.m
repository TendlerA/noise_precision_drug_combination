function [ F ] = randomFunctionDeg3Var3( x,coeff )
%coeff should be a vector of length 7 
 x=[1;sum(x);sumsqr(x);sum(x.^3);prod(x);x(1)*x(2)+x(1)*x(3)+x(2)*x(3);...
     x(1)^2*x(2)+x(2)^2*x(1)+x(1)^2*x(3)+x(1)*x(3)^2+x(2)^2*x(3)+x(2)*x(3)^2];

%x=[1;sum(sin(x));sumsqr(cos(x));cos(sum(x.^3));sin(prod(x));cos(x(1)*x(2)+x(1)*x(3)+x(2)*x(3));...
%    cos(x(1)^2*x(2)+x(2)^2*x(1)+x(1)^2*x(3)+x(1)*x(3)^2+x(2)^2*x(3)+x(2)*x(3)^2)];

%x=[sum(x.^4);sum(x.^5);sumsqr(x);sum(x.^3);prod(x);x(1)*x(2)+x(1)*x(3)+x(2)*x(3);...
%    x(1)^2*x(2)+x(2)^2*x(1)+x(1)^2*x(3)+x(1)*x(3)^2+x(2)^2*x(3)+x(2)*x(3)^2];

% x(1)=0;%To get 0 in (0,0,0), only for drug combination

F=coeff*x;

%F=1./(1+exp(coeff(1)*x(1)+coeff(2)*x(2)+coeff(3)*x(3)));

end

