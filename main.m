clc
clear
v = VideoWriter("AnimeraGravitation.mp4", "MPEG-4");
v.FrameRate = 60;
open(v);

dt = 1;
t = 1000;

[radie, m, position] = SkapaMassor();

[xpos, ypos, m] = Position(m, position, dt, t);

AnimeraGravitation(xpos, ypos, radie, v);

close(v);