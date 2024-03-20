% Credit
% The Outline of code is reference from 
% "RK4 Method for Solving SIR Model" by Jun (Tony) Cai (Tsai)

% The comments are made by mine to give clarifications

function dy = SIR(t, y, beta, gamma, N)
% only two ODEs of SIR model are independent
% solving three ODE together, MATLAB gives wrong solution
S = y(1);    
I = y(2);

% Construct SIR functions
dS = - beta * S * I / N;
dI = beta * S * I / N - gamma * I;
dy = [dS, dI]';
end

