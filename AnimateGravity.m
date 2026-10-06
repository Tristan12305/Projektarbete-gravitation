function AnimateGravity(xpos,ypos,radie)

N = size(xpos, 2);
numObjects = size(xpos, 1);

figure;
hold on
axis equal
grid on
xlim([min(xpos(:)) max(xpos(:))])
ylim([min(ypos(:)) max(ypos(:))])

for i = 1:numObjects
    trajectory(i) = plot(xpos(i, 1), ypos(i, 1), '-');
    position(i) = plot(xpos(i,1), ypos(i,1), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'auto');
end

for k = 1:N
    
    for i = 1:numObjects
        trajectory(i).XData = xpos(i,1:k);
        trajectory(i).YData = ypos(i,1:k);
        position(i).XData = xpos(i,k);
        position(i).YData = ypos(i,k);
    end

    drawnow;
    pause(0.01)
end

end