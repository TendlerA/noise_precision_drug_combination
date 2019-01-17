function [res] = interpolate_data(data)
%interpolate the data batween 0 and 600
    vec=[0:600]';
    for i=1:length(data)
        mat=[];
        for j=1:round(size(data{i},2)/3)
            vec1=interp1(data{i}(:,3*j-2),data{i}(:,3*j-1),vec);
            vec2=interp1(data{i}(:,3*j-2),data{i}(:,3*j),vec);
            mat=[mat,vec,vec1,vec2];
        end
        res{i}=mat;
    end

end

