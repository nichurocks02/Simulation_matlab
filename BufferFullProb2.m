function bf = BufferFullProb2(K,z,phi,piv,a)
% calculates buffer full/excession probability, based on fill level K,
% Eigenvalues, Eigenvectors, state probabilities and coefficients
bf = piv(2,1)-a(1)*phi(2,1)*exp(z(1,1)*K)-a(2)*phi(2,2)*exp(z(2,2)*K);
