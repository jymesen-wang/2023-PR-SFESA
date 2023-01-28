function  [W,F,S]=SFESA(L,X,alpha,m,k)
% L: Laplace matrix
% X: sample matrix, one column is one sample
% alpha: regularization parameters
% m: number of extracted features
% k: The number of original dimensions of data to be retained, and the number of selected features

[d,n]=size(X);
I=eye(n);
Ln=alpha*inv(L+alpha*I);
M=alpha*X*(Ln-I)*X';
M=(M+M')/2;
em=eig(M);
R=rank(M);
eta=sort(em);
if eta(1)<0
    M=M-(eta(1))*eye(d)+eps*eye(d);
end
em=eig(M);
R=rank(M);
eta=sort(em);

if R<=m
    [W]=SSDr(M,m,k);
else
    NITER=1;
    rr=0;
    while rr==0
        W0=rand(d,m);
        if rank(W0)==m;
            rr=1;
        else
            rr=0;
        end
    end
    id=randi(d,[1,d-k]);
    W0(id,:)=0;
    W0=orth(W0);
    [W,Obj1] = L20_SSD(M,k,W0,NITER,alpha);
end
F=Ln*X'*W;
[value,S]=sort(sum(W'.*W'),'descend');
S=S(1:m);

