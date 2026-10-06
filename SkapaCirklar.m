function [radie, position] = SkapaCirklar()
    area = randi([1, 50], 3);
    position = RandomPosition();

    radie = sqrt(area / pi);
end

function pos = RandomPosition()
    % Later: prevent overlap between positions
    pos = randi([-10, 10], 3, 2);
end