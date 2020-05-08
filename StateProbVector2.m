function piv = StateProbVector2(M)
% Calculates state probabilities from the generator matrix entries
ET1 = 1/M(2,1);
ET2 = 1/M(1,2);
piv=[ET1/(ET1+ET2);ET2/(ET1+ET2)];
