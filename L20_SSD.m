function [W,Obj1] = L20_SSD(A,k,W,NITER)

for iter = 1:NITER
        pinvAW = pinv(W'*A*W);
        P = A*W*pinvAW*W'*A;
        diagP = diag(P);
        [~,index] = sort(diagP,'descend');
        indexW = index(1:k);
        indexO = index(k+1:end);
        MW=A*W;
        MP = MW(indexW,:);
        OMP = orth(MP);
        RM=rank(OMP);
        [d,m]=size(W);
        if rank(OMP)~=rank(W)
            OMP(:,RM+1:m)=zeros(m,m-RM);
        end
        W([indexW],:) = OMP;
        W([indexO],:) =0;   
end

Obj1=0;