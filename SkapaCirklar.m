function [radie, massa,  position] = SkapaCirklar()

    rho = 5516; %kg/m^3
    area = randi([1, 50], 3, 1);
    position = RandomPosition();

    radie = sqrt(area / pi);

    volym = (4/3) * pi * radie.^3;
    massa = rho * volym;
end

function pos = RandomPosition()
    pos = randi([-10, 10], 3, 2);
end