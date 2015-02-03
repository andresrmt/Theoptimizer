function [pk] = dogleg(grad, delta, Bk)
% Calculo de los puntos de Cauchy
% Ingresar el gradiente de la funcion en xk (grad),
% el radio de la region de confianza (delta) y la matriz Bk.
pu = - (norm(grad)/(grad*Bk*grad)) * grad;
pb = - inv(Bk)*grad;

aux = ((-2*(pu'*(pb-pu)) + sqrt(4*(pu'*(pb-pu)) - 4*norm(pb-pu)^2*(norm(pu)^2 + delta^2))/(2*norm(pb-pu)^2))+1;
aux2 = ((-2*(pu'*(pb-pu)) - sqrt(4*(pu'*(pb-pu)) - 4*norm(pb-pu)^2*(norm(pu)^2 + delta^2))/(2*norm(pb-pu)^2))+1;

if aux < aux2 && aux2 <1
    u = aux;
else
    if aux >= aux2 && aux <1
        u = aux;
    end
end

if (grad'*Bk*grad)<=0
    tk = 1;
else 
    tk = min(u, 1);
end

pk = -tk*(delta/norm(grad))*grad;

end
