function [image_k, rel_error, compression_ratio] = svd_compress(image, k)
%SVD_COMPRESS Compute a rank-k approximation of a grayscale image using SVD.
%
%   [image_k, rel_error, compression_ratio] = SVD_COMPRESS(image, k)
%
%   Input:
%     image - m x n matrix representing a grayscale image.
%     k     - target rank (1 <= k <= min(m, n)).
%
%   Output:
%     image_k          - m x n rank-k approximation of the image.
%     rel_error        - relative Frobenius error ||image - image_k||_F / ||image||_F.
%     compression_ratio- (number of stored parameters in image_k) / (m * n),
%                         assuming we store U_k (m x k), singular values (k x 1),
%                         and V_k (n x k).
%
%   You should use MATLAB's SVD to compute the full SVD of the image and
%   then truncate it to rank k.

        [m, n] = size(image);

    % Full SV
        [U, S, V] = svd(image);

    % Truncation
        Uk = U(:, 1:k);
        Sk = S(1:k, 1:k);
        Vk = V(:, 1:k);

        image_k = Uk * Sk * Vk';

    % Frobenius error
        denom = norm(image, 'fro');
        if denom == 0
            rel_error = norm(image - image_k, 'fro');
        else
            rel_error = norm(image - image_k, 'fro') / denom;
        end
        compression_ratio = (m*k + k + n*k) / (m*n);
end
