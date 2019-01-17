function [ predPair,predMinNoise ] = pairFormula(FullyFactorialDataset)
singlets=FullyFactorialDataset([1:6]);
pairs=FullyFactorialDataset([7:21]);
triplets=[22:41];
quadruplets=[42:56];
quintuplets=[57:62];
sextuplet=63;

predPair=FullyFactorialDataset;
predMinNoise=FullyFactorialDataset;

%predict triplets;
M=3;
ind=22;
for i=1:6
    for j=i+1:6
        for k=j+1:6
            predPair(ind)=prod(pairs(allPairInd([i,j,k]))).^(1/(M-1));
            predMinNoise(ind)=prod(singlets([i,j,k])).^(1/(2*M-1))...
                *prod(pairs(allPairInd([i,j,k]))).^(2/(2*M-1));
            ind=ind+1;
        end
    end
end

M=4;
for i=1:6
    for j=i+1:6
        for k=j+1:6
            for l=k+1:6
                predPair(ind)=prod(pairs(allPairInd([i,j,k,l]))).^(1/(M-1));
                predMinNoise(ind)=prod(singlets([i,j,k,l])).^(1/(2*M-1))...
                *prod(pairs(allPairInd([i,j,k,l]))).^(2/(2*M-1));
                ind=ind+1;
            end
        end
    end
end

M=5;
for i=1:6
    for j=i+1:6
        for k=j+1:6
            for l=k+1:6
                for m=l+1:6
                    predPair(ind)=prod(pairs(allPairInd([i,j,k,l,m]))).^(1/(M-1));
                    predMinNoise(ind)=prod(singlets([i,j,k,l,m])).^(1/(2*M-1))...
                *prod(pairs(allPairInd([i,j,k,l,m]))).^(2/(2*M-1));
                    ind=ind+1;
                end
            end
        end
    end
end
M=6;
predPair(63)=prod(pairs).^(1/(M-1));
predMinNoise(63)=prod(pairs).^(2/(2*M-1))*prod(singlets).^(1/(2*M-1))


end

function [ out ] = allPairInd(list_ind)
    len=length(list_ind);
    out=[];
    for i=1:len
        for j=i+1:len
            out=[out,pairToInd(list_ind(i),list_ind(j))];
        end
    end
end


function [ out ] = pairToInd(i,j)
    A=[0,1,2,3,4,5;0,0,6,7,8,9;0,0,0,10,11,12;0,0,0,0,13,14;0,0,0,0,0,15];
    out=A(i,j);
end
