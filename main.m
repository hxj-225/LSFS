clc
clear
close all
load echo.mat
nt = 16;
nx = 64;
ny = 48;
no = 128;
L= zeros(nx*ny,nt);
S = zeros(nx*ny,nt);
V = zeros(nx*ny,nt);
D = zeros(nt-1, nt);
for i = 1:nt-1
    D(i, i) = -1;
    D(i, i+1) = 1;
end
P= L*D';

lambda1 =0.075;
lambda3 = 0.005;
lambda2 = 0.008;
mu = 1.0;
alpha = 0.5;

M = X;
L = X;

for  ite = 1:300



    L = svt1(L-alpha*(mu*M+L*(D')*D-P*D),mu*alpha*lambda1);
    S = shrink(S-alpha*mu*M,mu*alpha*lambda2);
    P = shrink(P-alpha*(P-L*(D')),mu*alpha*lambda3);
    V = L+S;
    for jj = 1:nt
            Etemp = E(:,:,jj);
            Mtemp =  Etemp'*(Etemp*(V(:,jj))-y(:,jj));
            M(:,jj) = Mtemp;
    end   
end


