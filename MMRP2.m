function bf = MMRP2(d1,d2,ET1,ET2,K)
% The whole fluid flow procedure: Drift, Generator, state probabilities,
% Eigensystem, coefficients, and -- as result -- "buffer full" probability.
% Input: drift values, average state durations, buffer size
D = DriftMatrix2(d1,d2);
M = GenMatrix2(ET1,ET2);
piv = StateProbVector2(M);
[z,phi] = EigenSys2(D,M);
if (K >= 0)
    a = Coefficients2(K,z,phi,piv);
    be = BufferEmptyProb2(z,phi,piv,a);
    bf = BufferFullProb2(K,z,phi,piv,a);
    pfreeze = bf / (be + bf);
else
    disp('K may not be negative!')
    bf = -1;
end;
