function [a,error]=metodoRegresionPolinomial(ps,gp)
    n=length(ps);
    if n>=gp+1
       %calcular vector b
       A=zeros(gp+1,gp+1);
       b=zeros(gp+1,1);
       for i=1:gp+1
            b(i)=sum(ps(:,2).*ps(:,1).^(i-1));
       end
       
       for i=1:gp+1
           for j=1:gp+1
               A(i,j)=sum(ps(:,1).^(i+j-2));%               
           end       
       end
       
       A(1,1)=n;%
       a=linsolve(A,b);%
       syms x
       f=0;
       for i=1:gp+1
           f=f+a(i)*x^(i-1);
       end
       F=matlabFunction(f);
       figure(1)
       xt=linspace(min(ps(:,1)),max(ps(:,1)),100);
       yt=F(xt);
       plot(xt,yt,'m-');
       error=ps(:,2)-F(ps(:,1));
       error=sum(error.^2);
    else
        a=0;
        error=inf;
    end

end