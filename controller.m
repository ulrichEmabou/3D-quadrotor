function [F, M] = controller(t, state, des_state, params)
%CONTROLLER  Controller for the quadrotor
%
%   state: The current state of the robot with the following fields:
%   state.pos = [x; y; z], state.vel = [x_dot; y_dot; z_dot],
%   state.rot = [phi; theta; psi], state.omega = [p; q; r]
%
%   des_state: The desired states are:
%   des_state.pos = [x; y; z], des_state.vel = [x_dot; y_dot; z_dot],
%   des_state.acc = [x_ddot; y_ddot; z_ddot], des_state.yaw,
%   des_state.yawdot
%
%   params: robot parameters

%   Using these current and desired states, you have to compute the desired
%   controls
KP=[100 100 8;1 1 400];
KA=[100 100 50;1 1 5];


R1=des_state.acc(1)+KP(2,1)*(des_state.vel(1)-state.vel(1))+KP(1,1)*(des_state.pos(1)-state.pos(1));
R2=des_state.acc(2)+KP(2,2)*(des_state.vel(2)-state.vel(2))+KP(1,2)*(des_state.pos(2)-state.pos(2));
R3=des_state.acc(3)+KP(2,3)*(des_state.vel(3)-state.vel(3))+KP(1,3)*(des_state.pos(3)-state.pos(3));


% =================== Your code goes here ===================

% Thrust
F = params.mass*(params.gravity+R3);

% Moment
M = [KA(1,1)*((1/params.gravity)*(R1*sin(des_state.yaw)-R2*cos(des_state.yaw))-state.rot(1))-KA(2,1)*state.omega(1);KA(1,2)*((1/params.gravity)*(R1*cos(des_state.yaw)+R2*sin(des_state.yaw))-state.rot(2))-KA(2,2)*state.omega(2);KA(1,3)*(des_state.yaw-state.rot(3))+KA(2,3)*(des_state.yawdot-state.omega(3))];

% =================== Your code ends here ===================

end
