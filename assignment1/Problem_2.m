
phi = 0; 
theta = 90; 
psi = 0;


phi = deg2rad(phi);
theta = deg2rad(theta);
psi = deg2rad(psi);

DCM = [ cos(theta)*cos(psi),  cos(theta)*sin(psi), -sin(theta);
        sin(phi)*sin(theta)*cos(psi) - cos(phi)*sin(psi), sin(phi)*sin(theta)*sin(psi) + cos(phi)*cos(psi), sin(phi)*cos(theta);
        cos(phi)*sin(theta)*cos(psi) + sin(phi)*sin(psi), cos(phi)*sin(theta)*sin(psi) - sin(phi)*cos(psi), cos(phi)*cos(theta)];


new_phi = atan(DCM(2,3) /DCM(3,3));
new_theta = asin (-DCM(1,3));
new_psi = atan(DCM(1,2)/ DCM(1,1));

new_phi = rad2deg(new_phi);
new_theta = rad2deg(new_theta);
new_psi = rad2deg(new_psi);


disp(new_phi);
disp(new_theta);
disp(new_psi);


disp(DCM)
DCM_231 = [
    cos(theta)*cos(psi),  cos(theta)*sin(psi),  -sin(theta);
    sin(phi)*sin(theta)*cos(psi) - cos(phi)*sin(psi),  sin(phi)*sin(theta)*sin(psi) + cos(phi)*cos(psi),  sin(phi)*cos(theta);
    cos(phi)*sin(theta)*cos(psi) + sin(phi)*sin(psi),  cos(phi)*sin(theta)*sin(psi) - sin(phi)*cos(psi),  cos(phi)*cos(theta)
];



new_phi_2_3_1 = atan(DCM(2,3) /DCM(3,3));
new_theta_2_3_1 = asin (-DCM(1,3));
new_psi_2_3_1 = atan(DCM(1,2)/ DCM(1,1));

new_phi_2_3_1 = rad2deg(new_phi_2_3_1);
new_theta_2_3_1 = rad2deg(new_theta_2_3_1);
new_psi_2_3_1 = rad2deg(new_psi_2_3_1);


disp(DCM_231);

disp(new_phi_2_3_1);
disp(new_theta_2_3_1);
disp(new_psi_2_3_1);






