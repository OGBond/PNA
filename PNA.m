% DE to solve: u''(x) = 10sin(20x) + cos(x^5), u(0) = 0, u(1) = 0.1
N = 1000;
x = linspace(0, 1, N);
h = (1 - 0)/N;                  % Added definition of h, required for 
                                % line 14
f = 10*sin(20*x) + cos(x.^5);
filter = [0 repelem(1, N-2) 0];
BCs = [repelem(0, N-1) 0.1];
f = f.*filter + BCs;
A = zeros(N);
r = [1 -2 1 repelem(0, N - 3)];
for i = 2:N-1
    A(i, :) = circshift(r, i-2);
end
A = A/h^2;                      % changed from "h(N) to h
A(1, :) = [1 repelem(0, N-1)]; 
A(N, :) = [repelem(0, N-1) 1];
u = A\f';
plot(x, u)

% Nice script Joel - just fixed a couple of things and it works! 
% Also consider learning about how to use sparse matrices in MATLAB
% as I learned recently, using "zeros" and other things can be quite
% computationally inefficient due to all the zeros (whereas sparse
% matrices only refer to non-zero entries).

% You'll have to explain to me a bit more about what repelem and circshift
% do! :)