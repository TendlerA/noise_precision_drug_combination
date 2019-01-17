%index pairs

%% get indices of each first of pairs
load('../data/pairs.mat');
m=size(pair_mat.Strain1,1);
unique_Strain1_names=unique(pair_mat.Strain1,'rows');
unique_Strain2_names=unique(pair_mat.Strain2,'rows');

k=size(unique_Strain1_names,1);
unique_Strain1_names(1,:)=pair_mat.Strain1(1,:);
unique_Strain1_indices=ones(k,1);
ind=1;
for i=1:m-1
    if ~strcmp(pair_mat.Strain1(i,:),pair_mat.Strain1(i+1,:))
        ind=ind+1;
        unique_Strain1_indices(ind)=i;
        unique_Strain1_names(ind,:)=pair_mat.Strain1(i+1,:);
    end
end
unique_Strain1_indices=[unique_Strain1_indices;size(pair_mat.Strain1,1)+1];

%% get indices for each first pair in triplet
load('../data/triplets.mat');
m=size(triplet_mat.Query_strain_ID,1);
unique_query_names=unique(triplet_mat.Query_strain_ID,'rows');

k=size(unique_query_names,1);
unique_query_names(1,:)=triplet_mat.Query_strain_ID(1,:);
unique_query_indices=ones(k,1);
ind=1;
for i=1:m-1
    if ~strcmp(triplet_mat.Query_strain_ID(i,:),triplet_mat.Query_strain_ID(i+1,:))
        ind=ind+1;
        unique_query_indices(ind)=i;
        unique_query_names(ind,:)=triplet_mat.Query_strain_ID(i+1,:);
    end
end

unique_query_indices=[unique_query_indices;size(triplet_mat.Query_strain_ID,1)+1];


%% find when the two query elements exists

m=size(unique_query_names,1);
unique_query_exists=ones(m,1);

yeast_effects=[];
yeast_stds=[];
yeast_names=[];


for i=1:m
    i
    long_names=strsplit(unique_query_names(i,:),'+');
    name1=strsplit(long_names{1},'_');
    name1=pad(name1{1},16);
    name2=strsplit(long_names{2},'_');
    name2=pad(name2{1},16);
    %check if names exist in pair table
    exist11=ismember(name1,unique_Strain1_names,'rows');
    exist12=ismember(name1,unique_Strain2_names,'rows');
    exist21=ismember(name2,unique_Strain1_names,'rows');
    exist22=ismember(name2,unique_Strain2_names,'rows');
    if ~exist11 && ~exist12
        continue
    end
    if ~exist21 && ~exist22
        continue
    end
    
    %search for the array
    for j=unique_query_indices(i):unique_query_indices(i+1)
        %find the third element in the array
        name3=triplet_mat.Array_strain_ID(j,:);
        name3=strsplit(name3,'_');
        name3=pad(name3{1},16);
        exist31=ismember(name3,unique_Strain1_names,'rows');
        exist32=ismember(name3,unique_Strain2_names,'rows');
        %Search for the s13
        flag=0;
        if ~flag && exist31 && exist12
            [aa ind]=ismember(name3,unique_Strain1_names,'rows');
            search_mat=pair_mat.Strain2(unique_Strain1_indices(ind):unique_Strain1_indices(ind+1)-1,:);
            [aa ind2]=ismember(name1,search_mat,'rows');
            if ind2
                pair_index1=unique_Strain1_indices(ind)-1+ind2;
                flag=1;
                ind13=0;
            end
        end
        if ~flag && exist32 && exist11
            [aa ind]=ismember(name1,unique_Strain1_names,'rows');
            search_mat=pair_mat.Strain2(unique_Strain1_indices(ind):unique_Strain1_indices(ind+1)-1,:);
            [aa ind2]=ismember(name3,search_mat,'rows');
            if ind2
                pair_index1=unique_Strain1_indices(ind)-1+ind2;
                flag=1;
                ind13=1;
            end
        end
        if ~flag %No s13 pair
            continue
        end

        
        flag=0;
        if ~flag && exist31 && exist22
            [aa ind]=ismember(name3,unique_Strain1_names,'rows');
            search_mat=pair_mat.Strain2(unique_Strain1_indices(ind):unique_Strain1_indices(ind+1)-1,:);
            [aa ind2]=ismember(name2,search_mat,'rows');
            if ind2
                pair_index2=unique_Strain1_indices(ind)-1+ind2;
                flag=1;
                ind23=0;
            end
        end
        if ~flag && exist32 && exist21
            [aa ind]=ismember(name2,unique_Strain1_names,'rows');
            search_mat=pair_mat.Strain2(unique_Strain1_indices(ind):unique_Strain1_indices(ind+1)-1,:);
            [aa ind2]=ismember(name3,search_mat,'rows');
            if ind2
                pair_index2=unique_Strain1_indices(ind)-1+ind2;
                flag=1;
                ind23=1;
            end
        end
        if ~flag %No s23 pair
            continue
        end
        
        %all is good, add data to matrix
        
        %S13  
        s1_temp=str2num(pair_mat.s1(pair_index1,:));
        std1_temp=str2num(pair_mat.std1(pair_index1,:));
        s2_temp=pair_mat.s2(pair_index1);
        std2_temp=pair_mat.std2(pair_index1);
        %s12_vec_temp=[pair_mat.s12_1(pair_index1),pair_mat.s12_2(pair_index1)];
        %s13=mean(s12_vec_temp);
        %std13=std(s12_vec_temp);
        s13=pair_mat.s12_2(pair_index2);
        std13=pair_mat.UK4(pair_index2);
        if ind13
            s1=s1_temp;
            s3=s2_temp;
            std1=std1_temp;
            std3=std2_temp;
        else
            s1=s2_temp;
            s3=s1_temp;
            std1=std2_temp;
            std3=std1_temp;          
        end
        
        %S23  
        s1_temp=str2num(pair_mat.s1(pair_index2,:));
        std1_temp=str2num(pair_mat.std1(pair_index2,:));
        s2_temp=pair_mat.s2(pair_index2);
        std2_temp=pair_mat.std2(pair_index2);
        %s12_vec_temp=[pair_mat.s12_1(pair_index2),pair_mat.s12_2(pair_index2)];
        %s23=mean(s12_vec_temp);
        %std23=std(s12_vec_temp);
        s23=pair_mat.s12_2(pair_index2);
        std23=pair_mat.UK4(pair_index2);
        if ind23
            s2=s1_temp;
            s3=s2_temp;
            std2=std1_temp;
            std3=std2_temp;
        else
            s2=s2_temp;
            s3=s1_temp;
            std2=std2_temp;
            std3=std1_temp;          
        end
        s12=triplet_mat.Query_single0x2Fdouble_mutant_fitness(j);
        s123=triplet_mat.Combined_mutant_fitness(j);
        std123=triplet_mat.Combined_mutant_fitness_standard_deviation(j);
        yeast_effects=[yeast_effects;[s1,s2,s3,s12,s13,s23,s123]];
        yeast_stds=[yeast_stds;[std1,std2,std3,std13,std23,std123]];
        yeast_names=[yeast_names;[name1,name2,name3]];
    end
        
end
save('../data/yeastdata.mat','yeast_effects','yeast_stds','yeast_names');

%% For each triplet find if the corresponding pairs exist and add to data
%this is probably not what we want
% m=size(unique_query_names,1);
% unique_query_exists=zeros(m,1);
% 
% yeast_effects=[];
% yeasr_sts=[];
% names=[];
% 
% 
% for i=1:m
%     long_names=strsplit(unique_query_names(i,:),'+');
%     name1=strsplit(long_names{1},'_');
%     name1=pad(name1{1},16);
%     name2=strsplit(long_names{2},'_');
%     name2=pad(name2{1},16);
%     %check if names exist in pair table
%     if ismember(name1,unique_Strain1_names,'rows') && ismember(name2,unique_Strain2_names,'rows')
%         unique_query_exists(i)=1;
%     end
%     if ismember(name2,unique_Strain1_names,'rows') && ismember(name1,unique_Strain2_names,'rows')
%         unique_query_exists(i)=1;
%         temp=name1;
%         name1=name2;
%         name2=temp;
%     end
%     if ~unique_query_exists(i)
%         continue
%     end
%     %get the data for the pair
%     [temp ind]=ismember(name1,unique_Strain1_names,'rows');
%     [temp ind2]=ismember(pair_mat.Strain2(unique_Strain1_indices(ind):unique_Strain1_indices(ind+1)-1,:),name2);
%     index=unique_Strain1_indices(ind)+ind2-1;%the index of the corresponding pair in the data
%     s1=str2num(pair_mat.s1(index,:);
%     std1=str2num(pair_mat.std1(index,:);
%     s2=pair_mat.s2(index);
%     std2=pair_mat.std2(index);
%     s12_vec=[pair_mat.s12_1(index),pair_mat.s12_2(index)];
%     s12=mean(s12_vec);
%     std12=std(s12_vec);
%     
%     
% end




 