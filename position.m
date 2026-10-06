dt = 0.1;

x1 = 10; y1 = 10;
v1x = 0; v1y = 0;
x2 = 8;
y2 = 4;
x3 = 6;
y3 = 9;
for t = 0:dt:100
    
    d1 = sqrt((x2 - x1)^2 + (y2 - y1)^2);
    d2 = sqrt((x3 - x1)^2 + (y3 - y1)^2);
   
    d1 = max(d1, 0.1); 
    d2 = max(d2, 0.1); %så man inte dividerar med noll
    
    theta1 = atan2d(y2 - y1, x2 - x1);
    theta2 = atan2d(y3 - y1, x3 - x1);
    
    if x1 == x2
    fprintf('r12 = r1 + r2');
        elseif x1 == x3
    fpintf('r13 = r1 + r3');
        elseif x2 == x3
    fprintf('r23 = r2 + r3');
    else
        continue
    end
    
    F1 = (r1 * r2) / d1^2;
    F2 = (r1 * r3) / d2^2;

    F1x = F1 * cosd(theta1);
    F1y = F1 * sind(theta1);
    F2x = F2 * cosd(theta2);
    F2y = F2 * sind(theta2);
    
    Fx = F1x + F2x;
    Fy = F1y + F2y;
    
    ax1 = Fx / r1;
    ay1 = Fy / r1;
    
    v1x = v1x + ax1 * t;
    v1y = v1y + ay1 * t;
    
    x1 = x1 + v1x * t;
    y1 = y1 + v1y * t;

    if x1 ~= x2 || x1 ~= x3 || x2 ~= x3
        continue
    else
        fprintf('radierna kombineras')
    end
    end