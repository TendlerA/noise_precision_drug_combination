cancer_H1299=xlsread('./Anat data.xlsx',1);
cancer_HeLa=xlsread('./Anat data.xlsx',2);
mutations_Hartl=xlsread('./Anat data.xlsx',3);
Wood_bacteria=xlsread('./Anat data.xlsx',4);
cancer_doses_A549_1=xlsread('./Anat data.xlsx',5);
cancer_doses_A549_2=xlsread('./Anat data.xlsx',6);
load('DatasetsFromEColiDBFolder.mat');
EcoliEmergent=csvread('./EcoliEmergent.csv')./100;

%get the repetition data format
load('H1299_comb_vec.mat')
H1299_comb=getDataFromComb(comb_vec);
load('HeLa_comb_vec.mat')
HeLa_comb=getDataFromComb(comb_vec);

%get yeast data
load('./yeastdata.mat');
ind=sum(isnan(yeast_effects),2)==0 & min(yeast_effects,[],2)>0.1;%remove negative values etc.
yeast_effects=yeast_effects(ind,:);
yeast_names=yeast_names(ind,:);
yeast_stds=yeast_stds(ind,:);

% %% get UniProbe Randomized data
% % this code get samples of uniprobe dat in the standard form (output in
% % allUniprobeDat.mat
% PATH='C:\Users\ggazi_000\Google Drive\Other projects\drug combination after india\data\UniProbe';
% files=dir(PATH);
% directoryNames = {files([files.isdir]).name};
% directoryNames = directoryNames(~ismember(directoryNames,{'.','..'}))
% len=length(directoryNames);

% allUniProbeDat={};
% for i=1:len
    % i
    % f=dir(strcat(PATH,'\',directoryNames{i},'\*.txt'));
    % strcat(PATH,'\',directoryNames{i},'\',f.name);
    % st_dat=importdata(strcat(PATH,'\',directoryNames{i},'\',f(1).name));
    % org_dat=organizeUniProbeData(st_dat);
    % rand_mat=fullyFactorialToRandomPairs(org_dat,1000);
    % rawUniProbeDat{i}=org_dat;
    % allUniProbeDat{i}=rand_mat;
    % %further evaluation to get random data matrix
% end

