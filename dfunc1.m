function grad = dfunc1(x)
Q = [5,-1;-1,3];
b = [1;1];
grad = Q*x -b;