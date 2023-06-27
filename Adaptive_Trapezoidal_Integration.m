% Here we use adaptive trapezoidal rule or recursive integration  

tol = 1e-6;    % maximum contribution from each integration step
[I,n] = integrate(0,1, tol);

format long;
actual = 2*sqrt(0.4995);
fprintf("Exact integral %.10f vs recursive integral %.10f \n", actual, I)
x = linspace(0,1,n+1);
f_sim = f(x);
I_sim = simps(x', f_sim', 1);
f_trapz = cumtrapz(f_sim/n);
I_trapz = f_trapz(end);

fprintf("Exact integral %.10f vs simpson integral %.10f \n", actual, I_sim)
fprintf("Exact integral %.10f vs trapezoid integral %.10f \n", actual, I_trapz)

e1 = abs(I-actual)/actual;
e2 = abs(I_sim - actual)/actual;
e3 = abs(I_trapz - actual)/actual;
fprintf("Recursion(%.03e) vs Simpson(%.03e) vs Trapz(%.03e) error  \n", e1, e2, e3)

function [I,x] = integrate(x1, x2, tol)
persistent xx
if isempty(xx)
    xx = 0;
end
dx = x2-x1;
I = (f(x1)+f(x2))*dx/2;
if(abs(I)<tol)
else   %% if current step has larger contribution than tol, go for smaller steps
    I = integrate(x1, x1+dx/2, tol)+integrate(x2-dx/2, x2, tol);
xx = xx+1;
end
x=xx;
end

function fun = f(x)
fun = 1./sqrt(x-0.5005).*(x>=0.5005);
end