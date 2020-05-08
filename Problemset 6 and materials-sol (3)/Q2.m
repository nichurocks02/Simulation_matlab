%Q2
for K = [100 1000]
    for i=1:K
        [A,D,OT(i)] = snglsvQ2(8,3);
        ST(i) = mean(D-A); L(i)=length(D);
    end
    disp([K mean(ST),mean(OT), mean(L)])
    disp([K var(ST),var(OT), var(L)])
end
