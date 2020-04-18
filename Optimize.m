clear, clc
global q Dab0 Lam Phi TO TETA Eps ; %pour utliser des variables qui sont declarer dans la fonction
A0 = [200,200];
fprintf('les paramètres A12 et A21 estimés :')
A = fminsearch(@Function,A0)
% Cette fonction "fminsearch" vas trouvée les parametres pour avoir le petit ecart exist entre la valeur
% expérimentale et la valeur théorique, en jouant sur la convergence de notre fonction.
fprintf('Avec un ecart de :')
Eps
X = 0.1:0.0001:0.7;
Y = exp((1-X).*log(Dab0(1))+X.*Dab0(2)+2.*(X.*log(X./Phi(1))+(1-X).*log((1-X)./Phi(2)))+...
    2.*X.*(1-X).*((Phi(1)./X).*(1-(Lam(1)./Lam(2)))+(Phi(2)./(1-X)).*(1-(Lam(2)./Lam(1))))+...
    (1-X).*q(1).*((1-TETA(2).^2).*log(TO(2))+(1-TETA(4).^2)*TO(1).*log(TO(1)))+X.*q(2).*((1-TETA(1).^2).*log(TO(1))+(1-TETA(3).^2).*TO(2).*log(TO(2))));
plot(X,Y,'r')
title('Coefficient de diffusion = f (Fraction molaire)')
xlabel('=== Xa ===>')
ylabel('=== Dab ===>')
%d'apres la courbe, on voit le Dab est presque null dans l'intervalle
%Xa=[0.1 0.3], apres cette fraction on vois une augmentation exponentielle
%de Dab jusqu'a Xa=0.7.