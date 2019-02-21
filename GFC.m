function [idt, V , param] = GFC(X, Y, delta)
[N1, D] = size(X);
eta=0.98;
history.x = [ ];
history.fval = [ ];
beta =1.5;
lambda = 3;
sigma2=power(det(X'*X/N1), 1/(2^D));
M=round(sqrt(N1));
x0 = zeros(M*D, 1);
options = optimset( 'display','iter');
options = optimset(options, 'outputfcn',@GFCoutfun);
options = optimset( options, 'LargeScale','off');
options = optimset(options, 'MaxFunEvals', 100);
options = optimset(options, 'MaxIter', 100);
options = optimset(options, 'GradObj', 'on');
U=get_U(X,beta,M);
param = fminunc(@(x)costfun_GFC(x, X, Y,  U, beta, lambda, sigma2), x0, options);
Alpha = reshape(param, [M D]);
V=X+U*Alpha;
Pb =  exp(-sum((Y-V).^2, 2) / (sigma2)) ;
idt = find(Pb > delta);
    function stop = GFCoutfun(x,optimValues,state,varargin)
        stop = false;
        switch state
            case 'init'
            case 'iter'
                history.fval = [history.fval; optimValues.fval];
                history.x = [history.x; reshape(x,1,length(x))];
                Alpha = reshape(x, [M D]);
                V=X+U*Alpha;
                sigma2=sigma2 * eta;
            case 'done'
            otherwise
        end
    end
end

function U=get_U(X,beta,M)
tmp_X = unique(X, 'rows');
idx = randperm(size(tmp_X,1));
idx = idx(1:min(M,size(tmp_X,1)));
ctrl_pts=tmp_X(idx,:);
U = con_K(X, ctrl_pts, beta);
end