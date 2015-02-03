function [rhok] = predred(xk, pk, grad, Bk)
% Calcula la relacion entre el actual reduccion y la reduccion predecida
% Ingresar un vector xk, la direccion pk, el gradiente grad, y la matriz Bk
% fun es la evaluacion funcional de f en xk

mk = fun(xk) + grad'*pk + 0.5*pk'*Bk*pk;

rhok = (fun(xk)-fun(xk + pk))/(fun(xk)-mk);

end
