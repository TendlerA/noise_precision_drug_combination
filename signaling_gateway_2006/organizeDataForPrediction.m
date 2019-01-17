function [mean_mat,std_mat] = organizeDataForPrediction(i1,i2,i3,single_dat,pair_dat,single_names,pair_names)
    % construct matrix of singles and pairs + estimated stds for singles
    [sing_mean,sing_std,sing_n] = get_mean_std_singles(single_dat);
    s12=get_mean_pair(single_names{i1},single_names{i2},pair_names,pair_dat);
    s13=get_mean_pair(single_names{i1},single_names{i3},pair_names,pair_dat);
    s23=get_mean_pair(single_names{i2},single_names{i3},pair_names,pair_dat);
    mean_mat=[sing_mean{i1},sing_mean{i2},sing_mean{i3},s12,s13,s23];
    std_mat=[sing_std{i1},sing_std{i2},sing_std{i3}];
    
    
end

