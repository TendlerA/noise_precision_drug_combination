%Script to get and analyze dnt data

%From Itay:
% Seq - list of the sequences.

% F0, F200 - bin distribution for each seq.

% B0, B200 - the bin limits (the same for both dnt0 and dnt200,B0=B200), B0(1) and B0(2) are the limits of bin 1, B0(3) and B0(4) are the limits of bin 2, ....

% b0, b200 - the mean of the data in each bin (which is different for dnt0 and dnt200)

% d0, d200 - the disterbution within the bin

% WTseq/WTind - the sequacnce/index of the WT

% BLseq/BLind - the sequence/index of Belkin mutant 

% MutationMatrix - matrix of 0-3 according to the type of mutation relative to the WT (can be calculated using Seq and WTseq)


%My pre-computed values
%s0=getSeqValues(F0,d0);
%s200=getSeqValues(F200,d200);
%pairExistMat=constructSinglePairDB(MutationMatrix,s0,3)
%dnt_dataset0=constructMultipletsDB(MutationMatrix,s0,pairExistMat,3);
%dnt_dataset200=constructMultipletsDB(MutationMatrix,s200,pairExistMat,3);
%a0=dnt_dataset0(:,[2:8])-repmat(dnt_dataset0(:,1),[1,7]);
%a200=dnt_dataset200(:,[2:8])-repmat(dnt_dataset200(:,1),[1,7]);

load('./data/dnt_data2.mat')
% s0=getSeqValues(F0,d0);
% s200=getSeqValues(F200,d200);
% pairExistMat=constructSinglePairDB(MutationMatrix)
% dnt_dataset0=constructMultipletsDB(MutationMatrix,s0,pairExistMat,3);
% dnt_dataset200=constructMultipletsDB(MutationMatrix,s200,pairExistMat,3);
% a0=dnt_dataset0(:,[2:8])-repmat(dnt_dataset0(:,1),[1,7]);
% a200=dnt_dataset200(:,[2:8])-repmat(dnt_dataset200(:,1),[1,7]);

% dnt200_mWT=dnt_dataset200(:,2:8)-repmat(dnt_dataset200(:,1),[1,7]);
% dnt0_mWT=dnt_dataset0(:,2:8)-repmat(dnt_dataset0(:,1),[1,7]);
% save('./data/dnt_data2.mat')

function [s]=getSeqValues(F,d)
%F is the bin distribution for each sequence, d is cell array for distribution in each bin

	%computed as the mean of means of bins
	%b=cellfun(@(x)mean(log10(x)),d);
	%s=F*b'./sum(F,2);
	%reccompute, since it was already log scale:
	b=cellfun(@(x)mean(x),d);
	s=F*b'./sum(F,2);
	
	
	%We can alternatively compute it using monte-carlo algorithm
	%Currently too much computational effort for some reason
	% num_iter=10;
	% logd=cellfun(@(x)mean(log10(x)),d);
	% samples=zeros(size(F));
	% s=zeros(size(F,1),num_iter);
	% for it=1:num_iter
		% for i=1:size(F,1)%num sequences
			% for j=1:size(F,2)%num bins
				% samples(i,j)=mean(randsample(d{j},F(i,j),true));
			% end
		% end
		% s(:,it)=mean(samples,2);
	% end
	% s=mean(s,2);	
end

function pairExistMat=constructSinglePairDB(MutationMatrix)
	singles=find(sum(MutationMatrix>0,2)==1);
	pairs=find(sum(MutationMatrix>0,2)==2);
	pairsMutMat=MutationMatrix(pairs,:);
	singlesMutMat=MutationMatrix(singles,:);

	
	%construct the matrix of existing pairs
	pairExistMat=zeros(length(singles));
	for i=1:length(pairs)
		if mod(i,100)==0
			i
		end
		seq1=MutationMatrix(pairs(i),:);
		seq2=seq1;
		idxs=find(seq1);
		seq1(idxs(1))=0;
		idx1=find(ismember(singlesMutMat,seq1,'rows'));
		%assert(length(idx1)==1);
		seq2(idxs(2))=0;
		idx2=find(ismember(singlesMutMat,seq2,'rows'));
		%assert(length(idx2)==1);
		pairExistMat(idx1,idx2)=pairs(i);
		pairExistMat(idx2,idx1)=pairs(i);
	end	
end


function dataset=constructMultipletsDB(MutationMatrix,s,pairExistMat,k)
	%MutationMatrix is the matrix of mutations, s is the output values of the sequences, k is the number of mutations (3 for triplets, etc.)
	multiplets=find(sum(MutationMatrix>0,2)==k);
	WT=find(sum(MutationMatrix>0,2)==0);
	singles=find(sum(MutationMatrix>0,2)==1);
	pairs=find(sum(MutationMatrix>0,2)==2);
	singlesMutMat=MutationMatrix(singles,:);

	n=1+k+nchoosek(k,2)+1;
	dataset=zeros(length(multiplets),n);
	%construct data for each multiplet
	for i=1:length(multiplets)
		if mod(i,100)==0
			i
		end
		data_row=zeros(1,n);
		data_row(1)=s(WT);
		data_row(n)=s(multiplets(i));
		seq=MutationMatrix(multiplets(i),:);
		idxs=find(seq);
		count=1;
		%go over the relevant singles
		mut_inds=zeros(k,1);
		for j=1:k
			single=zeros(1,length(seq));
			single(idxs(j))=seq(idxs(j));
			mut_inds(j)=find(ismember(singlesMutMat,single,'rows'));
			count=count+1;
			data_row(count)=s(singles(mut_inds(j)));
		end

		%check if all underliyng pairs exist
		flag=1;
		for j1=1:k
			for j2=j1+1:k
				a=pairExistMat(mut_inds(j1),mut_inds(j2));
				if a==0
					flag=0;
				else
					count=count+1;
					data_row(count)=s(a);
				end
			end
		end
		if flag==1
			dataset(i,:)=data_row;
		end
	end
	%delete zeros rows
	dataset( ~any(dataset,2), : ) = [];
end