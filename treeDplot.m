clear, clc
global Eps ;
for i=0:5:400
  A0 = [i,i];  
A = fminsearch(@Function,A0);
 plot3(A(1),A(2),Eps,'*');
 hold on
end
%a chaque initialisation ici on obtient des A12 et A21 diffirentes, si A12
%augmente l'autre diminuer (pour avoir toujours une compensation) puis
%qu'il ya pas un intervalle precis, et les ecarts plus ou moins
%sont egaux, donc on peut initialiser notre programme par une valeure quelconque.