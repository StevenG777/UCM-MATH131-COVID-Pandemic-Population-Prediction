%% Credit
% The Outline of code is reference from 
% "RK4 Method for Solving SIR Model" by Jun (Tony) Cai (Tsai)

% The comments are made by mine to give clarifications

%% SIR Model Prediction using MATLAB ode45 solver

clear

% Time Interval
t = 0:3/50:30;
% Initial Values for S,I,R
S0 = 90;
I0 = 10;
R0 = 0;
% Total Population
N = S0 + I0 + R0;
% Combine IVs into a row vector
y0 = [S0, I0];
% pre-define infection and recovery rate
beta = 3/2;
gamma = 1/2;
% Set option into empty vector
options = [];


% Note 1: All inputs are the exact inputs as SIR_Visualization.m
% Note 2: @SIR is the same set of equations as dS, dI, dR 
% in SIR_RK4_system.m
% Note 3: 'options' argument equals to [] in default

[T, Y] = ode45(@SIR, t, y0, options, beta, gamma, N);

%% Calculate the peak of the infected and time
[maxVal, ind] = max(Y(:, 2));

disp('Maximum Value of Infectious Population for ode45 is:')
disp(maxVal)

%% SIR Model Predictor Visualization
S = Y(:, 1);
I = Y(:, 2);
R = N - S - I;
plot(T, S, '-y', T, I, '-c', T, R, '-r')
title('SIR Model Prediction using MATLAB ode45 solver')
xlabel('Time/Days')
ylabel('Nmber of population for S,I,R')
legend('Susceptible','Infected','Recovery','Location','east')

%% add veritical line to indicate the peak
ylim = get(gca, 'ylim');  %  get y range
hold on
plot([ind - 1, ind - 1], [ylim(1), ylim(2)], 'LineStyle', '--')
















