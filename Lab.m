PersonalNumber = 030312;
[J, umax] = lab3robot(PersonalNumber);
%J= 4.5
%umax = 100

s=tf('s');
G=38/(s*(800 + 180*s^2 + 1930*s));
K=4.55;
F = leadlagcalculator(0.8, 65, 20);
A=0;
B=0;
C=0;
L=0;
L0=0;
lab3robot(G,K,F,A,B,C,L,L0,PersonalNumber);
