function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label ofxgiven the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% Add ones to thexdata matrix
a1 = [ones(m, 1) X];    %5000x401
a2 = sigmoid(a1 * Theta1');  %5000x401 乘以 401x25 得到5000x25。即把401个feature映射到25

a2 = [ones(m, 1) a2];    %5000x26
a3 = sigmoid(a2 * Theta2');  %5000x26  乘以 26x10 得到5000x10。即把26个feature映射到10


##a1 = [ones(1, m); X'];    %401x5000
##a2 = sigmoid(Theta1 * a1);  %25x401 乘以 401x5000   得到25x5000
##
##a2 = [ones(1, m); a2];    %26x5000
##a3 = sigmoid(Theta2 * a2);  %10x26 乘以 26x5000    得到10x5000
##
##a3 = a3'; % 5000x10

[x,p] = max(a3,[],2);
% =========================================================================


end
