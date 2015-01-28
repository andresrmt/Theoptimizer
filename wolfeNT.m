function alfak = wolfeNT(xk,pk,f,Df,Dfxk)
% Notar que el numero de variables simbolicas varia
syms x y z;

% Backtracking:
alfak = 1;
   c1 = 1e-4;
   c2 = 0.5;
    r = 0.7;
x_aux = xk + alfak*pk;
F  = double(subs(f,{x,y,z},xk.'));
F1 = double(subs(f,{x,y,z},x_aux.'));
DF1 = double(subs(Df,{x,y,z},x_aux.'));
k=0;
while (F1 >= F + c1*alfak*Dfxk'*pk & DF1'*pk <= c2*Dfxk'*pk)
    alfak = r*alfak;
    x_aux = xk + alfak*pk;
    F1 = double(subs(f,{x,y,z},x_aux.'));
    DF1 = double(subs(Df,{x,y,z},x_aux.'));
    k=k+1;
    if (k>50)
        alfak=1;
        break
    end
end


