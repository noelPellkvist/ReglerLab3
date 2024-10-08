PersonalNumber = 030312;
[J, umax] = lab3robot(PersonalNumber);
%J= 4.5
%umax = 100

s=tf('s');
G=38/(s*(800 + 180*s^2 + 1930*s));
K=4.55;
w_c = 0.8;
phi_m = 65;
T_I_C = 20;
F = leadlagcalculator(w_c, phi_m, T_I_C);

A=[0 1/20 0;
  0 -2/9 76/9;
   0 -1/4 -21/2];
B=[0;0;1/2];
C=[1,0,0];

[L, L0] = CalculateL();
lab3robot(G,K,F,A,B,C,L,L0,PersonalNumber);
