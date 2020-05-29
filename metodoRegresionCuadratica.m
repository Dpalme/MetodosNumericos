function [a,error]=metodoRegresionCuadratica(p)
    n=length(p);
    sx=sum(p(:,1));
    sx2=sum(p(:,1).*p(:,1));
    sx3=sum(p(:,1).*p(:,1).*p(:,1));
    sx4=sum(p(:,1).*p(:,1).*p(:,1).*p(:,1));
    sxsy=sum(p(:,1).*p(:,2));
    sx2sy=sum(p(:,1).*p(:,1).*p(:,2));
    sy=sum(p(:,2));
    a0=(sx2sy*sx2^2 - sxsy*sx2*sx3 - sx4*sy*sx2 + sy*sx3^2 - sx*sx2sy*sx3 + sx*sx4*sxsy)/(sx4*sx^2 - 2*sx*sx2*sx3 + sx2^3 - n*sx4*sx2 + n*sx3^2);
    a1=(sx2^2*sxsy + n*sx3*sx2sy - n*sx4*sxsy - sx*sx2*sx2sy + sx*sx4*sy - sx2*sx3*sy)/(sx4*sx^2 - 2*sx*sx2*sx3 + sx2^3 - n*sx4*sx2 + n*sx3^2);
    a2=(sx2sy*sx^2 - sxsy*sx*sx2 - sx3*sy*sx + sy*sx2^2 - n*sx2sy*sx2 + n*sx3*sxsy)/(sx4*sx^2 - 2*sx*sx2*sx3 + sx2^3 - n*sx4*sx2 + n*sx3^2);
    a=[a0 a1 a2];
    syms x
    f=a0+a1*x+a2*x^2;
    F=matlabFunction(f);
    figure(1)
    xt=linspace(min(p(:,1)),max(p(:,1)),100);
    yt=F(xt);
    plot(xt,yt,'r-');
    error=p(:,2)-F(p(:,1));
    error=sum(error.^2);
end
 