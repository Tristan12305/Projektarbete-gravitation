clc
clear

dt = 1;
t = 1000;

[radie, m, position] = SkapaMassor();

[xpos, ypos, m] = Position(m, position, dt, t);

AnimeraGravitation(xpos, ypos, radie);