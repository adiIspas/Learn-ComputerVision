% Solve equation AX = B
A = [2 2; 3 4];
B = [1; 1];

X = A\B;
A_1 = inv(A);

% Singular Value Decomposition
[U,S,V]=svd(A);