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


    % Ensure column vector
    x = x0(:);

    % Normalize initial vector
    nx = norm(x, 2);
    if nx == 0
        error('x0 must be nonzero.');
    end
    x = x / nx;

    lam_prev = NaN;
    lam = x' * A * x;
    iters = 0;

    for k = 1:maxit
        y = A * x;
        ny = norm(y, 2);
        if ny == 0
            lam = 0;
            v = x;
            iters = k;
            return;
        end
        x = y / ny;

        lam = x' * A * x;
        iters = k;

        if k > 1
            denom = abs(lam);
            if denom == 0
                if abs(lam - lam_prev) <= tol
                    break;
                end
            else
                if abs(lam - lam_prev) / denom <= tol
                    break;
                end
            end
        end

        lam_prev = lam;
    end

    v = x; 
end
