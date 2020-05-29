function [xms,fxms,i]=metodoBiseccion(xi,xs,f,iter,tol)
    fxi=f(xi);
    fxs=f(xs);
    if fxi*fxs<0 %Condicion de deteccion de posible raiz en el intervalo [xi,xs]
        for i=1:iter
            xm=(xi+xs)/2;
            fxm=f(xm);
            
            if abs(fxm)<tol
                i=i+2
                return
            end
            
            if fxi*fxm<0
                xs=xm;                
            else 
                xi=xm;                
            end         
        end
    else
        fprintf("No es posible encontrar alguna raíz en el intervalo [%d,%d]",xi,xs)
        xms=NaN;
        fxs=NaN;
    end
end