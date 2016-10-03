function [x, y, R] = FitCircle(D)
% FitCircleLeastSquares Fit a circle using at least 3 points.
% Input:
%   D: An N x 2 matrix, where each row is a point in 2D space.
% Output:
%   x, y, R: (x, y) is the center of the fitted circle, R is the radius of
%   the fitted circle
    
    n = size(D, 1);

    if n < 3,
        error('You need at least three points to fit a circle.');
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                                YOUR CODE HERE:                               %
%        Find the value of the above variables as discussed in part (a).       %

A = zeros(n,3);
Y = zeros(n,1);

for i=1:size(D,1)
    x = D(i,1);
    y = D(i,2);
    
    A(i,1) = x;
    A(i,2) = y;
    A(i,3) = 1;
    
    Y(i) = x + y;
end

X = A\Y;

x = X(1,1);
y = X(2,1);
q = X(3,1);

R = sqrt(q + x^2 + y^2);
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end