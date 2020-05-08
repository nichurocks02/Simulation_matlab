clear all; %empty memory
rng(1);% rand(’seed’,0)%set random seed
lambda= 5.3142e+14; %arrival rat
mu=1.8817e-15; %service rate
endtime=10; %simulation length

t=0; %current time
tstep=1; %average time between consecutive measurement events
currcustomers=0; %current number of customers in system
event=zeros(1,3); %constructs vector to keep time for next arrival
%(pos 1),next service completion (pos 2) and next
% measurement event (pos 3)
event(1)=exprnd(1/lambda); %time for next arrival1
event(2)=inf; %no next service completion (empty system)
event(3)=exprnd(tstep); %time for next measurement event
nbrmeasurements=0; %number of measurement events so far
nbrdeparted=0; %number of departed customers
nbrarrived=0; %number of customers that have arrived throughout the simulationsn(event)
while t<endtime
    [t,nextevent]=min(event);
    if nextevent==1
        event(1)=exprnd(1/lambda)+t;
        currcustomers=currcustomers+1;
        nbrarrived=nbrarrived+1; %one more customer has arrived to the system through the simulations
        arrivedtime(nbrarrived)=t; %the new customer arrived at time t
        if currcustomers==1
            event(2)=exprnd(1/mu)+t;
        end
    elseif nextevent==2
        currcustomers=currcustomers-1;
        timeinsystem=t-arrivedtime(nbrarrived-currcustomers);
        nbrdeparted=nbrdeparted+1; %one more customer has departed%from the system through the%simulations
        T(nbrdeparted)=timeinsystem;
        if currcustomers>0
            event(2)=exprnd(1/mu)+t;
        else
            event(2)=inf;
        end
    else
        nbrmeasurements=nbrmeasurements+1; %one more measurement event
        N(nbrmeasurements)=currcustomers;
        event(3)=event(3)+exprnd(tstep);
    end
end

%question 1)
%A) The system simulated here is M/M/1 as the arrival process and  service
%process is distributed exponentially and more over only one server is
%getting served per time i.e. only one server is available
%B)
total_no_of_customers=sum(nbrarrived)
average_number_of_customers=mean(N)
%C)
que_length=N-1
scotts_formula=3.49*std(N)*length(N)^(-1/3)
k = ceil((max(N) - min(N))/scotts_formula)
figure(1),histogram(que_length,k,'Normalization','pdf')
max(que_length)

%D)
scotts_formula1=3.49*std(T)*length(T)^(-1/3)
k = ceil((max(T) - min(T))/scotts_formula1)
figure(2),histogram(T,k,'Normalization','pdf')
maximum_time_to_be_in_system=max(T)

%E)if no queue
arrival_rate=1/lambda %no change in probaility
service_rate=1/mu %no change in probability
event_pr_3=0 %has no queue then there is no measurement o next customer

%Q2)
clear all; %empty memory
rng(1);% rand(’seed’,0)%set random seed
lambda=7; %arrival rate
mu=10; %service rate
endtime=1000; %simulation length

t=0; %current time
tstep=1; %average time between consecutive measurement events
buffer_size1=0;%current number of customers in system
buffer_size2=0;
event=zeros(1,4); %constructs vector to keep time for next arrival
%(pos 1),next service completion (pos 2) and next
% nextservice completion of 2nd system (pos3) measurement event (pos 4)
event(1)=exprnd(1/lambda); %time for next arrival1
event(2)=inf; %no next service completion (empty system)
event(3)=inf; %no next service completion (empty system)
event(4)=exprnd(tstep); %time for next measurement event
nbrmeasurements=0; %number of measurement events so far
nbrarrived=0; %number of customers that have arrived throughout the simulationsn(event)
nbrdeparted1=0;%number of departed customers
nbrdeparted2=0;

while t<endtime
    [t,nextevent]=min(event);
    if nextevent==1
        event(1)=exprnd(1/lambda)+t;
        buffer_size1=buffer_size1+1;
        nbrarrived=nbrarrived+1; %one more customer has arrived to the system through the simulations
        arrivedtime(nbrarrived)=t; %the new customer arrived at time t
        if buffer_size1==1
            event(2)=exprnd(1/mu)+t;
        end
    elseif nextevent==2
        buffer_size1=buffer_size1-1;
        buffer_size2=buffer_size2+1;
        nbrdeparted1=nbrdeparted1+1;%one more customer has departed%from the system through the%simulations
        timeinsystem1=t-arrivedtime(nbrdeparted1);
        
       if buffer_size1>0
            event(2)=exprnd(1/mu)+t;
        else
            event(2)=inf;
        end
        if buffer_size2==1
            event(3)=exprnd(1/mu)+t;
        end
        
    elseif nextevent==3
        buffer_size2=buffer_size2-1;
        nbrdeparted2=nbrdeparted2+1;
        timeinsystem2(nbrdeparted2)=t-arrivedtime(nbrdeparted2)-timeinsystem1(nbrdeparted2);
        
        if buffer_size2>0
            event(3)=exprnd(1/mu)+t;
        else
            buffer_size2==inf;
        end
        
    else
        nbrmeasurements=nbrmeasurements+1; %one more measurement event
        N(nbrmeasurements)=buffer_size2;
        event(4)=event(4)+exprnd(tstep);
    end
end



    

