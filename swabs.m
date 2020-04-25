%I'm a bad man, but this begins to DRY out multiple analysis chains.
loadApproved = 1
preLoad

%current location of column R
needsColumn = 3;

Nswabs   = contains('swab', colSmall(:,needsColumn));


swabs   = Nswabs(timedex);

%compute time-series
ts = timeSeries( [time swabs]);

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

save 'swabs.dat' output
