function [theta, J_history, theta_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
theta_history = zeros(size(X,2), num_iters); % 【改动】使用 2×iteration维矩阵，保存theta每次迭代的历史

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    % 这里为了方便理解 拆的比较细，可以组合成一步操作 theta = theta - (alpha / m) *((X * theta - y)' * X)'
    % prediction h(x)
    predictions = X * theta;  % m×2矩阵 * 2×1向量 = m维列向量
    % error h(x)-y
    errors = predictions - y; % m维列向量
    % derivative of J()
    lineLope =  errors' * X;  % m维行向量 * m×2矩阵 = 2维列向量
    % theta 
    theta = theta - (alpha / m) * lineLope'; % 2维列向量

    % disp('prediction');
    % disp(prediction);
    
    % disp('theta');
    % disp(theta);
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
    theta_history(:,iter) = theta;  % 给第iter列赋值
end

end
