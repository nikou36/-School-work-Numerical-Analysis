clear all close all
% set up spatial discritization
L = 5;% size of region
nx = 1000; % number of spatial discritizations
x = linspace(0,L,nx); % define spatial grid
dx = L/nx; % grid size

% set up time discritization
tfinal = 3; % final time
nt = 2*nx; % number of time steps
time = linspace(0,tfinal,nt); % time grid
dt = tfinal/nt;% size of time step
% points where you want to save
tsave = 0:0.5:3;

% points wehre you want to display solution on the plot
gg = 1;
tplot = [];
for j = 1:10:size(time,2)
    tplot(1,gg) = time(1,j);
    gg = gg + 1;
end    
% set up initial conditions
u = [exp((-1*(x-1).^2)/0.01)]';% u(t = 0, x)
up = [exp((-1*(x-1).^2)/0.01)]';% u(t= -dt, x)

% plot initial condtion
figure(1)
plot(x,u);
xlabel('space, x')
ylabel('traveling wave, u')

% define finite difference formula
lambda = dt/dx;
%vec1 =
B = ones(nx,1);
C = ones(nx,1);
BC = [B,-C];
A = spdiags(BC,[1,0],nx,nx);
A(1,end) = 1;
A(end,1) = 1;

% may need multiple lines to define matrix A
ii = 1;
m = 1;
for n = 1:size(time,2) % all your time points
    % time stepping equation
    t = time(1,n);
    un = up + lambda*A*u;% u(t+dt, x)

    % update variables
    if x(m) == L % boundary conditions
         up = [exp((-1*((L)-1).^2)/0.01)]';
         u =[exp((-1*((L)-1).^2)/0.01)]';
         m = 0;     
    else    
        up = [exp((-1*((x+dx*m)-1).^2)/0.01)]';
        u =[exp((-1*((x-dx*m)-1).^2)/0.01)]';
    end
    % plot for a subset of times
    if find(any(abs(t-tplot)<dt), 1)
        figure(1)
        plot(x,u)
        xlabel('space, x')
        ylabel('traveling wave, u')
        drawnow
    end

    % save for some subset of times
    if find(any(abs(t-tsave)<dt), 1)
        usave(:,ii) = u;
        ii =ii+1;
    end
    m = m + 1;
end

% plot at final time (incase not included in plot vector)
figure(1)
plot(x,u)
xlabel('space, x')
ylabel('traveling wave, u')

% calculate actual solution
ureal =exp(-1*(x-4).^2/0.01);
hold on
plot(x,ureal);
error = abs(u-ureal);
totalerror = trapz(x,error);

