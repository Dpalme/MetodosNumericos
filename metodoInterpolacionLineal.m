%% Interpolacion Lineal
% Función para interpolar un punto $$x\in[x_0,x_1]$
%% Parámetros de entrada
% ps: Una matriz de 2 puntos $$A=\pmatrix{x_0 & f(x_0) \cr x_1 & f(x_1)}$
%
% x: Un escalar del cual se quiere interpolar su valor $$x\in[x_0,x_1]$
%% Parámetros de salida
% f1x: Valor de la función interpolada de $$x$
%% Código de la función
function f1x=metodoInterpolacionLineal(ps,x)
    xs=ps(:,1);
    fxs=ps(:,2);
    if(length(xs)==2&&xs(1)<xs(2)&&xs(1)<=x&&x<=xs(2))
        b0=fxs(1);
        b1=(fxs(2)-fxs(1))/(xs(2)-xs(1));
        f1x=b0+b1*(x-xs(1));
    else
        f1x=inf;
        fprintf(1,'Error en los parametros de entrada');
    end
end