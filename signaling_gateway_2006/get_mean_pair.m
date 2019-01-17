function [pair_mean] = get_mean_pair(single1,single2,pairs_list,pairs_dat)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
    pair_indx=get_corresponding_pairs(single1,single2,pairs_list);
    mat=[];
    for i=1:length(pair_indx)
        mat=[mat,pairs_dat{i}(:,3)];%3?
    end
   pair_mean=mean(mat,2); 
end

