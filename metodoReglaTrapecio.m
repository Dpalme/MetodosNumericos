function aproximacion=metodoReglaTrapecio(a,b,n,f)
    h=(b-a)/n;
    x=a:h:b;
    aproximacion=h/2*(f(a)+2*sum(f(x(2:n-1)))+f(b));    
end