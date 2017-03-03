function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
%{

% Values that are already given in the code
C = 1;
sigma = 0.3;

%}


% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%{ 

%%%%TO CALCULATE THE OPTIMAL C AND SIGMA BASED ON CROSS-VALIDATION SET 

C_arr = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_arr = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];


x1 = [1 2 1]; x2 = [0 4 -1];
meanerror=99999.99;
for i=1:length(C_arr)
	for j=1:length(sigma_arr)
		model = svmTrain(X, y, C_arr(i), @(x1, x2) gaussianKernel(x1, x2, sigma_arr(j)));
		predictions = svmPredict(model, Xval);
		error = mean(double(predictions ~= yval));
		if error < meanerror
			meanerror = error;
			C = C_arr(i);
			sigma = sigma_arr(j);
		end
	end
end


%}

%% THESE ARE THE OPTIMAL C AND SIGMA WHICH WE CALCULATED USING ABOVE CODE FOR WHICH WE ARE GETTING THE BEST DECISION BOUNDARY
C= 	0.3
sigma=0.1

% =========================================================================

end
