%Declaring variables


%Inertia values. Inertia tensor is diagonal matrix as 
%principal axes are chosen.

I_xx = 228.211; 
I_yy = 228.211;
I_zz = 246.355;



m = 327.316; %mass
g = 9.81; %gravitational acceleration
p = 1.225; %density of the environment


%aerodynamic forces are negligible
C_L = 0;
C_D = 0;


%Vector from center of gravity to the
%center of pressure
r_CP = [ 0.2; 0.0; 0.0]; 

k_r = 0.0001; %Aerodynamic damping coefficient

c = 20; %coefficient to calculate counter-moment

l = 2; %Rotor moment arm length

T_max = 1500; %Max thrust

t_i = 0.05; %time step for Euler method

time = 0:0.05:1500;

v_B = [0; 0; 0];

w_B = [0; 0; 0];

x_I = [0;0; -5];

euler_angles = [0;0;0];


for t = time
    

end


















