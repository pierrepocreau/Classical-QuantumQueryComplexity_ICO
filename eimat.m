% Helper function to create the E_i matrices for SDP.
% Parameters: n (number of vars), i (index)

function ret = eimat(n,i)

if i==0
  ret = ones(2^n,2^n);
else
  vec = 1 - 2 * (bitand(0:2^n-1,2^(i-1)) ~= 0);
  ret = vec' * vec;
end
