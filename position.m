function [xpos, ypos, m] = Position(m, position, dt, t)

G = 6.67430e-11; % m^3 kg^-1 s^-2

xpos = zeros(length(m), length(0:dt:t));
ypos = zeros(length(m), length(0:dt:t));
velx = zeros(1, length(m));
vely = zeros(1, length(m));

xpos(1,1) = position(1, 1); xpos(2,1) = position(2, 1); xpos(3,1) = position(3, 1);
ypos(1,1) = position(1, 2); ypos(2,1) = position(2, 2); ypos(3,1) = position(3, 2);

tspan = 0:dt:t;
l = 0;
N = size(m, 1);
for i = 1:length(tspan)
    Fx = zeros(1, length(m));
    Fy = zeros(1, length(m));
    for j = 1:N
        for k = j+1:N
            
            dx = xpos(j, i) - xpos(k, i);
            dy = ypos(j, i) - ypos(k, i);

            d = sqrt(dx^2 + dy^2);
            F = G * (m(j) * m(k)) / d^2;

            Fxij = F * dx / d;
            Fyij = F * dy / d;

            Fx(j) = Fx(j) + Fxij;
            Fy(j) = Fy(j) + Fyij;
            Fx(k) = Fx(k) - Fxij;
            Fy(k) = Fy(k) - Fyij;

            ax = -Fx / m(j);
            ay = -Fy / m(j);

            %if d <= 1
            %    m(j) = m(j) + m(k);
            %    xpos(j,i) = (m(j) * xpos(j,i) + m(k) * xpos(k,i)) / m(j);
            %    ypos(j,i) = (m(j) * ypos(j,i) + m(k) * ypos(k,i)) / m(j);
            %    velx(j) = (m(j) * velx(j) + m(k) * velx(k)) / m(j);
            %    vely(j) = (m(j) * vely(j) + m(k) * vely(k)) / m(j);

            %    xpos(k) = [];
            %    ypos(k) = [];
            %    velx(k) = [];
            %    vely(k) = [];
            %    m(k) = [];
            %    N = N-1;
            %end
            
        end
    end
    size(ax)
    size(velx)
    velx = velx + ax.* dt;
    vely = vely + ay.* dt;
    xpos(:,i+1) = xpos(:,i) + transpose(velx) * dt;
    ypos(:,i+1) = ypos(:,i) + transpose(vely) * dt;
    
end
fprintf('Simulation Complete')              
end