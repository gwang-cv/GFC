
function K=con_K(x,y,beta)

if nargin<3
    error('Error! Not enough input parameters.'); 
end

ks=-2 * beta^2;
[n, d]=size(x); 
[m, d]=size(y);
K=repmat(x,[1 1 m])-permute(repmat(y,[1 1 n]),[3 2 1]);
K=squeeze(sum(K.^2,2));
K=K/ks;
K=exp(K);
