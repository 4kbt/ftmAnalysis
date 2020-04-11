preLoad

columnR = 5;

Ngown   = contains('gown', colr(:,columnR));
Nn95    = contains('95'  , colr(:,columnR));
Nmask   = contains('mask', colr(:,columnR));
Nglove  = contains('glove', colr(:,columnR));
Nsanit  = contains('sanitizer', colr(:,columnR));
Nwipe   = contains('wipe', colr(:,columnR));
Nhelp   = contains('help', colr(:,columnR));
Ndesp   = contains('desperate', colr(:,columnR));
Nout    = contains('are out', colr(:,columnR));
Nshield = contains('shield', colr(:,columnR));


gown   = Ngown(timedex);
n95    = Nn95(timedex) ;
mask   = Nmask(timedex);
glove  = Nglove(timedex);
sanit  = Nsanit(timedex);
wipe   = Nwipe(timedex);
help   = Nhelp(timedex);
desp   = Ndesp(timedex);
out    = Nout(timedex);
shield = Nshield(timedex);

%compute time-series
ts = timeSeries( [time n95 mask glove gown sanit wipe help desp out shield] ); 

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

save 'ftmColROutput.dat' output
