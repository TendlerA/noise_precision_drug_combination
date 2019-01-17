function [ data ] = getDataFromComb( comb_vec )
%get data table from combination data

data=[];
for j=1:length(comb_vec)
    num_rep=comb_vec(j).num_repetition;
    if isnan(num_rep) || length(comb_vec(j).drugs)~=3
        continue
    end
    all_mat=[comb_vec(j).singles_mat;comb_vec(j).pairs_mat;comb_vec(j).results];
    %size(all_mat)
    remove_dup=unique(all_mat','rows')';%discard duplicate measurements
    data=[data;mean(remove_dup')];
end


end

