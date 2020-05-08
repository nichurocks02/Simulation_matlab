%Q1
[A,D,OT] = snglsv(8,3);
figure,plot(A,'k'), hold on, plot(D,'b'),
plot(D-A,'r') % the service time
disp(OT)
disp(mean(D-A)) % the service time
