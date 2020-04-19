%I'm a bad man, but this begins to DRY out multiple analysis chains.
loadApproved = 1
preLoad

%current location of column R
needsColumn = 3;

Ngown   = contains('gown', colSmall(:,needsColumn));
Nn95    = contains('N95s'  , colSmall(:,needsColumn));
Nmask   = contains('Surgical masks', colSmall(:,needsColumn));
Nglove  = contains('gloves', colSmall(:,needsColumn));
Nsanit  = contains('hand sanitizer', colSmall(:,needsColumn));
Nwipe   = contains('disinfecting wipes', colSmall(:,needsColumn));
Ntherm  = contains('thermometers', colSmall(:,needsColumn));
Nboot   = contains('Disposable booties', colSmall(:,needsColumn));
Nhome   = contains('Homemade Masks', colSmall(:,needsColumn));
Nshield = contains('face shields', colSmall(:,needsColumn));
Nprint  = contains('printed or makerspace', colSmall(:,needsColumn));



gown   = Ngown(timedex);
n95    = Nn95(timedex) ;
mask   = Nmask(timedex);
glove  = Nglove(timedex);
sanit  = Nsanit(timedex);
wipe   = Nwipe(timedex);
therm  = Ntherm(timedex);
boot   = Nboot(timedex);
home   = Nhome(timedex);
shield = Nshield(timedex);
print  = Nprint(timedex);

%compute time-series
ts = timeSeries( [time n95 mask glove gown sanit wipe therm boot home shield print] ); 

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
errorbar(days, p(:,10), sqrt(p(:,10) .* (1-p(:,10)) ./ N ),'o')

%synthesizing for plot-output
output = [days N p];

save 'needs.dat' output
