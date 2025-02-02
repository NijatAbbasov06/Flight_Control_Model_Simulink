function [v_B_dot, w_B_dot] = v_B_dot_w_B_dot(F_aero, M_aero, F_thrust, M_thrust, m, g, euler, v_B, w_B, I_xx, I_yy, I_zz)
    % This function evaluates derivative of vehicle speed in body frame 
    % and angular velocity of the center of gravity of the vehicle
    phi = euler(1);
    theta = euler(2);
    p = w_B(1);
    q = w_B(2);
    r = w_B(3);


    w_x = [0, -r,  q;
           r,  0, -p;
          -1   p   0   ];

    L_a = M_aero(1);
    M_a = M_aero(2);
    N_a = M_aero(3);

    L_t = M_thrust(1);
    M_t = M_thrust(2);
    N_t = M_thrust(3);
    
    frame_change = [-sin(theta); sin(phi)*cos(theta); cos(phi)* cos(theta)];



    v_B_dot = (F_aero + F_thrust)/m + g * frame_change - w_x * v_B;
    
    Pseudo_force = [(I_yy-I_zz)*q*r/I_xx; (I_zz - I_xx)*p*r/I_yy; (I_xx - I_yy)*p*q/I_zz];
    Moment_aero = [L_a/I_xx; M_a/I_yy; N_a/I_zz];
    Moment_thrust = [L_t/I_xx; M_t/I_yy; N_t/I_zz];
    w_B_dot = Moment_aero + Moment_thrust + Pseudo_force;
    
    
end