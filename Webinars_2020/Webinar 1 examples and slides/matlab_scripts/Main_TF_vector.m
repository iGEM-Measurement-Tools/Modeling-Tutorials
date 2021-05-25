%   Constitutive Gene expression
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

p.kon = 0.5;       % Binding rate  [1/min]
p.koff = 1;    % Unbinding rate [1/min]

alpha = p.k2 * p.k1 * p.CN / p.d1

TF_v = [0.1 1 2.5 5 10 15 30]
figure2 = figure('Color',[1 1 1]);
colorm = flip(summer);
%% 0 Null initial conditions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:7
    
    tfin = 60*3;   %simulation final time
    step = 0.01;    %simulation step
    tspan = 0:step:tfin-step;
    % options for ode function
    opti = odeset('AbsTol',1e-8,'RelTol',1e-6);
    Init = [p.CN TF_v(i) 0 0 0];  %initial conditions
    
    [t0,x0] = ode23t(@(t,x) model_TF(t,x,p),tspan, Init, opti);
    
    %% Plots
    time = t0/60;
    plot(time,log10(x0(:,5)),'LineWidth',2,'Color',colorm(7*i+15,:));
    hold on
    ylabel({'# of molecules (log_{10})'});
    xlabel('Time (hr)')
    ylim([0 5])
    grid on
    
end
title('Protein')

%% export to PDF (or png)
figure_width = 4.5;
figure_height = 3.5;
set(gcf,'units','centimeters');
set(gcf,'papersize',[figure_width figure_height]);
set(gcf,'paperposition',[0,0,figure_width,figure_height]);
%print -dpng -painters -r300 'TF_induc.png';
%print -dpdf -painters -r300 'TF_induc.pdf'; %djpg