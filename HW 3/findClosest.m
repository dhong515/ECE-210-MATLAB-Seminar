function [val, ind] = findClosest(x, desiredValue)

y = x(:)
diff = abs(y - desiredValue)
ind = find(diff == min(diff))
val = y(ind)

end
