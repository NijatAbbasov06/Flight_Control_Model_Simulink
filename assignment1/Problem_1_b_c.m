

phi = 20; 
theta = 45; 
psi = 15;


phi = deg2rad(phi);
theta = deg2rad(theta);
psi = deg2rad(psi);

q0 = cos(psi/2)*cos(theta/2)*cos(phi/2) + sin(psi/2)*sin(theta/2)*sin(phi/2);
q1 = cos(psi/2)*cos(theta/2)*sin(phi/2) - sin(psi/2)*sin(theta/2)*cos(phi/2);
q2 = cos(psi/2)*sin(theta/2)*cos(phi/2) + sin(psi/2)*cos(theta/2)*sin(phi/2);
q3 = sin(psi/2)*cos(theta/2)*cos(phi/2) - cos(psi/2)*sin(theta/2)*sin(phi/2);


quat = [q0, q1, q2, q3];


DCM = [ cos(theta)*cos(psi),  cos(theta)*sin(psi), -sin(theta);
        sin(phi)*sin(theta)*cos(psi) - cos(phi)*sin(psi), sin(phi)*sin(theta)*sin(psi) + cos(phi)*cos(psi), sin(phi)*cos(theta);
        cos(phi)*sin(theta)*cos(psi) + sin(phi)*sin(psi), cos(phi)*sin(theta)*sin(psi) - sin(phi)*cos(psi), cos(phi)*cos(theta)];

q0_dcm = sqrt(0.25*(1 + DCM(1,1) + DCM(2,2) + DCM(3,3)));
q1_dcm = (DCM(2,3) - DCM(3,2)) / (4 * q0_dcm);
q2_dcm = (DCM(3,1) - DCM(1,3)) / (4 * q0_dcm);
q3_dcm = (DCM(1,2) - DCM(2,1)) / (4 * q0_dcm);

quat_dcm = [q0_dcm, q1_dcm, q2_dcm, q3_dcm];
disp(quat_dcm);
disp(quat)


tolerance = 1e-6;  % Define a small tolerance value

if norm(quat - quat_dcm) < tolerance
    disp("values are equal")
else
    disp("values are not equal")
end



%part c




