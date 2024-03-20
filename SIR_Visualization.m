%% SIR Model Prediction by Fourth Order Runge-Kutta Method
%% Inputs Set up

% t0: initial time value    
% tf: final time value
% initial values for S,I,R as alphas(1), alphas(2) and alphas(3)
% beta: infection coefficient / Transmission Rate (Need modification)
% gamma: removal coefficient / Recovery Rate (Need modification)
% interval: number of intervals used

% Starting Time: 0 day
t0 = 0;
% Ending Time: 30 days
tf = 30;
% Assume Total Population of 100 percents
% initial value of 90% for susceptible
% initial value of 10% for infected
% initial value of 0%  for recovery
alphas = [90 10 0];

% NOTE: All visualizations in the report are created by 
% adjusting the value of Infection Rate & Recovery Rate

% Infection Rate of 1.5%
beta = 1.5;
% Recovery Rate of 0.5%
gamma = 0.5;
% Time interval of 500
interval = 500;

%% SIR Model Predictor Implementation

[S,I,R,t] = SIR_RK4_system(t0,tf,alphas,beta,gamma,interval);

%% SIR Model Predictior Visualization
hold on
plot(t,S,':y',...
     t,I,':c',...
     t,R,':r')
title('SIR Model Prediction')
xlabel('Time/days)')
ylabel('Nmber of population for S,I,R')
legend('Susceptible','Infected','Recovery','Location','east')

%% SIR Model Maximum Infective Population and time
% peak of the infected
[maxVal, ind] = max(I);

disp('Maximum Value of Infectious Population for Fourth Order Runge-Kutta Method is:')
disp(maxVal)
