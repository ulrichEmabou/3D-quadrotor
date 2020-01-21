function [coff, A, b] = getCoff(waypoints)

% waypoints assume to be a N,1 vector of one of the coordinates (we call this function 3 times, for x,y,z

n = size(waypoints,1)-1; % number of segments P1..n

A = zeros(8*n, 8*n);


% Here, fill the b vector with Wi and Wi+1 waypoints based of the 1st and second constrains. All the rest of the constrains are zero.

b=[waypoints(1,1) waypoints(1,2) waypoints(1,3) waypoints(1,4) waypoints(1,2) waypoints(1,3) waypoints(1,4) waypoints(1,5) zeros(1,24)];

row = 1;

% Constrain 1) Pi(0) = Wi for all i=1..n

% Here you code to loop through the first n constrains, for each you should call the utility function polyT(8,0,0) to get the vector of the coefficients - coefficients (see above for explanation). For example:

A(row, 1:8) = polyT(8,0,0); % for i=1

row = row + 1;

A(row, 9:16) = polyT(8,0,0); % for i=2
row = row + 1;

A(row, 17:24) = polyT(8,0,0); % for i=3
row = row + 1;

A(row, 25:32) = polyT(8,0,0); % for i=4
row = row + 1;
% Constrain 2) Pi(1) = Wi+1 for all i=1..n

A(row, 1:8) = polyT(8,0,1); % for i=1

row = row + 1;

A(row, 9:16) = polyT(8,0,1); % for i=2
row = row + 1;

A(row, 17:24) = polyT(8,0,1); % for i=3
row = row + 1;

A(row, 25:32) = polyT(8,0,1); % for i=4
row = row + 1;

% Constrain 3) P1(k)(0)= 0 for all 1<=k<=3
A(row, 1:8) = polyT(8,1,0); % for i=1

row = row + 1;

A(row, 1:8) = polyT(8,2,0); % for i=2
row = row + 1;

A(row, 1:8) = polyT(8,3,0); % for i=3
row = row + 1;

% Your code here.

% Constrain 4) Pn(k)(1) = 0 for all 1<=k<=3

A(row, 25:32) = polyT(8,1,1); % for i=4
row = row + 1;
A(row, 25:32) = polyT(8,2,1); % for i=4
row = row + 1;
A(row, 25:32) = polyT(8,3,1); % for i=4

row = row + 1;
% Constrain 5) Pi-1(k)(1) = Pi(k)(0) for all i=2..n and for all k=1..6

% Your code here.

% Example:

A(row, 1:16) = [ polyT(8,1,1) -polyT(8,1,0)]; % this is for i=2 and k=1
row = row + 1;
A(row, 1:16) = [ polyT(8,2,1) -polyT(8,2,0)];
row = row + 1;
A(row, 1:16) = [ polyT(8,3,1) -polyT(8,3,0)];
row = row + 1;
A(row, 1:16) = [ polyT(8,4,1) -polyT(8,4,0)];
row = row + 1;
A(row, 1:16) = [ polyT(8,5,1) -polyT(8,5,0)];
row = row + 1;
A(row, 1:16) = [ polyT(8,6,1) -polyT(8,6,0)];
row = row + 1;
A(row, 9:24) = [ polyT(8,1,1) -polyT(8,1,0)];
row = row + 1;
A(row, 9:24) = [ polyT(8,2,1) -polyT(8,2,0)];
row = row + 1;
A(row, 9:24) = [ polyT(8,3,1) -polyT(8,3,0)];
row = row + 1;
A(row, 9:24) = [ polyT(8,4,1) -polyT(8,4,0)];
row = row + 1;
A(row, 9:24) = [ polyT(8,5,1) -polyT(8,5,0)];
row = row + 1;
A(row, 9:24) = [ polyT(8,6,1) -polyT(8,6,0)];
row = row + 1;
A(row, 17:32) = [ polyT(8,1,1) -polyT(8,1,0)];
row = row + 1;
A(row, 17:32) = [ polyT(8,2,1) -polyT(8,2,0)];
row = row + 1;
A(row, 17:32) = [ polyT(8,3,1) -polyT(8,3,0)];
row = row + 1;
A(row, 17:32) = [ polyT(8,4,1) -polyT(8,4,0)];
row = row + 1;
A(row, 17:32) = [ polyT(8,5,1) -polyT(8,5,0)];
row = row + 1;
A(row, 17:32) = [ polyT(8,6,1) -polyT(8,6,0)];

% notice that we construct a vector of 1x16 for the coefficients of a11..a18 a21..a28. The reason we use a minus before the second call to polyT is because the coefficients of a21..a28 are all with minus:
size(A);
size(b);
% Your code here.

% we can now return the coefficient vector. Notice that if inv fails, it is most likely that you didn’t code the above correctly. You can try pinv, but you better fix your code instead.

coff = inv(A)*b';

end