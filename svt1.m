% function B = svt(A,gamma)
% [U,S,V] = svd(A,0);
% Z = diag(shrink(diag(S),gamma));
% B = U*Z*V';
% end
function X = svt1(Y,tau)
    % singular value thresholding - shrinkage operator for singular values
    [U, S, V] = svd(Y, 'econ');
    X = U*shrink(S,tau)*V';
end