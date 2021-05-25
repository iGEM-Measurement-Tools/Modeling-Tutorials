%Parameters
p.CN = 17;        % plasmid number  pACYC184 (molecules/cell)
p.d1 = log(2)/3;  % mRNA degradation rate  [1/min]
p.d2 = 0.02;      % degradation rate [1/min]
p.k2 = 8.23;      % translation rate  [1/min]
p.k1 = 1.19;      % transcription rate [1/min]

p.kon = 0.5;       % Binding rate  [ 1/molecules 1/min]
p.koff = 1;    % Unbinding rate [1/min]

p.Kd = p.koff/p.kon;  %Disosiation constant [molecules]

alpha = p.k2 * p.k1 * p.CN / p.d1; % Maximal Expression rate [molecules/min]

%% Hill Function for protein(TF)
% We make a vector of TF in which we want to know how much Protein we
% will get
TF = 0:0.01:1000;
% Calculate how much protein for each TF value
Protein  = alpha ./p.d2 .* (TF ./ (p.Kd+TF));

%% Plot
figure2 = figure('Color',[1 1 1]);
semilogx(TF,Protein,'LineWidth',2);
ylabel({'Protein (# of molecules)'});
xlabel('TF (# of molecules)')
grid on
title('Protein vs. Transcription Factor')
%
%% export to PDF (or png)
figure_width = 4.5;
figure_height = 3.5;
set(gcf,'units','centimeters');
set(gcf,'papersize',[figure_width figure_height]);
set(gcf,'paperposition',[0,0,figure_width,figure_height]);
%print -dpng -painters -r300 'Protein_vs_TF.png';
%print -dpdf -painters -r300 'Protein_vs_TF.pdf'; 