function [XC,idxt,G]=BKHK2(X)

% X:sample matrix£¬d:the number of features£¬n:the numbe of samples

p=2;
[d,n]=size(X);
[~,c]=kmeans(X',2);
C0=c';
k=floor(n/2);
E=zeros(n,2);
e=1;
epsilon=10^(-6);
while e>epsilon
    for i=1:n
        for j=1:2
            E(i,j)=norm(X(:,i)-C0(:,j),2)^2;
        end
    end
    delta_e=E(:,1)-E(:,2);
    [S,idx]=sort(delta_e);
    idx1=idx(1:k);
    idx2=idx(k+1:end);
    g=zeros(n,1);
    g(idx1)=1;
    G=[g,1-g];
    XC{1}=X(:,idx1);
    XC{2}=X(:,idx2);
    C1=mean(XC{1},2);
    C2=mean(XC{2},2);
    C=[C1,C2];
    e=norm(C0-C,2);
    C0=C;
end
idxt{1}=idx1;
idxt{2}=idx2;
end