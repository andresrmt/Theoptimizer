%%%%%  Metodo de Newton   %%%%%

%  Definiciones de f, f' y f''
%  ============================

% transpose: .'
% Se declaran las variables simbolicas necesarias para ingresar f:
    syms x y z;

% f es la funcion escalar
% Df es el gradiente de f en cualquier punto
% D2f es la hessiana de f en cualquier punto
    % Funcion prueba 1
	%f = 2*y*z*sin(x) + 3*x*sin(z)*cos(y);
    % Rosembrock
    %f = (1-x)^2 + 100*(y-x^2)^2 + (1-y)^2 + 100*(z-y^2)^2;
    % PERM FUNCTION 0, D, BETA
    b = 4.588;
    f = ((1+b)*(x-1) + (2+b)*(y-(1/2)) + (3+b)*(z-(1/3)))^2 + ((1+b)*(x^2-1) + (2+b)*(y^2-(1/4)) + (3+b)*(z^2-(1/9)))^2 + ((1+b)*(x^3-1) + (2+b)*(y^3-(1/8)) + (3+b)*(z^3-(1/27)))^2;
    % ===============
	Df = gradient(f);
	D2f = hessian(f);

% x Es el punto inicial:
    u = [1; 2; 3];
% A continuacion se evaluan los primeros pasos:
    Dfx = double(subs(Df,{x,y,z},u.'));
    D2fx = double(subs(D2f,{x,y,z},u.'));
    
% Parametro de tolerancia:
    tol = 10*sqrt(eps);
    
% Newton con Backtracking:
% =========================
k = 0;
disp ('       k     norm_Dfx     f          x')
%while (k<40)
while (norm(Dfx) > tol)
    ITER = [];  
    % Backtracking 
    % ============
     xk = u;
   Dfxk = Dfx;
  D2fxk = D2fx;
     pk = -inv(D2fxk)*Dfxk;
  alfak = wolfeNT(xk,pk,f,Df,Dfxk);
  %alfak = 1;
  % Metodo de Newton
  % ================
     u  = xk + alfak*pk;
     fk = double(subs(f,{x,y,z},u.'));
    Dfx = double(subs(Df,{x,y,z},u.'));
   D2fx = double(subs(D2f,{x,y,z},u.'));
   ITER = [ITER; k norm(Dfxk) fk u'];
   k  = k+1;
   disp (ITER);
end