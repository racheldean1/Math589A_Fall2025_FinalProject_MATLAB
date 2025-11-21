# SVD + LDA Image Classification Project (MATLAB Starter)

This repository is a starter kit for the final programming project in MATLAB.

You will implement the following functions, each in its own `.m` file:

- `power_method.m` — dominant eigenvalue/eigenvector of a symmetric matrix.
- `svd_compress.m` — rank-k image approximation using SVD.
- `svd_features.m` — SVD-based feature extraction for images.
- `lda_train.m` — train a two-class Linear Discriminant Analysis (LDA) classifier.
- `lda_predict.m` — apply the trained LDA classifier.

The autograder will call these functions with specific signatures.
**Do not change the function names or input/output arguments.**

## Files

- `power_method.m`
- `svd_compress.m`
- `svd_features.m`
- `lda_train.m`
- `lda_predict.m`
- `example_run.m` — simple script that runs an end-to-end test using the example data.
- `project_data_example.mat` — tiny synthetic dataset for local testing.
- `.gitignore` — ignores editor/OS clutter and large data files.

## Quick start (MATLAB)

1. Open MATLAB and add this folder to your path.
2. Open each of the `.m` files and implement the functions where indicated.
3. Run the script:

   ```matlab
   example_run
   ```

   This will:
   - Load `project_data_example.mat` if present.
   - Extract SVD features using `svd_features`.
   - Train an LDA classifier with `lda_train`.
   - Predict labels on the test set with `lda_predict`.
   - Print the test accuracy on the tiny synthetic dataset.

In the real assignment, the Gradescope autograder will provide a different
`project_data.mat` with more realistic images and labels.
