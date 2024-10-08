function [F_R] = leadlagcalculator(omega_c, phi_m, T_I_Constant)
s=tf('s');
G=38/(180*s^3 + 1930*s^2 + 800*s);

Gfunc = @(x) 38/(180*x^3 + 1930*x^2 + 800*x);

[mag, phase, wout] = bode(G, omega_c);
delta_phi = phi_m - (180 + phase) + 8;
Beta = inverse_arctan(deg2rad(delta_phi))

T_D = 1/(omega_c*sqrt(Beta));

F_Lead = (T_D * s + 1) / (Beta * T_D*s + 1);

Gain_F = 1/(sqrt(Beta));
K = 1/(abs(Gfunc(omega_c*i))*Gain_F)

e1 = 1/(computeLimit(K*F_Lead*G, 0, true));

gamma = 0.049/e1
T_I = T_I_Constant / omega_c
F_Lag = (T_I*s + 1) / (T_I*s + gamma);

F_R = K * F_Lead * F_Lag;
end