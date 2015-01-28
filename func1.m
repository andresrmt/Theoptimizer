function f = func1(x)
Q = [5,-1;-1,3];
b = [1;1];
c = 2;
f = 0.5*x'*Q*x - b'*x+c;