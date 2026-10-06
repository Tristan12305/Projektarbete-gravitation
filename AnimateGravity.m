function AnimateGravity(xpos,ypos,radie)

%dt = 1;
%t = 0:dt:1e3;
%xpos = [t*400; t*20000; 1e5.*t];
%ypos = [5*1e5+t.^2; 100*t.^2; 1e5.*t];
%radie = [1000000, 2000000, 3000000];

N = size(xpos, 2);
numObjects = size(xpos, 1);

figure;
hold on
axis equal
grid on
xlim([min(xpos(:)) max(xpos(:))])
ylim([min(ypos(:)) max(ypos(:))])

theta = linspace(0, 2*pi, 100);

for i = 1:numObjects
    trajectory(i) = plot(xpos(i, 1), ypos(i, 1), '-');
    position(i) = fill(xpos(i,1) + radie(i) * cos(theta), ypos(i,1) + radie(i) * sin(theta), 1);
end

for k = 1:N
    
    for i = 1:numObjects
        trajectory(i).XData = xpos(i,1:k);
        trajectory(i).YData = ypos(i,1:k);
        position(i).XData = xpos(i,k) + radie(i) * cos(theta);
        position(i).YData = ypos(i,k) + radie(i) * sin(theta);
    end

    drawnow;
    pause(0.01)
end

end