clear;
n = 200;
x1 = zeros(1, n);x2 = zeros(1, n);t = zeros(1, n);
x1(1) = 12;x2(1) = 12;t(1) = 1;
h = 0.05;
delta = 0.01;
eps = 0.01;
j = 1;

a1 =0.5; 
while a1 <= 1
    a2=0.7;
    while a2 <= 1
       b1=0.7;
       while b1 <= 1
           b2=0.1;
           while b2 <= 1
               T1=0.2;
               while T1 <= 1
                   T2=0.7;
                   while T2 <= 1
                       ro=1;
                       while ro <= 10
                           d=0;
                           while d <= ro*2-0.5
                               psi1 = @(x1,x2)(x1 - ro*x2 + d);
                               psi2 = @(x1,x2)(x1 - ro*x2 + d);
                               u1 = @(x1,x2)((-psi1(x1,x2)/T1) - a1*x1 + b1*x1*x2 - ro*a2*x2 + ro*b2*x1*x2);
                               u2 = @(x1,x2)((psi2(x1,x2)/(T2*ro))+((a1*x1-b1*x1*x2)/ro)+a2*x2-b2*x1*x2);
                               dx1 = @(x1,x2)(a1*x1-b1*x1*x2 + u1(x1,x2)); 
                               dx2 = @(x1,x2)(-a2*x2 + b2*x1*x2 + u2(x1,x2));

                               for i = 2:n
                                    x1(i) = x1(i-1) + h*(dx1(x1(i-1),x2(i-1)));
                                    x2(i) = x2(i-1) + h*(dx2(x2(i-1),x2(i-1)));
                                    t(i) = i;
                               end
                               if ~isnan(x1(n-1))&& ~isnan(x2(n-1))
                                   if x1(n-1) >= 0 && x2(n-1) >= 0
                                        if abs((x1(n-1)/x2(n-1))-ro) <= eps
                                            if (x1(n-1) - ro*x2(n-1) + d) <= 100
                                                fprintf ('Система устойчива! (решение №%f)\na1 = %f, a2 = %f\nb1 = %f, b2 = %f\nT1 = %f, T2 = %f\nro = %f, d = %f\n',j,a1,a2,b1,b2,T1,T2,ro,d)
                                                j = j + 1;
                                            end
                                        end
                                    end
                               end
                               d = d + delta;
                           end
                           ro = ro + 1;
                       end
                       T2 = T2 + delta;
                   end
                   T1 = T1 + delta;
               end
               b2 = b2 + delta;
           end
           b1 = b1 + delta;
       end 
        a2 = a2 + delta;
    end    
    a1= a1 + delta;
end 