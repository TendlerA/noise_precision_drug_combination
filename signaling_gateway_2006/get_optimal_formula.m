function [b,c] = get_optimal_formula(effect,interaction,sig)
%UNTITLED17 Summary of this function goes here
%   Detailed explanation goes here
%syms b c eff inter sig
%err=sqrt(3*b+3*c)*sig+3*(1-b-2*c)^2*eff+3*((1/2-b/2-c)^2+(1-c)^2)*inter^2
%err=sqrt(3*b+3*c)*sig+3*(1-b-2*c)^2*eff+3*((1/2-b/2-c)^2+(1-c)^2)*inter^2

res=fminsearch(@(x)sqrt(3*x(1)+3*x(2))*100*sig+3*(1-x(1)-2*x(2))^2*effect+3*((1/2-x(1)/2-x(2))^2+(1-x(2))^2)*interaction,[0,0.5]);
b=res(1);
c=res(2);
end
% n=21;
% b=zeros(n);
% c=zeros(n);
% for i=[1:n]
%     for j=[1:n]
%         effect=1;
%         sig=2.^(i-(n+1)/2);
%         interaction=2.^(j-(n+1)/2);;
%         res=fminsearch(@(x)sqrt(3*x(1)+3*x(2))*sig+3*(1-x(1)-2*x(2))^2*effect+3*((1/2-x(1)/2-x(2))^2+(1-x(2))^2)*interaction,[0,0.5]);
%         b(i,j)=res(1);
%         c(i,j)=res(2);
%     end
% end