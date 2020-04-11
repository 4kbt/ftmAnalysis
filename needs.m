%I'm a bad man, but this begins to DRY out multiple analysis chains.
preLoad

%current location of column R
needsColumn = 3;

Ngown   = contains('gown', colr(:,needsColumn));
Nn95    = contains('N95s'  , colr(:,needsColumn));
Nmask   = contains('Surgical masks', colr(:,needsColumn));
Nglove  = contains('gloves', colr(:,needsColumn));
Nsanit  = contains('hand sanitizer', colr(:,needsColumn));
Nwipe   = contains('disinfecting wipes', colr(:,needsColumn));
Ntherm  = contains('thermometers', colr(:,needsColumn));
Nboot   = contains('Disposable booties', colr(:,needsColumn));
Nhome   = contains('Homemade Masks', colr(:,needsColumn));
Nshield = contains('face shields', colr(:,needsColumn));
Nprint  = contains('printed or makerspace', colr(:,needsColumn));



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
