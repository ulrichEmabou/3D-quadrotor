# 3D-quadrotor
THis is a project i started through the course Aerial robotics in coursera
I recommend beginners to follow it


in The Controller.m file 
i wrote the necessary equations for the 3D control 
and some tuned PID values 


the trajectory generator.m  
uses Getcoffx.m,Getcoffy.m and 
Getcoffz.m files to generate 
a 5 waypoints trajectory



The taj_helix.mat file contains precalculated 
values of x,y,z to be followed 
by the quadrotor
to follow an 
helix


The traj_line.mat files contains precalculated 
values of x,y,z to be followed 
by the quadrotor
to follow a
line

The Runsim.m is the 
Run program with necessary desired waypoints
it is also meant to choose the Navigation 
style
