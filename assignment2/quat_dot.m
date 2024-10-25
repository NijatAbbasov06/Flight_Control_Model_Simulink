function q_dot = quat_dot(q, w_B)
    q_0 = q(1);
    q_1 = q(2);
    q_2 = q(3);
    q_3 = q(4);

    p = w_B(1);
    q = w_B(2);
    r = w_B(3);

    epsilon_q = 1-(q_0^2 + q_1^2 + q_2^2 + q_3^2);

    C_k = 5;
    A = [0, -p, -q, -r;
         p,  0,  r, -q;
         q, -r,  0,  p;
         r,  q, -p,  0];

    
    q_dot = 1/2 * A *q + C_k * epsilon_q*q;


end