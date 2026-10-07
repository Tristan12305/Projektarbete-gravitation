function [radie, m, position] = SkapaMassor()

    rho = 5516*1000; %kg/m^3
    area = randi([1, 50], 3, 1); %m^2

    position = randi([-40, 40], 3, 2); %m

    radie = sqrt(area / pi); %m

    volym = (4/3) * pi * radie.^3; %m^3

    m = rho * volym; %kg
end