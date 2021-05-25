% Constitutive gene expression model.
% Updated 17/06/2020 Alejandro Vignoni
function [dxdt] = model_TF(t,x,p)
%x1 = Promoter
dxdt(1,1) = -p.kon*x(1)*x(2)+p.koff*x(3);
%x2 = TF
dxdt(2,1)= -p.kon*x(1)*x(2)+p.koff*x(3);
%x1 = Promoter.TF
dxdt(3,1) = +p.kon*x(1)*x(2)-p.koff*x(3);
%x1 = mRNA
dxdt(4,1) = x(3)*p.k1-p.d1*x(4);
%x2 = Protein
dxdt(5,1)=p.k2*x(4)-p.d2*x(5);
end