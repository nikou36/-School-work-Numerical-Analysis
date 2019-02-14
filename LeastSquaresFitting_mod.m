% Least squares fits
clear all;
% time data vector
xi = 1:24;
% temperature data vector 
yi = [75 77 76 73 69 68 63 59 57 55 54 52 50 50 49 49 49 50 54 56 59 63 67 72];

xi2 = xi.^2; % x plugged into x^2
xi3 = xi.^3; % x plugged into x^3

% function matrix
F = [xi3; xi2;xi;ones(size(xi))];
A = F*F';
b = F*yi';

ans = A\b