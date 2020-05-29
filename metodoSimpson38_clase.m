function aprox=metodoSimpson38_clase(a,b,n,f)
    if n>0
        h=(b-a)/(3*n);
        x=a:h:b;
        nt=length(x);
        aprox=(3*h)/8*(f(x(1))+3*sum(f(x(2:3:nt-2)))+3*sum(f(x(3:3:nt-1)))+2*sum(f(x(4:3:nt-3)))+f(x(nt)));
    else
        aprox=NaN;
        fprintf('El número de segmentos no puede ser igual a 0\n');
    end
end