             %Mini projet “Estimation des paramètres du modèles thermodynamique UNIFAC appliqué en transfert de matière”
function y = Function(A)
global q Dab0 Lam Phi TO TETA Eps ;
R=[1.4311   0.92]; 
q=[1.432   1.4];
Dab0=[2.1*10^(-5)   2.67*10^(-5)];
Lam=[R(1).^(1/3)   R(2).^(1/3)];
DabExpab=1.33*10^-5;
X= 0.35;
T=313.13; 
TET= [(X.*q(1))/(X.*q(1)+(1-X).*q(2))   ((1-X).*q(2))/(X.*q(1)+(1-X).*q(2))];

Phi=[(X.*Lam(1))/(X.*Lam(1)+(1-X).*Lam(2))   ((1-X).*Lam(2))/(X.*Lam(1)+(1-X).*Lam(2))];

TO=[exp(-A(1)/T) exp(-A(2)/T) 1 1]; 

TETA=[(TET(1)*TO(1))/(TET(1)*TO(1)+TET(2)*TO(4)) (TET(2)*TO(2))/(TET(1)*TO(3)+TET(2)*TO(2))...
    (TET(1)*TO(3))/(TET(1)*TO(3)+TET(2)*TO(2))  (TET(2)*TO(4))/(TET(1)*TO(1)+TET(2)*TO(4))];

Dab = exp((1-X).*log(Dab0(1))+X.*Dab0(2)+2.*(X.*log(X./Phi(1))+(1-X).*log((1-X)./Phi(2)))+...
    2.*X.*(1-X).*((Phi(1)./X).*(1-(Lam(1)./Lam(2)))+(Phi(2)./(1-X)).*(1-(Lam(2)./Lam(1))))+...
    (1-X).*q(1).*((1-TETA(2).^2).*log(TO(2))+(1-TETA(4).^2)*TO(1).*log(TO(1)))+...
    X.*q(2).*((1-TETA(1).^2).*log(TO(1))+(1-TETA(3).^2).*TO(2).*log(TO(2))));
y = abs(Dab-DabExpab);
Eps = 100*y/DabExpab;
end
