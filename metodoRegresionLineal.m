function [a,error]=metodoRegresionLineal(puntos)
    n=length(puntos); %n=size(puntos,1)
    suma_x=sum(puntos(:,1));
    suma_y=sum(puntos(:,2));
    suma_x2=sum(puntos(:,1).*puntos(:,1));
    suma_xy=sum(puntos(:,1).*puntos(:,2));
    a1=(n*suma_xy-suma_x*suma_y)/(n*suma_x2-suma_x^2);
    a0=suma_y/n-a1*(suma_x/n);
    a=[a0 a1];
    syms x
    f=a0+a1*x;
    F=matlabFunction(f);
    figure(1)
    xt=[min(puntos(:,1)),max(puntos(:,1))];
    yt=F(xt);
    plot(xt,yt,'k-') 
    error=puntos(:,2)-F(puntos(:,1));
    error=sum(error.^2);
end