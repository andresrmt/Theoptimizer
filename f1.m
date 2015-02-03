function [f,df]=f1(x)
A = [5 -1;-1 3];
b = [1;1];
c = 2;
% definición de f y df
f  = @(x) (0.5*x'*A*x + b'*x + c);
df = @(x) (A*x + b);
f  = feval(f,x);
df = feval(df,x);