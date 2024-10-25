
phi_0 = 0;
theta_0 = 0;
psi_0 = 0; 
p = 1.0; 
q = 0.5; 
r = 0.2; 
phi = deg2rad(phi_0);
theta = deg2rad(theta_0);
psi = deg2rad(psi_0);
t_f = 100; 
dt = 0.1;
time = 0:dt:t_f;
n = length(time);
phi_history = zeros(n, 1);
theta_history = zeros(n, 1);
psi_history = zeros(n, 1);
DCM_history = zeros(n, 3, 3);
quat_history = zeros(n, 4);
phi_history(1) = phi;
theta_history(1) = theta;
psi_history(1) = psi;

for i = 1:n-1
    phi_dot = p + (q * sin(phi) + r * cos(phi)) * tan(theta);
    theta_dot = q * cos(phi) - r * sin(phi);
    psi_dot = (q * sin(phi) + r * cos(phi)) / cos(theta);
    phi = phi + (phi_dot * dt);
    theta = theta + (theta_dot * dt);
    psi = psi + (psi_dot * dt);
    phi_history(i+1) = phi;
    theta_history(i+1) = theta;
    psi_history(i+1) = psi;
    DCM = [
        cos(theta)*cos(psi), cos(theta)*sin(psi), -sin(theta);
        sin(phi)*sin(theta)*cos(psi) - cos(phi)*sin(psi), sin(phi)*sin(theta)*sin(psi) + cos(phi)*cos(psi), sin(phi)*cos(theta);
        cos(phi)*sin(theta)*cos(psi) + sin(phi)*sin(psi), cos(phi)*sin(theta)*sin(psi) - sin(phi)*cos(psi), cos(phi)*cos(theta)
    ];
    DCM_history(i+1, :, :) = DCM;
    q0 = sqrt(1 + DCM(1,1) + DCM(2,2) + DCM(3,3)) / 2;
    q1 = (DCM(3,2) - DCM(2,3)) / (4 * q0);
    q2 = (DCM(1,3) - DCM(3,1)) / (4 * q0);
    q3 = (DCM(2,1) - DCM(1,2)) / (4 * q0);
    quat_history(i+1, :) = [q0, q1, q2, q3];
end
phi_history_deg = rad2deg(phi_history);
theta_history_deg = rad2deg(theta_history);
psi_history_deg = rad2deg(psi_history);

figure;
subplot(3, 1, 1);
plot(time, phi_history_deg, 'r', 'DisplayName', 'Roll (phi)');
hold on;
plot(time, theta_history_deg, 'g', 'DisplayName', 'Pitch (theta)');
plot(time, psi_history_deg, 'b', 'DisplayName', 'Yaw (psi)');
title('Euler Angles histories');
xlabel('Time (s)');
ylabel('Angles (degrees)');



figure;
plot(time, DCM_history(:, 1, 1), 'r', 'DisplayName', 'DCM(1,1)');
hold on;
plot(time, DCM_history(:, 2, 2), 'g', 'DisplayName', 'DCM(2,2)');
plot(time, DCM_history(:, 3, 3), 'b', 'DisplayName', 'DCM(3,3)');
title('DCM histories');
xlabel('Time (s)');
ylabel('DCM Values');


figure;
plot(time, quat_history(:, 1), 'r', 'DisplayName', 'q0');
hold on;
plot(time, quat_history(:, 2), 'g', 'DisplayName', 'q1');
plot(time, quat_history(:, 3), 'b', 'DisplayName', 'q2');
plot(time, quat_history(:, 4), 'k', 'DisplayName', 'q3');
title('Quaternions histories');
xlabel('Time (s)');
ylabel('Quaternion Values');

