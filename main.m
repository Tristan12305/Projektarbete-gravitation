clc
clear
v = VideoWriter("AnimeraGravitation.mp4", "MPEG-4");
v.FrameRate = 30;
open(v);
n = 8;
dt = 1;
t = 1000;
[radie, m, position] = SkapaMassor(n);

[xpos, ypos, m, radie] = Position(m, radie, position, dt, t);

AnimeraGravitation(xpos, ypos, radie, v);

close(v);