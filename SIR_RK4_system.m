function [S,I,R,t] = SIR_RK4_system(t0,tf,alphas,beta,gamma,interval) 

    % OVERVIEWS:
    % Function that computes the solution to the system of IVPs using RK4
    % R'= dR(t,I) not need for RK4 since R = Total Population - S - I
    % S'= dS(t,S,I)
    % I'= dI(t,S,I)
    % S(1)=alpha(1), I(1)=alpha(2) and R(1)=alpha(3),
    % The interval [t0,tf] with 'interval' steps size.
    
    % INPUTS:
    % t0: initial time value
    % tf: final time value
    % initial values for S,I,R as alphas(1), alphas(2) and alphas(3)
    % beta: infection coefficient / Transmission Rate (Need modification)
    % gamma: removal coefficient / Recovery Rate (Need modification)
    % interval: number of intervals used
    
    % OUTPUT:
    % t the time steps
    % S column vector
    % I column vector
    % R column vector

     
    % Creation of the nodes and time step
    dt = (tf-t0)/interval;           % Time-Step
    t = zeros(interval+1,1);         % initialize t vector
    
    % Define t vector
    t(1) = t0;                       % Define first element of time
    t(end) = tf;                     % Define last  element of time
    for j = 1:interval-1             % Define other elements of time
        t(j+1) = t(j) + dt;
    end
    
    % Calculate the Total Population
    N = 0;
    for i = 1:3
        N = N + alphas(i);
    end
    
    % Initialize S,I,R
    S = zeros(interval+1,1);         % Initialize S vector
    I = zeros(interval+1,1);         % Initialize I vector
    R = zeros(interval+1,1);         % Initialize R vector
    
    % Assign Initial Values
    S(1) = alphas(1);                % Assign fist element of S
    I(1) = alphas(2);                % Assign fist element of I
    R(1) = alphas(3);                % Assign fist element of R
    
    % Construct SIR Models
        % dS = -(beta * S * I)/N
        dS = @(t,S,I) -(beta * S * I)/N;
        
        % dI = (beta * S * I)/N - gamma * I;
        dI = @(t,S,I) (beta * S * I)/N - gamma * I;
        
        % dR = gamma * I;
        dR = @(t,I) gamma * I;
        % NOTE: dR not needed since there are only two unknown variables
        % Defined and it just for SIR model integrity
    
    % Solve for system of ODE
        % Solve for S & I function %(Need modification)
        for i = 1:interval
            SK1 = dS(t(i),S(i),I(i));
            IK1 = dI(t(i),S(i),I(i));
            
            SK2 = dS(t(i) + (dt/2), S(i) + SK1*(dt/2), I(i) + IK1*(dt/2));
            IK2 = dI(t(i) + (dt/2), S(i) + SK1*(dt/2), I(i) + IK1*(dt/2));
            
            SK3 = dS(t(i) + (dt/2), S(i) + SK2*(dt/2), I(i) + IK2*(dt/2));
            IK3 = dI(t(i) + (dt/2), S(i) + SK2*(dt/2), I(i) + IK2*(dt/2));
            
            SK4 = dS(t(i) + dt    , S(i) + SK3*dt    , I(i) + IK3*dt);
            IK4 = dI(t(i) + dt    , S(i) + SK3*dt    , I(i) + IK3*dt);
            
            S(i+1) = S(i) + (dt/6) * (SK1 + 2*SK2 + 2*SK3 + SK4);          
            I(i+1) = I(i) + (dt/6) * (IK1 + 2*IK2 + 2*IK3 + IK4);
        end
        
        % For R function
        for i = 2:interval+1
            R(i) = N - S(i) -I(i);
        end
end