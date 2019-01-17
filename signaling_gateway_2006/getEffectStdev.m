function [effect,interaction,sig] = getEffectStdev(data,std_mat)
% compute the mean effect and stdev
    sig=mean(std_mat,2);
    interaction=mean(abs([data(:,4)-data(:,1)-data(:,2),data(:,5)-data(:,1)-data(:,3),data(:,6)-data(:,2)-data(:,3)]),2);
    effect=mean(abs(data(:,1:3)),2);
end

