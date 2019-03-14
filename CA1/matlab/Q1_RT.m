P = importdata('pts.txt');
P_prime = importdata('pts_prime.txt');
pad = zeros([200, 3]);
A = [P;pad;pad];
A = [A [pad;P;pad]];
A = [A [pad;pad;P]];
last_cols = [ones([200,1]) zeros([200,1]) zeros([200,1]); [zeros([200,1]) ones([200,1]) zeros([200,1])]; [zeros([200,1]) zeros([200,1]) ones([200,1])]];
A = [A last_cols];
b = [P_prime(:,1); P_prime(:,2); P_prime(:,3)];
[U,S,V]=svd(A);
s=diag(S);
disp('singular values:'), disp(s')
bt=U'*b;
y=bt(1:12)./s;
x=V*y;
disp('x using SVD, all singular values:'), disp(x')
disp('||Ax-b||:'), disp(norm(A*x-b))
R = reshape(x(1:9), [3,3])';