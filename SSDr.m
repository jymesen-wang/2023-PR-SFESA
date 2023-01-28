function  [W]=SSDr(A,m,k)
% The rank of A is less than or equal to m;
% A is a square matrix, d is the number of rows and columns of A, m and k are positive integers less than or equal to d
    d=size(A,1);
    a=diag(A);
    [~, Iid]=sort(a,'descend');
    Iid=Iid(1:k);
    Q=QItrans(d,Iid);
    Anew=Q'*A*Q;
    [V,Lambda]=eig(Anew);
    Lnew=diag(Lambda);
    [~,idn]=sort(Lnew,'descend');
    V=V(:,idn(1:m));
    W=Q*V;
end