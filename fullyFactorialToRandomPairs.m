function [ pairtab ] = fullyFactorialToRandomPairs( org_dat,num_pairs )
%generate matrix of random pair interaction from all the data
    pairtab=zeros(num_pairs,8);
    for i=1:num_pairs
            s0=randi(4^8,1)-1;
            mut_loc=randsample(8,3);
            mut_type=randi(3,3,1);
            s1=makeSingleChange(s0,mut_loc(1),mut_type(1));
            s2=makeSingleChange(s0,mut_loc(2),mut_type(2));
            s3=makeSingleChange(s0,mut_loc(3),mut_type(3));
            s12=makeSingleChange(s1,mut_loc(2),mut_type(2));
            s13=makeSingleChange(s1,mut_loc(3),mut_type(3));
            s23=makeSingleChange(s2,mut_loc(3),mut_type(3));
            s123=makeSingleChange(s12,mut_loc(3),mut_type(3));
            
            pairtab(i,1)=org_dat(s0+1);
            pairtab(i,2)=org_dat(s1+1);
            pairtab(i,3)=org_dat(s2+1);
            pairtab(i,4)=org_dat(s3+1);
            pairtab(i,5)=org_dat(s12+1);
            pairtab(i,6)=org_dat(s13+1);
            pairtab(i,7)=org_dat(s23+1);
            pairtab(i,8)=org_dat(s123+1);

    end

end

function [changed]=makeSingleChange(old_ind,loc,mut)
    st4=dec2base(old_ind,4,8);
    st4(loc)=num2str(mod(str2num(st4(loc))+mut,4));
    changed=base2dec(st4,4);
end