function out = f_6q(x)
assert(length(x)==6);
x1 = mod(x(1) + x(4), 2);
x2 = mod(x(2) + x(5), 2);
x3 = mod(x(3) + x(6), 2);

x4 = x(4);
x5 = x(5);
x6 = x(6);

if x1 && ~x2 && ~x3
    out = x5;
elseif ~x1 && x2 && ~x3
    out = x6;
elseif ~x1 && ~x2 && x3
    out = x4;
elseif x1 && x2 && ~x3
    out = x5;
elseif x1 && ~x2 && x3
    out = x4;
elseif ~x1 && x2 && x3
    out = x6;
elseif x1 && x2 && x3
    out = 1;
elseif ~x1 && ~x2 && ~x3
    out = 0;
end
end
