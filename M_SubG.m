%%%%%  Metodo del subgradiente   %%%%%

%  Definiciones de f 
%  ==================
    x = [1;1;1];
    A = [2, -1, 0; -1 ,2, -1; 0, -1, 2];
    b = [4; 3; -6];
    d = 4;
    f = @(x) 0.5*norm(A*x-b)^2 + d*norm(x,1);
  fb  = feval(f,x);
    g = subgrad(x,A,b,d);
    a = rand(1)/pi;
    ub = x;
    imax = 100;
    jmax = 10;
    
% Metodo
% ===================================
disp ('     i        fb   ')
for i=1:imax
    
    for j=1:1000
        ITER = [];  
        alfak = a/sqrt(j);
        xk = x-alfak*g;
        fk = feval(f,x);
        if fk <=fb
            fb = fk;
            ub = xk;
             k = j;
        end
        x = xk;
        g = subgrad(x,A,b,d);
    end
    x = ub;
    g = subgrad(x,A,b,d);
    disp([k,fb]);
    disp('xb =')
    disp(ub);
end