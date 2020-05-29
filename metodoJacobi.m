function [x,i,error]=metodoJacobi(x,A,b,iter,tol)
    D=diag(diag(A));
    L=-tril(A,-1);
    U=-triu(A,1);
    DI=inv(D);
    T=DI*(L+U);
    c=DI*b;
    %fprintf(1,'iter\t solucion\n');
    %fprintf(1,['0\t ' repmat('%.4f\t',1,length(b)) '\n'],x);
    error=[];
    for i=1:iter
        xa=x;
        x=T*x+c;
        %fprintf(1,['%d\t ' repmat('%.4f\t',1,length(b)) '\n'],i,x);
        error=[error norm(x-xa)/norm(x)];
        if(norm(x-xa)/norm(x))<tol
            return
        end
    end    
end