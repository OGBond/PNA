% DE to solve: u''(x) = 10sin(20x) + cos(x^5), u(0) = 0, u(1) = 0.1
N = 1000;
x = linspace(0, 1, N);
f = 10*sin(20*x) + cos(x.^5);
filter = [0 repelem(1, N-2) 0];
BCs = [repelem(0, N-1) 0.1];
f = f.*filter + BCs;
A = zeros(N);
r = [1 -2 1 repelem(0, N - 3)];
for i = 2:N-1
    A(i, :) = circshift(r, i-2);
end
A = A/h(N)^2;
A(1, :) = [1 repelem(0, N-1)];
A(N, :) = [repelem(0, N-1) 1];
u = A\f';
plot(x, u)