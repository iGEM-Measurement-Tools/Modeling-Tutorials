% Constitutive gene expression model.
% Updated 17/06/2020 Alejandro Vignoni
function [dxdt] = model_const(t,x,p)
%x1 = mRNA
dxdt(1,1) =p.CN*p.k1-p.d1*x(1);
%x2 = Protein
dxdt(2,1)=p.k2*x(1)-p.d2*x(2);
end