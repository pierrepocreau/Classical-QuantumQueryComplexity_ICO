f = truthTable_from_function(@(x)f_6q(x),6);
n = 6; % number of bits
T = 3; % number of queries

E0 = eimat(n,0);
E1 = eimat(n,1);
E2 = eimat(n,2);
E3 = eimat(n,3);
E4 = eimat(n,4);
E5 = eimat(n,5);
E6 = eimat(n,6);

m00 = sdpvar(2^n, 2^n, 'symmetric');
m10 = sdpvar(2^n, 2^n, 'symmetric');
m20 = sdpvar(2^n, 2^n, 'symmetric');
m30 = sdpvar(2^n, 2^n, 'symmetric');
m40 = sdpvar(2^n, 2^n, 'symmetric');
m50 = sdpvar(2^n, 2^n, 'symmetric');
m60 = sdpvar(2^n, 2^n, 'symmetric');

m01 = sdpvar(2^n, 2^n, 'symmetric');
m11 = sdpvar(2^n, 2^n, 'symmetric');
m21 = sdpvar(2^n, 2^n, 'symmetric');
m31 = sdpvar(2^n, 2^n, 'symmetric');
m41 = sdpvar(2^n, 2^n, 'symmetric');
m51 = sdpvar(2^n, 2^n, 'symmetric');
m61 = sdpvar(2^n, 2^n, 'symmetric');

m02 = sdpvar(2^n, 2^n, 'symmetric');
m12 = sdpvar(2^n, 2^n, 'symmetric');
m22 = sdpvar(2^n, 2^n, 'symmetric');
m32 = sdpvar(2^n, 2^n, 'symmetric');
m42 = sdpvar(2^n, 2^n, 'symmetric');
m52 = sdpvar(2^n, 2^n, 'symmetric');
m62 = sdpvar(2^n, 2^n, 'symmetric');

g0 = sdpvar(2^n, 2^n, 'symmetric');
g1 = sdpvar(2^n, 2^n, 'symmetric');

eps = sdpvar(1);

constraints = [];

constraints = [constraints, m00 + m10 + m20 + m30 + m40 + m50 + m60 == ones(2^n,2^n)];
constraints = [constraints, m01 + m11 + m21 + m31 + m41 + m51 + m61 == E0 .* m00 + E1 .* m10 + E2 .* m20 + E3 .* m30 + E4 .* m40 + E5 .* m50 + E6 .* m60];
constraints = [constraints, m02 + m12 + m22 + m32 + m42 + m52 + m62 == E0 .* m01 + E1 .* m11 + E2 .* m21 + E3 .* m31 + E4 .* m41 + E5 .* m51 + E6 .* m61];
constraints = [constraints, g0 + g1 == E0 .* m02 + E1 .* m12 + E2 .* m22 + E3 .* m32 + E4 .* m42 + E5 .* m52 + E6 .* m62];

constraints = [constraints, m00 >= 0, m10 >= 0, m20 >= 0, m30 >= 0, m40 >= 0, m50 >= 0, m60 >= 0];
constraints = [constraints, m01 >= 0, m11 >= 0, m21 >= 0, m31 >= 0, m41 >= 0, m51 >= 0, m61 >= 0];
constraints = [constraints, m02 >= 0, m12 >= 0, m22 >= 0, m32 >= 0, m42 >= 0, m52 >= 0, m62 >= 0];
constraints = [constraints, g0 >= 0, g1 >= 0];

constraints = [constraints, diag(g0) >= (1-eps)*(1-f')];
constraints = [constraints, diag(g1) >= (1-eps)*f'];

%%
settings = sdpsettings('showprogress',1,'savesolverinput',1,'savesolveroutput',1,'dualize',0,'solver','mosek');
optout_gexqn = optimize(constraints, eps, settings);