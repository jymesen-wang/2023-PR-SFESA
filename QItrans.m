function  [Q]=QItrans(n,I)
% n:the number of rows of Q
% I:the sequence
    L=length(I);
    Q=zeros(n,L);
    for j=1:L
        Q(I(j),j)=1;
    end
end