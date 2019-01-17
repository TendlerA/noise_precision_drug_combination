function [s123] = generate_linear_prediction(data,b,c)
    
    s123=b*sum(data(:,1:3),2)+c*sum(data(:,4:6),2);
end

