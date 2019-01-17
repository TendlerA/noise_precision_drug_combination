function [b,c] = get_optimal_formula_time_series(data,std_mat)
%UNTITLED18 Summary of this function goes here
%   Detailed explanation goes here
    [effect,interaction,sig] = getEffectStdev(data,std_mat);
    m=length(effect);
    b=zeros(m,1);
    c=zeros(m,1);
    for i=1:m
        [b(i),c(i)] = get_optimal_formula(effect(i),interaction(i),sig(i));
    end
end

