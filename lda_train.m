function [w, threshold] = lda_train(X, y)
%LDA_TRAIN Train a two-class LDA classifier.
%
%   [w, threshold] = LDA_TRAIN(X, y)
%
%   Input:
%     X - N x d matrix of features (rows = samples, columns = features).
%     y - N x 1 vector of labels, each entry 0 or 1.
%
%   Output:
%     w         - d x 1 discriminant direction vector.
%     threshold - scalar threshold in the 1D projected space.
%
%   Outline:
%     - Separate X into X0 and X1 by class.
%     - Compute class means mu0, mu1 and within-class scatter matrix S_W.
%     - Solve S_W * w = (mu1 - mu0) for w (you may need a small regularization).
%     - Project training data: z = X * w.
%     - Let m0, m1 be means of z for classes 0 and 1, respectively.
%     - Set threshold = (m0 + m1) / 2.

    y = y(:);

    X0 = X(y == 0, :);
    X1 = X(y == 1, :);

    % making the means column vectors
    mu0 = mean(X0, 1).';
    mu1 = mean(X1, 1).';

    % separating X into X0 and X1 by class
    X0c = X0 - mu0.'; % n0 x d
    X1c = X1 - mu1.'; % n1 x d
    S_W = (X0c.' * X0c) + (X1c.' * X1c); % d x d

    d = size(X, 2);

    % Small regularization 
    if rcond(S_W) < 1e-12
        reg = 1e-6 * (trace(S_W) / max(d,1) + 1);
        S_W = S_W + reg * eye(d);
    end

    % Solve S_W * w = (mu1 - mu0)
    w = S_W \ (mu1 - mu0);

    % Project training data 
    z = X * w;  % N x 1
    m0 = mean(z(y == 0)); % setting means
    m1 = mean(z(y == 1));
    threshold = (m0 + m1) / 2;  % setting threshold
end
