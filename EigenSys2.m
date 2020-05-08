function [z,phi]=EigenSys2(D,M)
% Calculates the Eigensystem for a 2-state MMRP, with normalized
% Eigenvectors
[phi_u,z] = eig(D \ M);
phi=phi_u;
phi(1,1)=phi_u(1,1)/(phi_u(1,1)+phi_u(2,1));
phi(2,1)=phi_u(2,1)/(phi_u(1,1)+phi_u(2,1));
phi(1,2)=phi_u(1,2)/(phi_u(1,2)+phi_u(2,2));
phi(2,2)=phi_u(2,2)/(phi_u(1,2)+phi_u(2,2));