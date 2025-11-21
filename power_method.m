function [lam, v, iters] = power_method(A, x0, maxit, tol)
%POWER_METHOD Approximate the dominant eigenvalue and eigenvector of a real symmetric matrix A.
%
%   [lam, v, iters] = POWER_METHOD(A, x0, maxit, tol)
%
%   Input:
%     A     - n x n real symmetric matrix.
%     x0    - n x 1 initial guess for eigenvector (nonzero).
%     maxit - maximum number of iterations.
%     tol   - tolerance for relative change in eigenvalue.
%
%   Output:
%     lam   - approximate dominant eigenvalue.
%     v     - approximate unit eigenvector (2-norm equal to 1).
%     iters - number of iterations performed.
%
%   You must implement the standard power iteration:
%     x_{k+1} = A x_k / ||A x_k||_2
%     lam_k  = x_k' * A * x_k
%   Stop when |lam_k - lam_{k-1}| / |lam_k| <= tol or maxit is reached.
%
%   Do not change the function signature.

error('power_method not implemented yet.');
end
