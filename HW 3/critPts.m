function critPts(x, y)

a = diff(y);
b = diff(x);
dydx = a ./ b;
xminmax = x(signSwitch(dydx));
yminmax = y(signSwitch(dydx));
d2ydx2 = diff(a) ./ diff(x(2:end));
xpoi = x(signSwitch(d2ydx2));
ypoi = y(signSwitch(d2ydx2));

figure;
plot(x, y, xminmax, yminmax, 'ko', xpoi, ypoi, 'r*');

end

function SS = signSwitch(v)

u = (v >= 0)
orig = u(1:end-1)
shift = u(2:end)
SS = find(xor(orig, shift))

end