function [radie, massa, position] = SkapaCirklar()

    rho = 5516; %kg/m^3
    area = randi([1, 50], 3, 1); %m^2

    position = randi([-10, 10], 3, 2); %m

    radie = sqrt(area / pi); %m

    volym = (4/3) * pi * radie.^3; %m^3

    massa = rho * volym; %kg
end