function a = Coefficients2(K,z,phi,piv)
% Eventually asks for buffer size and solves system of equations that
% represent the boundary conditions. Further parameters: Eigenvalues,
% Eigenvectors, vector of state probabilities
while (K < 0)
    disp('Buffer size must not be negative');
    K = input('K (>= 0)? ');
end;
A = [phi(1,1)*exp(z(1,1)*K),phi(1,2)*exp(z(2,2)*K); phi(2,1),phi(2,2)];
b = [piv(1,1);0];
a = linsolve(A,b);