% EXAMPLE_RUN  Simple end-to-end test on the example dataset.
%
%   This script is for local testing only and will NOT be used by the autograder.
%
%   It attempts to:
%     - Load 'project_data_example.mat'
%     - Build SVD-based features with svd_features
%     - Train an LDA classifier with lda_train
%     - Predict on the test set with lda_predict
%     - Print the test accuracy

clear; clc;

if ~isfile('project_data_example.mat')
    fprintf('Example data file project_data_example.mat not found.\n');
    return;
end

data = load('project_data_example.mat');

X_train = data.X_train;  % N_train x m x n
y_train = data.y_train;  % N_train x 1
X_test  = data.X_test;   % N_test x m x n
y_test  = data.y_test;   % N_test x 1

[N_train, m, n] = size(X_train);
[N_test, ~, ~] = size(X_test);

fprintf('X_train size: %d x %d x %d\n', N_train, m, n);
fprintf('X_test size:  %d x %d x %d\n', N_test, m, n);

p = min(5, min(m, n));
fprintf('Using p = %d leading singular values for features.\n', p);

% Build feature matrices
try
    Xf_train = zeros(N_train, p + 2);
    for i = 1:N_train
        img = squeeze(X_train(i, :, :));
        feat = svd_features(img, p);
        Xf_train(i, :) = feat(:).';
    end

    Xf_test = zeros(N_test, p + 2);
    for i = 1:N_test
        img = squeeze(X_test(i, :, :));
        feat = svd_features(img, p);
        Xf_test(i, :) = feat(:).';
    end
catch ME
    fprintf('Error while computing features: %s\n', ME.message);
    fprintf('Implement svd_features.m before running this example.\n');
    return;
end

% Train LDA
try
    [w, threshold] = lda_train(Xf_train, y_train);
catch ME
    fprintf('Error while training LDA: %s\n', ME.message);
    fprintf('Implement lda_train.m before running this example.\n');
    return;
end

% Predict
try
    y_pred = lda_predict(Xf_test, w, threshold);
catch ME
    fprintf('Error while predicting with LDA: %s\n', ME.message);
    fprintf('Implement lda_predict.m before running this example.\n');
    return;
end

% Compute accuracy
accuracy = mean(y_pred(:) == y_test(:));
fprintf('Example test accuracy: %.3f\n', accuracy);
