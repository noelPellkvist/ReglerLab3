G=38/(s*(800 + 180*s^2 + 1930*s));
S_1 = 1/(1 + 13.2661 * G)
w_c = 0.8;
phi_m = 65;
T_I_C = 20;
F = leadlagcalculator(w_c, phi_m, T_I_C);

S_2 = 1/(1 + F * G)
bodemag(S_1, S_2);