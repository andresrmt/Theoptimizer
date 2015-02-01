%%%%%  Metodo Cuasi-Newton DFP   %%%%%

%  Definiciones de f y f'
%  =======================
    x  = [1;1];
    B   = eye(length(x));
    tol = 10*sqrt(eps);
    F  = feval(@func1,x);
    dF = feval(@dfunc1,x);
    fun = @func1;
    dfun = @dfunc1;
    
% BFGS
% ====
k  = 0;
disp ('     k     norm_dF     F   x')
while (norm(dF) > tol)
    ITER = [];  
    % Backtracking 
    % ============
     xk = x;
    dFk = dF;
     Fk = F;
     pk = -B\dFk;
     alfak = btrack(xk,pk,F,dF,fun,dfun);
  %alfak = 1;
     x  = xk + alfak*pk;
     dF = feval(@dfunc1,x);
     F  = feval(@func1,x);
     yk = dF - dFk;
     sk = x - xk;
     I=eye(length(x));
     gammak=1/(yk'*sk);
     B  = (I-gammak*(yk*sk'))*B*(I-gammak*(sk*yk'))+gammak*(yk*yk');
     k  = k+1;
   ITER = [ITER; k norm(dF) F x'];
   disp (ITER);
end
