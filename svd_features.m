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

    [~, S, ~] = svd(image, 'econ');
    sigma = diag(S);

    % Normalize the singular value
    ssum = sum(sigma);
    if ssum == 0
        normalized = zeros(size(sigma));
    else
        normalized = sigma / ssum;
    end

    % Getting total energy
    sig2 = sigma.^2;
    total_energy = sum(sig2);
    if total_energy == 0
        cumE = zeros(size(sig2));
    else
        cumE = cumsum(sig2) / total_energy;
    end

    % Effective ranks - 0.9 and 0.95
    r_0_9 = find(cumE >= 0.9, 1, 'first');
    r_0_95 = find(cumE >= 0.95, 1, 'first');

    % Safety
    if isempty(r_0_9),  r_0_9  = length(sigma); end
    if isempty(r_0_95), r_0_95 = length(sigma); end

    feat = [normalized(1:p); r_0_9; r_0_95];
end

