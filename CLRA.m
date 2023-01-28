function [L,P]=CLRA(X,U,s)
% X£ºsample matrix
% U:anchor matrix
% s:the number of neighbors

[d,n]=size(X);
[d1,n1]=size(U);
H=zeros(n,n1);
for i=1:n
    for j=1:n1
        H(i,j)=norm(X(:,i)-U(:,j),2)^2;
    end
    [HS(i,:),POSH(i,:)]=sort(H(i,:));
end

%calculate B
for i=1:n
    for j=1:n1
        if j>s
            B(i,POSH(i,j))=0;
        else
            B(i,POSH(i,j))=(HS(i,s+1)-HS(i,j))/sum(HS(i,s+1)-HS(i,1:s));
        end
    end
end

Delta=diag(sum(B))+eps;
I=eye(n);
A=zeros(n,n);
A=B*inv(Delta)*B';
P=B*Delta^(-0.5);
A=(A+A')/2;
L=I-A;
end