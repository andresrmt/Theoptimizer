% Script para curvas de nivel
scale = 1;
% Se elige una escala arbitraria la cual puede modificarse a conveniencia.
ax = -2.5*scale;
bx = 2.5*scale;
ay = -2*scale;
by = 2*scale;
h  = 0.1*scale;
x  = ax:h:bx;
y  = ay:h:by;
for i = 1:length(x)
    for j = 1:length(y)
        [f,df] = f1([x(i);y(j)]);
        z(i,j) = f;
    end
end
% Tenemos los datos necesarios para usar la siguiente funcion
contourf(x,y,z')