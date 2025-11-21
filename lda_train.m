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

error('lda_train not implemented yet.');
end
