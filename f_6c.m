function out = f_6c(x)
% Function that corresponds to a voting protocol.
assert(length(x)==6);
x1 = x(1);
x2 = x(2);
x3 = x(3);
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

