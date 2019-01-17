function [ orgData ] = organizeUniProbeData( st_dat )
%convert UniProbeData to more convenient form
len=4^8;
orgData=zeros(len,1);
textdat=st_dat.textdata(2:end,:);
rawdat=st_dat.data;
num=size(rawdat,1);
for i=1:num
    ind1=text2num(textdat{i,1})+1;
    ind2=text2num(textdat{i,2})+1;
    val=rawdat(i,1);
    orgData(ind1)=val;
    orgData(ind2)=val;
end

end


function n=text2num(st)
    st=strrep(st,'A','0');
    st=strrep(st,'C','1');
    st=strrep(st,'G','2');
    st=strrep(st,'T','3');
    n=base2dec(st,4);

end
