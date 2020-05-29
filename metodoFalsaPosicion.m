function [xms,fxms,i]=metodoFalsaPosicion(xi,xs,f,iter,tol)    
    fxi=f(xi);
    fxs=f(xs);
    if fxi*fxs<0 %Condicion de deteccion de posible raiz en el intervalo [xi,xs]
        xms=zeros(1,iter);   
        fxms=xms;
        for i=1:iter
            %Calculamos el punto medio del intervalo y lo evaluamos
            xms(i)=xs-(fxs*(xi-xs))/(fxi-fxs);
            fxms(i)=f(xms(i)); 
            %Verificamos la condición de paro
            if abs(fxms(i))<tol
                xms=xms(1:i);
                fxms=fxms(1:i);
                return
            end
            %Actualizamos 
            if fxi*fxms(i)<0
                xs=xms(i);
                fxs=fxms(i);
            else 
                xi=xms(i);
                fxi=fxms(i);
            end         
        end
    else
        fprintf("No es posible encontrar alguna raíz en el intervalo [%d,%d]",xi,xs)
        xms=NaN;
        fxms=NaN;
        i=0;
    end
end