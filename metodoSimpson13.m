function aproximacion=metodoSimpson13(a,b,n,f)
    h=(b-a)/(2*n);
    x=a:h:b;
    nt=length(x);
    aproximacion=h/3*(f(x(1)) + 4*sum(f(x(2:2:nt-1)))+ 2*sum(f(x(3:2:nt-2))) +f(x(nt)));    
end