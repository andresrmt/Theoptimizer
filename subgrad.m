function g = subgrad(x,A,b,d)
n = length(x);
a = A'*(A*x-b);
z = eye(n,1);
for i=1:n
    if x(i) < 0
        z(i) = - d;
    end
    if x(i) > 0
            z(i) = d;
    end
    if x(i) == 0
        z(i) = -d + (d+d).*rand(1);
    end
end
g = a+z;