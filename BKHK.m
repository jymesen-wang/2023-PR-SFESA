function [U,POS]=BKHK(X,p)

% X:sample matrix£¬d:the number of features£¬n:the numbe of samples
% p:the number of anchors is 2^p

[d,n]=size(X);
POS0{1}=1:n;
data{1}=X;

for i=0:p-1
    DATA=[];
    for j=1:(2^i)
    D=data{j};
    pos=POS0{j};
    [XC,idx,G]=BKHK2(D);
    POS{2*j-1}=pos(idx{1});
    POS{2*j}=pos(idx{2});
    DATA{(2*j)-1}=XC{1};
    DATA{(2*j)}=XC{2};
    end
    POS0=POS;
    data=DATA;
end

for k=1:2^p
    U(:,k)=mean(X(:,POS{k}),2);
end

end