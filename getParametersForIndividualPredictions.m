function [ output_args ] = getParametersForIndividualPredictions( comb_vec )
%compute parameters for 

data = getDataFromComb(comb_vec);
size(data)
noise = getNoiseFromComb( comb_vec );
noise_performance=sqrt(3*sum(noise(:,[1:6]).^2,2));
mean_interaction=getMeanInteraction(data);
beta=getBestApprox(data);
%plot(noise_performance,beta,'.','MarkerSize',30)
%hold on
%plot(mean_interaction,beta,'r.','MarkerSize',30)
cond=abs(beta)<100;
scatter(noise_performance(cond),mean_interaction(cond),600,log(beta(cond)),'.')
%scatter(mean(noise(cond,[1:3]),2),mean(noise(cond,[4:6]),2),600,beta(cond),'.')
xlabel('Noise estimation')
ylabel('Interaction estimation')
title('Colored by optimal \beta for prediction')
beta
end



function [mean_int]=getMeanInteraction(data)
    ld=data;
    in12=(ld(:,4)-ld(:,1)-ld(:,2)).^2;
    in13=(ld(:,5)-ld(:,1)-ld(:,3)).^2;
    in23=(ld(:,6)-ld(:,2)-ld(:,3)).^2;
    mean_int=sqrt(in12+in13+in23);
end

function [beta]=getBestApprox(data)
    %ld=log(data);
    ld=data;
    beta=(ld(:,7)-2*sum(ld(:,[4:6]),2))./(sum(ld(:,[1:3]),2)-2*sum(ld(:,[4:6]),2));
end


function [ noise ] = getNoiseFromComb( comb_vec )
%get data table from combination data

noise=[];
for j=1:length(comb_vec)
    num_rep=comb_vec(j).num_repetition;
    if isnan(num_rep) || length(comb_vec(j).drugs)~=3
        continue
    end
    all_mat=[comb_vec(j).singles_mat;comb_vec(j).pairs_mat;comb_vec(j).results];
    %size(all_mat)
    remove_dup=unique(all_mat','rows')';%discard duplicate measurements
    noise=[noise;std(remove_dup')./size(remove_dup,2)^0.5];
end
end