function feat = svd_features(image, p)
%SVD_FEATURES Extract SVD-based features from a grayscale image.
%
%   feat = SVD_FEATURES(image, p)
%
%   Input:
%     image - m x n matrix representing a grayscale image.
%     p     - number of leading singular values to use (p <= min(m, n)).
%
%   Output:
%     feat  - (p + 2) x 1 column vector containing:
%             [normalized sigma_1; ...; normalized sigma_p; r_0_9; r_0_95]
%
%   Definitions:
%     [U, S, V] = svd(image, 'econ');
%     sigma = diag(S);
%     normalized singular values: sigma / sum(sigma)
%     energy E(k) = sum_{i=1}^k sigma_i^2 / sum_{i=1}^r sigma_i^2
%     r_0_9  = min{k : E(k) >= 0.9}
%     r_0_95 = min{k : E(k) >= 0.95}

error('svd_features not implemented yet.');
end
