function [pk] = puntocauchy(grad, delta, Bk)
% Calculo de los puntos de Cauchy
% Ingresar el gradiente de la funcion en xk (grad),
% el radio de la region de confianza (delta) y la matriz Bk.

aux = (norm(grad))^3/(delta*grad'*Bk*grad);

if (grad'*Bk*grad)<=0
    tk = 1;
else 
    tk = min(aux, 1);
end

pk = -tk*(delta/norm(grad))*grad;

end
