% Metodo de Region de Confianza
% 
%
%

deltamax = 1;  
itmax = input('Ingresar numero de iteraciones maxima:');
xk = zeros(1, itmax); pk = zeros(1, itmax); rhok = zeros(1, itmax);
delta = zeros(1, itmax);
xk(1) = input('Ingresar xk: ');
Bk = input('Ingresar Bk: ');
delta(1) = input('Ingresar delta0: ');
eta = input('Ingresar eta: ');

for k=1:itmax
    pk(k) = puntocauchy(gradfun(xk(k)),delta(k),Bk);
    rhok(k) = predred(xk(k),pk(k),gradfun(xk(k)),Bk); 
    
        if rhok(k)> 0.25  % 
            delta(k+1) = 0.25* norm(gradfun(xk(k)));
        else
            if (rhok(k) > 0.75)&&(norm(gradfun(xk(k)))==delta(k)) %
                delta(k+1) = min(2*delta(k), deltamax);
            else
                delta(k+1) = delta(k);
            end
        end
        
        if rhok(k)> eta 
            xk(k+1) = xk(k) + pk(k);
        else
            xk(k+1) = xk(k);
        end
end
