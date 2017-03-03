function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);
% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
for i=1:size(X,1)
	a=X(i,:);
	%%% THE MATRIX OF SAME SIZE AS OF CENTROIDS BY REPEATING THE SAME ROW SO THAT WE CAN FIND THE DISTANCE FROM ALL CENTROIDS IN ONE GO
	%%% AND THE FIND MINIMUM AMONG THEM AND THEN GET INDEX OF THAT MINIMUM, STORE THAT IN idx(i)
	for j=2:K
		a=[a;X(i,:)];
	end
	dist_mat= sum((a-centroids).^2,2);
	[min_dist,index]= min(dist_mat);
	idx(i)= index;
#	idx(i)= find(dist_mat == min_dist);
end

%{

%% To test on OCTAVE terminal

e=[1.84208   4.60757; 5.65858   4.79996;6.35258   3.29085]
k= size(initial_centroids,1)

id=zeros(size(e,1), 1);
for i=1:size(e,1)
a=e(i,:);
for j=2:k
a=[a;e(i,:)];
end
dis=sum((a-initial_centroids).^2,2);
mind=min(dis);
id(i)=find(dis==mind);
end

%}

% =============================================================

end

