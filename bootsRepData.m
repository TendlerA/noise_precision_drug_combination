function [ alpha_beta_mat ] = bootsRepData( comb_vec )
%bootstrapping the repeated experiments to check Anat's results
num_boots=100;
alpha_beta_mat=[];
for i=1:num_boots
    X=[];
    y=[];
    for j=1:length(comb_vec)
        num_rep=comb_vec(j).num_repetition;
        if isnan(num_rep)
            continue
        end
        all_mat=[comb_vec(j).singles_mat;comb_vec(j).pairs_mat;comb_vec(j).results];
        remove_dup=unique(all_mat','rows')';%discard duplicate measurements
        good_measures=find(sum(abs(zscore(remove_dup')')>2)==0);%remove outliers if 2 STD far
        rep_choose=randsample(good_measures,length(good_measures),1);
        %rep_choose=good_measures; for no bootstrapping
        sing=sum(mean(log(remove_dup(1:3,rep_choose)),2));
        pair=sum(mean(log(remove_dup(4:6,rep_choose)),2));
        res=mean(log(remove_dup(7,rep_choose)));
        X=[X;[sing,pair]];
        y=[y;res];
    end
    alpha_beta_mat=[alpha_beta_mat,regress(y,X)];
end

end

