function aproximacion=metodoReglaRectangulo(a,b,n,f)
    h=(b-a)/n;
%     aproximacion=0;
%     for i=1:n
%         x=a+(i-1)*h;
%         aproximacion=aproximacion+f(x)*h ;       
%     end  
    x=a:h:b;
    aproximacion=h*sum(f(x(1:n-1)));
    
end