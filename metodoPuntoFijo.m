function [xms,fxms,i]=metodoPuntoFijo(xi,f,g,iter,tol)
    xms=zeros(1,iter+1);
    fxms=xms;
    xms(1)=xi;
    fxms(1)=f(xi);
    for i=1:iter
        if abs(fxms(i))<tol
            xms=xms(1:i);
            fxms=fxms(1:i);
            return
        end              
        xms(i+1)=g(xms(i));
        fxms(i+1)=f(xms(i+1));        
    end
end