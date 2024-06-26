# UCM-MATH131-COVID-Pandemic-Population-Prediction
## Descriptions: 
We aimed to utilize numerical methods to unveil the Susceptible, Infectious, and Recovered population dynamics under a pandemic to gather insights for a better understanding of the spread of viruses and delve into the parameters to minimize the negative impacts from the pandemics.

## Project Details:
1. We first constructed the Susceptible-Infectious-Recovered (SIR) model and aimed to simulate the behaviors of different population changes during a pandemic.
2. We then self-defined a system of 4th order Runge Kutta method to solve the SIR model
3. We also attempted to assess the accuracy of our numerical solution by comparing it with the ODE45 method, which is a state-of-the-art solution for numerical ordinary differential equations
4. Finally, we explored the effects on various populations by modifying the susceptible, infectious, and recovered rates, and minimizing the infectious period during rate tuning.

## File Details:
- [SIR.m](https://github.com/StevenG777/UCM-MATH131-COVID-Pandemic-Population-Prediction/blob/main/SIR.m): Defined SIR model
- [SIR_RK4_built_in.m](https://github.com/StevenG777/UCM-MATH131-COVID-Pandemic-Population-Prediction/blob/main/SIR_RK4_built_in.m): Used built-in SIR solver
- [SIR_RK4_system.m](https://github.com/StevenG777/UCM-MATH131-COVID-Pandemic-Population-Prediction/blob/main/SIR_RK4_system.m): Self-defined a SIR system solver
- [SIR_Visualization.m](https://github.com/StevenG777/UCM-MATH131-COVID-Pandemic-Population-Prediction/blob/main/SIR_Visualization.m): Visualized SIR population behavior through adjustment of parameters
- [Math 131 Final Project-3.pdf](https://github.com/StevenG777/UCM-MATH131-COVID-Pandemic-Population-Prediction/blob/main/Math%20131%20Final%20Project-3.pdf): Detailed report of the project

## Results
- We computed the maximum value for the self-defined solution as 33.5582, while the state-of-the-art solution's maximum value was 33.574, and the relative error was = 0.04765%. Therefore, the difference between the maximum value of an infectious population with the same conditions was negligible.
- After the experiments of varying infectious and recovered rates, we found out that if the recovered rate is greater than the infectious rate, we could minimize the top infectious population throughout the time of 30 days.
