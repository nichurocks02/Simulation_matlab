%Q3
clear
for K = [100 1000]
    for i=1:K 
        [A,D,OT(i)] = snglsvQ3(8,4); % Change lam
        T(i) = mean(D-A); 
        L(i)=length(D);
    end
    figure,plot(T)
    hist(T,30)
    pd = fitdist(T','Normal') 
    %Compute the 99% confidence interval for the distribution parameters. 
    ci = paramci(pd,'Alpha',.01)
    
    [xc,lags] = xcorr(T',1,'coeff');
    disp(xc(1)),
end

