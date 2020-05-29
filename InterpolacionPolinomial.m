%% Interpolacion polinomial de Newton
% Funcion para interpolar cuadraticamente un punto $$x\in[x_0,x_2]$
%% Parámetros de entrada
% ps:Una matriz de $$n$ puntos $$A =\pmatrix{x_0 & f(x_0) \cr x_1 & f(x_1) \cr x_2 & f(x_2) \cr \vdots & \vdots \cr x_n & f(x_n)}$
% 
% x:Un escalar del cual se quiere interpolar su valor $$x\in [x_0,x_n]$
%% Parámetros de salida
% f1x=Valor de la función interpolada polinomialmente de $$x$
%% Código de la función
function [f1x,b]=InterpolacionPolinomial(ps,x)
    n=length(ps);
    if(ps(1,1)<=x&&x<=ps(end,1))
        xs=ps(:,1);
        b=zeros(n);
        b(:,1)=ps(:,2);
        for j=2:n
            for i=1:n-j+1
                b(i,j)=(b(i+1,j-1)-b(i,j-1))/(xs(i+j-1)-xs(i));
                fprintf(1,'(%.4f - %.4f)/(%.4f - %.4f)=%.4f \n',b(i+1,j-1),b(i,j-1),xs(i+j-1),xs(i),b(i,j))
            end
        end
        
        f1x=b(1,1);
        xt=1;
        for j=1:n-1
            xt=xt*(x-xs(j));
            f1x=f1x+b(1,j+1)*xt;
        end        
    else
        f1x=inf;
        fprintf(1,'Error en los parametros de entrada\n');
    end
end