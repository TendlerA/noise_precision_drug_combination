function [sing_mean,sing_std,sing_n] = get_mean_std_singles(single_dat)
%for singles mat compute the mean and std
    m=length(single_dat);
    %sing_mean=zeros(m,1);
    %sing_std=zeros(m,1);
    for i=1:m
        sing_mean{i}=mean(single_dat{i}(:,3:3:end),2);%3?
        sing_std{i}=std(single_dat{i}(:,3:3:end)')';%3?
        sing_n{i}=round(size(single_dat{i},2)/3);
    end
end

