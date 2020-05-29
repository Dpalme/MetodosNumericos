function [xs,fxs,error]=metodoEuler(h,f,df,x0,y0,xf)
    xs=[x0];
    fxs=[y0];
    i=1;
    while xs(i)<xf
        xs=[xs xs(i)+h];
        fxs=[fxs fxs(i)+df(xs(i),fxs(i))*h];
        i=i+1;
    end
    error=sum(abs(f(xs)-fxs))/length(xs);
    
end