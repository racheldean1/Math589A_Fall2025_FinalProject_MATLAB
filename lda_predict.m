function y_pred = lda_predict(X, w, threshold)
%LDA_PREDICT Predict class labels using a trained LDA classifier.
%
%   y_pred = LDA_PREDICT(X, w, threshold)
%
%   Input:
%     X         - N x d feature matrix.
%     w         - d x 1 discriminant direction (from lda_train).
%     threshold - scalar threshold (from lda_train).
%
%   Output:
%     y_pred    - N x 1 vector of predicted labels (0 or 1).
%
%   Classification rule:
%     z = X * w;
%     if z_i >= threshold => predict 1
%     else                => predict 0

    z = X * w;                 
    y_pred = double(z >= threshold);    % predicting 0 or 1
    y_pred = y_pred(:);
end
