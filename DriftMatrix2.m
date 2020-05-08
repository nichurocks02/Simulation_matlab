function D = DriftMatrix2(d1, d2)
% Eventually asks for input and creates a 2x2 drift matrix, where state 2 represents the overload state
while (d1 >= 0)
    disp('Drift 1 should be negative');
    d1 = input('d_1 (< 0)? ');
end;
while (d2 <= 0)
    disp('Drift 2 should be positive');
    d2 = input('d_2 (> 0)? ');
end;
D=[d1,0;0,d2];
