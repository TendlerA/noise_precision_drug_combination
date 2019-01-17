function [idx] = get_corresponding_pairs(single1,single2,pairs_list)
%get the pair corresponding to two singles
    idx=[];
    for i=1:length(pairs_list)
        if(length(strfind(pairs_list{i},single1(1:5)))>0 & length(strfind(pairs_list{i},single2(1:5))>0))
            idx=[idx,i];
        end
    end
end

