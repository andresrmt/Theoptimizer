function alfak = btrack(xk,pk,F,dF,func1, dfunc1)
alfak = 1;
cl = 1e-4;
c2 = 0.5;
r = 0.7;
x_aux = xk + alfak*pk;
F1 = feval(func1,x_aux);
DF1 = feval(dfunc1,x_aux);
while (F1 >= F + cl*alfak*dF'*pk  &  DF1'*pk <= c2*dF'*pk)
    alfak = r*alfak;
    x_aux = xk + alfak*pk;
    F1 = feval(func1,x_aux);
    DF1 = feval(dfunc1,x_aux);
end