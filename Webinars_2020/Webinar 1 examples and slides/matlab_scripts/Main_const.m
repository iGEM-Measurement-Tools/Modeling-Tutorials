%  Constitutive Gene expression
%   Parameters: structure contains all rates and constants
%   Updated 17/06/2020 by Alejandro Vignoni
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clear all;


    %Parameters
    p.CN = 17;        % plasmid number  pACYC184 (17 copies/cell)  
    p.d1 = log(2)/3;  % mRNA degradation rate  [1/min]
    p.d2 = 0.02;      % degradation rate [1/min]
    p.k2 = 8.23;      % translation rate  [1/min] 
    p.k1 = 1.19;      % transcription rate [1/min] 

   


%% 0 Null initial conditions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                  

tfin = 60*3;   %simulation final time
step = 0.1;    %simulation step
tspan = 0:step:tfin-step; 
% options for ode function
opti = odeset('AbsTol',1e-8,'RelTol',1e-6);      
Init = [0 0];  %initial conditions

[t0,x0] = ode23t(@(t,x) model_const(t,x,p),tspan, Init, opti);

time = t0./60;

Gene = ones(1800,1).*p.CN;
%% Plots
figure1 = figure('Color',[1 1 1]); 
plot(time,log10(Gene),'LineWidth',2);
hold on

plot(time,log10(x0(:,1)),'LineWidth',2);

plot(time,log10(x0(:,2)),'LineWidth',2); 
ylabel({'# of molecules (log_{10})'});
xlabel('Time (hr)')
legend('Gene','mRNA','Protein')
ylim([0 8])
%%
%% export to PDF (or png)
figure_width = 4.5;
figure_height = 3.5;
set(gcf,'units','centimeters');
set(gcf,'papersize',[figure_width figure_height]);
set(gcf,'paperposition',[0,0,figure_width,figure_height]);
%print -dpng -painters -r300 'TF.png';
%print -dpdf -painters -r300 'TF.pdf'; 










