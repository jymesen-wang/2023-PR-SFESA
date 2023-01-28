function [W_SFSFSAR,F,S]=demo_SFESA(X,s,p,alpha,m,k)

% Pattern Recognition: Sparse Feature Selection via Fast Embedding Spectral Analysis 

% X:sample matrix
% s:the number of neighbors
% p:the number of anchors is 2^p
% alpha: regularization parameters
% m: number of extracted features
% k: The number of original dimensions of data to be retained, and the number of selected features

[U,POS]=BKHK(X,p);
[L,B]=CLRA(X,U,s);
[W_SFSFSAR,F,S]=SFESA(L,X,alpha,m,k);
end