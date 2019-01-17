%% get the data
[single_names,single_paths]=getFilePathsNames('./calcium/calcium_single_RAW264.7/*.txt');
[pair_names,pair_paths]=getFilePathsNames('./calcium/calcium_double_RAW264.7/*.txt');
single_dat=filePathsToTables(single_paths);
single_dat=interpolate_data(single_dat);
pair_dat=filePathsToTables(pair_paths);
pair_dat=interpolate_data(pair_dat);
[sing_mean,sing_std,sing_n] = get_mean_std_singles(single_dat);

%% analysis
%get single with strong effect
relevant_singles=find(cellfun(@(x)(max(x)>5),sing_mean));
%relevant_singles=[1:length(single_dat)];

%count the singles corresponding to each pair
num_pairs=zeros(length(relevant_singles));
for i=1:length(relevant_singles)-1
    for j=i+1:length(relevant_singles)
        num_pairs(i,j)=length(get_corresponding_pairs(single_names{i},single_names{j},pair_names));
        num_pairs(j,i)=num_pairs(i,j);
    end
end

%get possible triplets
triplet_list=[];
for i=1:length(relevant_singles)-2
    for j=i+1:length(relevant_singles)-1
        for k=j+1:length(relevant_singles)
            if ((num_pairs(i,j)>0) & (num_pairs(i,k)>0) & (num_pairs(j,k)>0))
                triplet_list=[triplet_list;[i,j,k]];
            end
        end
    end
end

%% generate triplet predictions
m=size(triplet_list,1);
for i=1:m
        i1=relevant_singles(triplet_list(i,1));
        i2=relevant_singles(triplet_list(i,2));
        i3=relevant_singles(triplet_list(i,3));
        [data stdat]=organizeDataForPrediction(i1,i2,i3,single_dat,pair_dat,single_names,pair_names);
        triplet_names{i}=strcat(single_names{i1}(1:end-7),'_',single_names{i2}(1:end-7),'_',single_names{i3}(1:end-7));
        triplet_regression=generate_linear_prediction(data,-1,1);
        triplet_bliss=generate_linear_prediction(data,1,0);
        triplet_pairs=generate_linear_prediction(data,0.5,0.5);
end


%% plot singles and pairs
def_color=get(gca,'ColorOrder');
%for i=1:size(triplet_list,1)
for i=2:5
    subplot(2,2,i-1);
    %figure;
    hold on;
    i1=relevant_singles(triplet_list(i,1));
    i2=relevant_singles(triplet_list(i,2));
    i3=relevant_singles(triplet_list(i,3));
    [data stdat]=organizeDataForPrediction(i1,i2,i3,single_dat,pair_dat,single_names,pair_names);
    h1=plot(data(:,1),'color',def_color(1,:));
    plot(data(:,2),'color',def_color(1,:));
    plot(data(:,3),'color',def_color(1,:));
    h2=plot(data(:,4),'color',def_color(2,:));
    plot(data(:,5),'color',def_color(2,:));
    plot(data(:,6),'color',def_color(2,:));
    [b c]=get_optimal_formula_time_series(data,stdat);
    %plot(100*b,'black')
    %plot(100*c,'black')
    h3=plot(generate_linear_prediction(data,0.5,0.5),'color',def_color(3,:));
    h4=plot(generate_linear_prediction(data,-1,1),'color',def_color(4,:));
    h5=plot(generate_linear_prediction(data,1,0),'color',def_color(5,:));
    xlabel('Time [sec]')
    ylabel('Calcium [nM]')
    name=strcat(single_names{i1}(1:end-7),'+',single_names{i2}(1:end-7),'+',single_names{i3}(1:end-7));
    name=strrep(name,'_',' ');
    title(name);
    legend([h1,h2,h3,h4,h5],'Singles','Pairs','Pairs formula','Regression formula','Bliss formula');
end



