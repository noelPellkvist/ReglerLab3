function [L,L_0] = CalculateL
s = tf('s');
% Design criteria
OS = 0.05; % 5% overshoot
zeta = 0.7; % damping ratio for 5% overshoot
Ts = 4; % settling time (adjust as necessary)
omega_n = 4 / (zeta * Ts); % natural frequency approximation

% Place the dominant poles
p1 = -zeta * omega_n + omega_n * sqrt(zeta^2 - 1); % Dominant pole 1
p2 = -zeta * omega_n - omega_n * sqrt(zeta^2 - 1); % Dominant pole 2
p3 = -5 * omega_n; % Third pole far to the left

G = 1/((s-p1) * (s - p2) * (s - p3));

L3 = (-193 - 18*(p1 +p2 + p3))/9;
L2 = (p1*p2+p1*p3+p2*p3 - L3/9 - 40/9)*(9/38);
L1 = -p1*p2*p3*(90/19);
L_0 = L1;
L = [L1 L2 L3];
end
%9.14
