%% Interpolación cuadrática
% Función para interpolar un punto $$x\in[x_0,x_2]$
%% Parámetros de entrada
% ps: Una matriz de 3 puntos $$A=\pmatrix{x_0 & f(x_0) \cr x_1 & f(x_1) \cr x_2 & f(x_2)}$
%
% x: Un escalar del cual se quiere interpolar su valor $$x\in[x_0,x_2]$
%% Parámetros de salida
% f2x: Valor de la función interpolada de $$x$
%% Código de la función
function f2x=metodoInterpolacionCuadratica(ps,x)
    xs=ps(:,1);
    fxs=ps(:,2);
    if(length(xs)==3&&xs(1)<=x&&x<=xs(3))
        b0=fxs(1);
        b1=(fxs(2)-fxs(1))/(xs(2)-xs(1));
        b2=((fxs(3)-fxs(2))/(xs(3)-xs(2))-b1)/(xs(3)-xs(1));
        f2x=b0+b1*(x-xs(1))+b2*(x-xs(1))*(x-xs(2));
    else
        f2x=inf;
        fprintf(1,'Error en los parametros de entrada');
    end
end