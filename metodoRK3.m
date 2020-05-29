function [xs,fxs,error]=metodoRK3(h,f,df,x0,y0,xf)
    xs=[x0];
    fxs=[y0];
    i=1;
    while xs(i)<xf
        xs=[xs xs(i)+h];
        k1=df(xs(i),fxs(i));
        k2=df(xs(i)+1/2*h,fxs(i)+1/2*k1*h);
        k3=df(xs(i)+h,fxs(i)-k1*h+2*k2*h);
        fxs=[fxs fxs(i)+1/6*(k1+4*k2+k3)*h];
        i=i+1;
    end
    error=sum(abs(f(xs)-fxs))/length(xs);
    
end