function res_mat=filePathsToTables(paths)
    width=3;
    for i=1:length(paths)
        stream=textread(paths{i},'%s');
        bools=cellfun(@(x)(strlength(x)>10 & strcmp(x(1:min(3,strlength(x))),'Ca+')),stream);
        idx=find(bools,1,'last');
        stream=stream(idx+1:end);
        stream=cellfun(@(x)str2num(x),stream);
        all_times=stream(1:width:end);
        num_exps=round(sum(bools)/2);
        res_mat{i}=reshape(stream,[width*num_exps,round(length(stream)/width/num_exps)])';

    end
end
