%3a
A1 = [0.559,0.6,0.1;0.7,0,0;0,0.3,0];
A1power = [];
for j = 1: 10000
    A1power = A1.^j;
end
A2 = [0.21,0.64,0.12;0.69,0,0;0,0.36,0];
A2power = [];
for n = 1:10000
    A2power = A2.^n;
end
A3 = [1,0.4,0.2;0.3,0,0;0,0.2,0];
A3power = [];
for m = 1:10000
    A3power = A3.^m;
end

%3b

%some nxn matrix A
A = [0.5,0.44,0.06;1,0,0;0,1,0];%used for 3d
x = [14;20;11]; %used for 3d
k = 0;
tol = 10e-5;
%xo = ones(size(A,2),1);
eig = 3;
eig_prev = 0;
%x = xo;
while abs(eig - eig_prev) > tol
    eig_prev = eig;
    v = A*x;
    eig = (v'*x)/norm(x,2);
    x = v/norm(v,2);
    k = k+1;
end

