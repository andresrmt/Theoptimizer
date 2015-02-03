% Método del gradiente para resolver min_x 0.5*x'*A*x + b'*c +c

% Inicialización
% --------------
    x_k = [-2;2];
    [F_k,dF_k] = f1(x_k);
      k = 1;
      X = x_k;
      F = F_k;
    tol = 1e-7;
% Iteración del método del gradiente
% ----------------------------------

while norm(dF_k) > tol
    p_k  = - dF_k;
    alfa = (dF_k'*dF_k)/(dF_k'*A*dF_k);
    x_k  = x_k + alfa*p_k;
    [F_k, dF_k]= f1(x_k);
    
    % Historial
    % ---------
    X = [X,x_k];
    F = [F,F_k];
end