[packet_no_p, time_p, packetsize_p] = textread('poisson1.data', '%f %f %f'); 
b=time_p;
a=time_p.*(10^-6);
yn=a(1:1:100);
ym=a(1:10:1000);
yg=a(1:100:10000);
yh=a(1:100)
yi=a(300:400)
yj=a(400:500)
difference_between_arrival_times=diff(a);
c=var(difference_between_arrival_times)
z=packet_no_p.*packetsize_p;
y_diff=diff(z);
mean_bit_rate=sum(packetsize_p)./sum(difference_between_arrival_times)

data_point1=z(1:100)
data_point2=z(1000:1100)
data_point3=z(2000:2100)
data_point4=z(1001:1100)
data_point5=z(2001:2100)
subplot(711)
bar(yh,data_point1)
title('first time scale')
subplot(712)
bar(yi,data_point2)
title('second time scale')
subplot(713)
bar(yj,data_point3)
title('third time scale')
subplot(714)
bar(yn,data_point1)
title('1 second')
subplot(715)
bar(ym,data_point4)
title('100 milliseconds')
subplot(716)
bar(yg,data_point5)
title('10 milliseconds')


traffic_rate_data = packetsize_p.*packet_no_p./ 800;
max(traffic_rate_data)
min(traffic_rate_data)
scotts_formula = 3.49 * std(traffic_rate_data) / (length(traffic_rate_data)^(1/3));
k = ceil(max(traffic_rate_data) - min(traffic_rate_data)/scotts_formula)
histogram(traffic_rate_data, k, 'Normalization', 'pdf');
fitting = fitdist(traffic_rate_data, 'Exponential');
t = linspace(min(traffic_rate_data), max(traffic_rate_data), 500);
hold on;
plot(t, pdf(fitting,t));
hold off;

ch2t = chi2gof(traffic_rate_data, 'CDF', fitting)
disp('if ch2t is 1 then the test rejects at 5%')

