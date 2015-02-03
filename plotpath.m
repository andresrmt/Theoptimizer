function plotpath(X)
n  = length(X);
x1 = X(:,1);
for i = 2:length(X)
    x2 = X(:,i);
    delta = x2 -x1;
    quiver(x1(1), x1(2), delta(1), delta(2), 1);
    x1 = x2;
    hold on;
end