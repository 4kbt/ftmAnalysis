%I'm a bad man, but this begins to DRY out multiple analysis chains.
loadApproved = 1
preLoad

%current location of column R
needsColumn = 5;

Ngown   = contains('gown', colSmall(:,needsColumn));
Nn95    = contains('95'  , colSmall(:,needsColumn));
Nmask   = contains('mask', colSmall(:,needsColumn));
Nglove  = contains('glove', colSmall(:,needsColumn));
Nsanit  = contains('sanitizer', colSmall(:,needsColumn));
Nwipe   = contains('wipe', colSmall(:,needsColumn));
Ntherm  = contains('thermometer', colSmall(:,needsColumn));
Nshield = contains('shield', colSmall(:,needsColumn));
Ngoggle = contains('goggle', colSmall(:,needsColumn));
Nout    = contains(' out ', colSmall(:,needsColumn));

gown   = Ngown(timedex);
n95    = Nn95(timedex) ;
mask   = Nmask(timedex);
glove  = Nglove(timedex);
sanit  = Nsanit(timedex);
wipe   = Nwipe(timedex);
therm  = Ntherm(timedex);
shield = Nshield(timedex);
goggle   = Ngoggle(timedex);
out = Nout(timedex);

%compute time-series
ts = timeSeries( [time n95 mask glove gown sanit wipe therm shield goggle] ); 

%pick off useful columns
days = ts(:,1); %time
N = ts(:,2);    %number of entries for each day

%fraction that hits each search term
p = ts(:,3:end)./N;

%confidence interval for a population-proportion
% https://www.dummies.com/education/math/statistics/how-to-determine-the-confidence-interval-for-a-population-proportion/
% 
% Link sounds sketchy, result looks legit and common.
%

%synthesizing for plot-output
output = [days N p];

save 'shortages.dat' output
