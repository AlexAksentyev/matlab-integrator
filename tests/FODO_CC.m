clc; clear; close;

disp("Running FODO Cross-check\n");

initBDT; setD;

%global MeV AMU AMUMEV DEGRAD c m q W0

v0 = W2vel(W0*MeV);
g0 = W2gamma(W0*MeV);

p0 = (m/AMU*AMUMEV*v0/c*g0); %in MeV

QDA2 = @()mquadr(5e-2, -.82);
QFA2 = @()mquadr(5e-2, .736);
OSF = @()emdrift(15e-2);
OSD = @()emdrift(15e-2);
BPM = @()emdrift(15e-2);
OD1 = @()emdrift(25e-2);
OD2 = @()emdrift(25e-2);
ORB = @()emdrift(220e-2);

lattice = [{QDA2}; {OD1}; {OSD}; {OD2}; {ORB}; {OD2}; {BPM}; {OD1}; {QFA2};
{QFA2}; {OD1}; {OSF}; {OD2}; {ORB}; {OD2}; {BPM}; {OD1}; {QDA2};
 {QDA2}; {OD1}; {OSD}; {OD2}; {ORB}; {OD2}; {BPM}; {OD1}; {QFA2}];

n=5;
X0 = [3e-3*ones(1,3) -3e-3:3e-3:3e-3; [-3e-3:3e-3:3e-3] 1e-3*ones(1,3); zeros(6,6); ones(1,6); zeros(2,6)];
X = cell(6);
for i=1:4
  disp(num2str(i));
  X{i} = turn(lattice, X0(:,i), n);
end

x=[X{1}(1,:); X{2}(1,:); X{3}(1,:); X{4}(1,:)];
y=[X{1}(2,:); X{2}(2,:); X{3}(2,:); X{4}(2,:)];
sx=[X{1}(7,:); X{2}(7,:); X{3}(7,:); X{4}(7,:)];
sy=[X{1}(8,:); X{2}(8,:); X{3}(8,:); X{4}(8,:)];
s=[X{1}(11,:); X{2}(11,:); X{3}(11,:); X{4}(11,:)];

rng = 3:3
for i=rng; subplot(2,1,1); plot(s(i,:),x(i,:),'-r',s(i,:),y(i,:),'-b'); hold all; end; legend("x","y");
for i=rng; subplot(2,1,2); plot(s(i,:),sx(i,:),'-r',s(i,:),sy(i,:),'-b'); hold all; end; legend("Sx","Sy");


