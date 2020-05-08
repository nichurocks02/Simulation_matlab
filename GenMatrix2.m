function M = GenMatrix2(ET1, ET2)
% Eventually asks for input and creates a 2x2 generator matrix, where state 2 represents the overload state
while (ET1 <= 0)
    disp('Average state duration has to be positive');
    ET1 = input('ET_1 (> 0)? ');
end;
while (ET2 <= 0)
    disp('Average state duration has to be positive');
    ET2 = input('ET_2 (> 0)? ');
end;
la1 = 1/ET1;
mu2 = 1/ET2;
M=[-la1,mu2;la1,-mu2];