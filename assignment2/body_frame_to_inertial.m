function v_I = body_frame_to_inertial(v_B, C_B_I)

    v_I = C_B_I * v_B;