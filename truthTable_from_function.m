function table = truthTable_from_function(f, n)
% compute the truth table of a n bit Boolean function
table = [];
for x = dec2bin(0:2^n-1)' - '0'
    table = [table, f(x')];
end
end
