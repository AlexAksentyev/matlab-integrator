clc; clear;

initBDT; setD;

h = .05;
R = 9.207;
Lq = 5;
Lw = 1.808;

GSFP = 0;
GSDP = 0;

DL_25 = @()emdrift(.25);
DL_15 = @()emdrift(.15);
DL2_2 = @()emdrift(2.2);
BPM = @()emdrift(15);

QDS = @()mquadr(Lq, -8.6);
QFS = @()mquadr(Lq, 8.31);

QFA = @()mquadr(Lq,  13.64);
QDA = @()mquadr(Lq,-10.23);

SfA = @()msext(.15, GSFP);
SdA = @()msext(.15, GSDP);

WA = @()wien(1.808, j, R, h); % i don't understand the By formula in there

X0 = [1e-3 -1e-3 0 0 0 0 0 0 1 0];

FODO = [{QFS}; {DL_25}; {QDS}; {DL_25}];

lattice = [
        
        %%%% SS1H2 %%%%
              {QDS};{DL_25};{DL_15};{DL_25};{DL2_2};{DL_25};{BPM};{DL_25};
        {QFS};{QFS};{DL_25};{DL_15}; % {RF};
                                    {DL_25};{DL2_2};{DL_25};{BPM};{DL_25};
        {QDS};{QDS};{DL_25};{DL_15};{DL_25};{DL2_2};{DL_25};{BPM};{DL_25};
        {QFS};
        
        %%%% ARC1 %%%%
              {QFA};{DL_25};{SfA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QDA};{QDA};{DL_25};{SdA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QFA};{QFA};{DL_25};{SfA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        
        {QDA};{QDA};{DL_25};{SdA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QFA};{QFA};{DL_25};{SfA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        
        {QDA};{QDA};{DL_25};{SdA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QFA};{QFA};{DL_25};{SfA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        
        {QDA};{QDA};{DL_25};{SdA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QFA};{QFA};{DL_25};{SfA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        
        {QDA};{QDA};{DL_25};{SdA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QFA};{QFA};{DL_25};{SfA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        
        {QDA};{QDA};{DL_25};{SdA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QFA};{QFA};{DL_25};{SfA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        
        {QDA};{QDA};{DL_25};{SdA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QFA};{QFA};{DL_25};{SfA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        
        {QDA};{QDA};{DL_25};{SdA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QFA};
        
        %%%% SS2H1 %%%%
              {QFS};{DL_25};{SfA};{DL_25};{DL2_2};{DL_25};{BPM};{DL_25};
        {QDS};{QDS};{DL_25};{SdA};{DL_25};{DL2_2};{DL_25};{BPM};{DL_25};
        {QFS};{QFS};{DL_25};{SfA};{DL_25};{DL2_2};{DL_25};{BPM};{DL_25};
        
        %%%% SS2H2 %%%%
        {QDS};{DL_25};{DL_15};{DL_25};{DL2_2};{DL_25};{BPM};{DL_25};
        {QFS};{QFS};{DL_25};{DL_15};{DL_25};{DL2_2};{DL_25};{BPM};{DL_25};
        {QDS};{QDS};{DL_25};{DL_15};{DL_25};{DL2_2};{DL_25};{BPM};{DL_25};
        {QFS};
        
        %%%% ARC2 %%%%
              {QFA};{DL_25};{SfA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        
        {QDA};{QDA};{DL_25};{SdA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QFA};{QFA};{DL_25};{SfA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        
        {QDA};{QDA};{DL_25};{SdA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QFA};{QFA};{DL_25};{SfA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        
        {QDA};{QDA};{DL_25};{SdA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QFA};{QFA};{DL_25};{SfA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        
        {QDA};{QDA};{DL_25};{SdA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QFA};{QFA};{DL_25};{SfA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        
        {QDA};{QDA};{DL_25};{SdA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QFA};{QFA};{DL_25};{SfA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        
        {QDA};{QDA};{DL_25};{SdA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QFA};{QFA};{DL_25};{SfA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        
        {QDA};{QDA};{DL_25};{SdA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QFA};{QFA};{DL_25};{SfA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        
        {QDA};{QDA};{DL_25};{SdA};{DL_25};{WA};{DL_25};{BPM};{DL_25};
        {QFA};
        
        %%%% SS1H1
              {QFS};{DL_25};{SfA};{DL_25};{DL2_2};{DL_25};{BPM};{DL_25};
        {QDS};{QDS};{DL_25};{SdA};{DL_25};{DL2_2};{DL_25};{BPM};{DL_25};
        {QFS};{QFS};{DL_25};{SfA};{DL_25};{DL2_2};{DL_25};{BPM};{DL_25};
        {QDS};

];


SS1H2 = [{QDS};{DL_25};{DL_15};{DL_25};{DL2_2};{DL_25};{BPM};{DL_25};
        {QFS};{QFS};{DL_25};{DL_15}; % {RF};
                                    {DL_25};{DL2_2};{DL_25};{BPM};{DL_25};
        {QDS};{QDS};{DL_25};{DL_15};{DL_25};{DL2_2};{DL_25};{BPM};{DL_25};
        {QFS};];

X0 = [1e-3*ones(1,3) -2e-3:2e-3:2e-3; [-2e-3:2e-3:2e-3] 1e-3*ones(1,3); zeros(6,6); ones(1,6); zeros(2,6)];
n=1; i=1;

X = cell(6);
for i=1:4
  disp(num2str(i));
  X{i} = turn(SS1H2, X0(:,i), n);
end

x=[X{1}(1,:); X{2}(1,:); X{3}(1,:); X{4}(1,:)];
y=[X{1}(2,:); X{2}(2,:); X{3}(2,:); X{4}(2,:)];
sx=[X{1}(7,:); X{2}(7,:); X{3}(7,:); X{4}(7,:)];
sy=[X{1}(8,:); X{2}(8,:); X{3}(8,:); X{4}(8,:)];
s=[X{1}(11,:); X{2}(11,:); X{3}(11,:); X{4}(11,:)];

rng = 3:3
for i=rng; subplot(2,1,1); plot(s(i,:),x(i,:),'-r',s(i,:),y(i,:),'-b'); hold all; end; legend("x","y");
for i=rng; subplot(2,1,2); plot(s(i,:),sx(i,:),'-r',s(i,:),sy(i,:),'-b'); hold all; end; legend("Sx","Sy");
xlabel("s");


