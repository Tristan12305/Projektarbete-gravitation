function [radie, m, position] = SkapaMassor(n)

    rho = 5516*1000; %kg/m^3
    area = randi([1, 50], n, 1); %m^2

    position = randi([-40, 40], n, 2); %m
    radie = sqrt(area / pi); %m

    volym = (4/3) * pi * radie.^3; %m^3

    m = rho * volym; %kg
end
