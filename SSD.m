function  [W]=SSD(A,m,k,W)
% The rank of A is greater than m;
% A is a square matrix, d is the number of rows and columns of A, m and k are positive integers less than or equal to d
    P=A*W*pinv(W'*A*W)*W'*A;
    d=size(P,1);
    a=diag(P);
    [~,Iid]=sort(a,'descend');
    Iid=Iid(1:k);
    Q=QItrans(d,Iid);
    Anew=Q'*A*Q;
    [V,Lambda]=eig(Anew);
    Lnew=diag(Lambda);
    [~,idn]=sort(Lnew,'descend');
    V1=V(:,idn(1:m));
    W=Q*V1;
end