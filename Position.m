function [xpos, ypos, mHist, rHist] = Position(m, radie, position, dt, t)

G = 6.67430e-11; % m^3 kg^-1 s^-2
mergeFactor = 0.5;

m = m(:);
r = radie(:);
N = numel(m);
tspan = 0:dt:t;
numSteps = numel(tspan);

xpos  = NaN(N, numSteps);
ypos  = NaN(N, numSteps);
mHist = NaN(N, numSteps);
rHist = NaN(N, numSteps);

x = position(:, 1);
y = position(:, 2);
velx = zeros(N, 1);
vely = zeros(N, 1);
alive = true(N, 1);

xpos(:, 1)  = x;
ypos(:, 1)  = y;
mHist(:, 1) = m;
rHist(:, 1) = r;

for step = 1:numSteps - 1

    Fx = zeros(N, 1);
    Fy = zeros(N, 1);
    idx = find(alive);

    for a = 1:numel(idx) - 1
        j = idx(a);
        for b = a + 1:numel(idx)
            k = idx(b);
            dx = x(k) - x(j);
            dy = y(k) - y(j);
            d = hypot(dx, dy);

            if d == 0
                continue
            end

            F = G * m(j) * m(k) / d^2;
            Fxij = F * dx / d;
            Fyij = F * dy / d;

            Fx(j) = Fx(j) + Fxij;
            Fy(j) = Fy(j) + Fyij;
            Fx(k) = Fx(k) - Fxij;
            Fy(k) = Fy(k) - Fyij;
        end
    end

    ax = zeros(N, 1);
    ay = zeros(N, 1);
    ax(alive) = Fx(alive) ./ m(alive);
    ay(alive) = Fy(alive) ./ m(alive);

    velx = velx + ax * dt;
    vely = vely + ay * dt;

    x = x + velx * dt;
    y = y + vely * dt;

    merged = true;
    while merged
        merged = false;
        idx = find(alive);

        for a = 1:numel(idx) - 1
            j = idx(a);
            for b = a + 1:numel(idx)
                k = idx(b);
                d = hypot(x(k) - x(j), y(k) - y(j));

                if d <= mergeFactor * (r(j) + r(k))
                    M = m(j) + m(k);

                    x(j) = (m(j) * x(j) + m(k) * x(k)) / M;
                    y(j) = (m(j) * y(j) + m(k) * y(k)) / M;

                    velx(j) = (m(j) * velx(j) + m(k) * velx(k)) / M;
                    vely(j) = (m(j) * vely(j) + m(k) * vely(k)) / M;

                    r(j) = sqrt(r(j)^2 + r(k)^2);
                    m(j) = M;

                    alive(k) = false;
                    m(k) = 0;
                    velx(k) = 0;
                    vely(k) = 0;

                    merged = true;
                    break
                end
            end
            if merged
                break
            end
        end
    end

    xpos(alive, step + 1)  = x(alive);
    ypos(alive, step + 1)  = y(alive);
    mHist(alive, step + 1) = m(alive);
    rHist(alive, step + 1) = r(alive);
end

fprintf('Simulation Complete\n')
end