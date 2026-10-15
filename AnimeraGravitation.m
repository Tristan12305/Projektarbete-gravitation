function AnimeraGravitation(xpos, ypos, radie, v)

numSteps   = size(xpos, 2);
numObjects = size(xpos, 1);

fig = figure;
axis equal
hold on
grid on
title('Gravitationsimulering')
xlabel('X Position (m)')
ylabel('Y Position (m)')

xlim([-50 50])
ylim([-50 50])

theta = linspace(0, 2*pi, 100);

for i = 1:numObjects
    trajectory(i) = plot(xpos(i, 1), ypos(i, 1), '-');
    position(i) = fill(xpos(i, 1) + radie(i, 1) * cos(theta), ypos(i, 1) + radie(i, 1) * sin(theta), 1);
end

maxFrames = min(numSteps, 2 * 60 * 60);

for k = 1:maxFrames

    for i = 1:numObjects
        trajectory(i).XData = xpos(i, 1:k);
        trajectory(i).YData = ypos(i, 1:k);

        if isnan(radie(i, k))
            position(i).Visible = 'off';
        else
            position(i).XData = xpos(i, k) + radie(i, k) * cos(theta);
            position(i).YData = ypos(i, k) + radie(i, k) * sin(theta);
        end
    end

    drawnow;

    writeVideo(v, getframe(fig));
end

end