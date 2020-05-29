function [xs,fxs,error]=metodoHeun(h,f,df,x0,y0,xf)
    xs=[x0];
    fxs=[y0];
    i=1;
    while xs(i)<xf
        xs=[xs xs(i)+h];
        predictor=fxs(i)+df(xs(i),fxs(i))*h; %Predicción
        corrector=fxs(i)+(df(xs(i),fxs(i))+df(xs(i+1),predictor))/2*h; %Corrección
        fxs=[fxs corrector];
        i=i+1;
    end
    error=sum(abs(f(xs)-fxs))/length(xs);    
end