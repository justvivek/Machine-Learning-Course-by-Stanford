function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
delta=zeros(2,1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
%{
	precision =X*theta;
	temp1= theta(1)- (alpha/m) * sum(precision-y);
	temp2= theta(2)- (alpha/m) * sum((precision-y) .*X(:,2));
	theta(1)=temp1;
	theta(2)=temp2;
%}	
	precision =X*theta;
	delta=(1/m)* (X' * (precision-y));
	theta= theta - (alpha * delta); 
    % ============================================================
    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
