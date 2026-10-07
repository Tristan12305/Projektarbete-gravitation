clc
clear

dt = 0.1;
t = 1;

[radie, m, position] = SkapaCirklar();

[xpos, ypos, m] = Position(m, position, dt, t);

AnimeraGravitation(xpos, ypos, radie);