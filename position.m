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
for i = 1:length(tspan)
    Fx = zeros(1, length(m));
    Fy = zeros(1, length(m));
    for j = 1:size(m, 1)
        for k = j+1:size(m, 1)
            
            l = l + 1;
            dx = xpos(j, i) - xpos(k, i);
            dy = ypos(j, i) - ypos(k, i);

            d = sqrt(dx^2 + dy^2);

            %if d <= 0.1
                %m(i) = m(i) + m(j);
                %xpos(i) = (m(i) * xpos(i) + m(j) * xpos(j)) / m(i);
                %ypos(i) = (m(i) * ypos(i) + m(j) * ypos(j)) / m(i);
                %velx(i) = (m(i) * velx(i) + m(j) * velx(j)) / m(i);
                %vely(i) = (m(i) * vely(i) + m(j) * vely(j)) / m(i);

                %xpos(j) = [];
                %ypos(j) = [];
                %velx(j) = [];
                %vely(j) = [];
                %m(j) = [];
                %break;
            %end

            F = G * (m(j) * m(k)) / d^2;

            Fxij = F * dx / d;
            Fyij = F * dy / d;

            Fx(j) = Fx(j) + Fxij;
            Fy(j) = Fy(j) + Fyij;
            Fx(k) = Fx(k) - Fxij;
            Fy(k) = Fy(k) - Fyij;
        end
        ax = Fx / m(j);
        ay = Fy / m(j);
    end
    
    velx = velx + ax.* dt;
    vely = vely + ay.* dt;
    xpos(:,i) = xpos(:,i) + transpose(velx) * dt;
    ypos(:,i) = ypos(:,i) + transpose(vely) * dt;
    

    

end              
end