%I'm a bad man, but this begins to DRY out multiple analysis chains.
loadApproved=1;
preLoad

%current location of column R
orgColumn = 4;

Nhospital = contains('hospital', colSmall(:,orgColumn));
%Nn95    = contains('N95s'  , colr(:,orgColumn));
%Nmask   = contains('Surgical masks', colr(:,orgColumn));
%Nglove  = contains('gloves', colr(:,orgColumn));
%Nsanit  = contains('hand sanitizer', colr(:,orgColumn));
%Nwipe   = contains('disinfecting wipes', colr(:,orgColumn));
%Ntherm  = contains('thermometers', colr(:,orgColumn));
%Nboot   = contains('Disposable booties', colr(:,orgColumn));
%Nhome   = contains('Homemade Masks', colr(:,orgColumn));
%Nshield = contains('face shields', colr(:,orgColumn));
%Nprint  = contains('printed or makerspace', colr(:,orgColumn));



hospital = Nhospital(timedex);
%n95    = Nn95(timedex) ;
%mask   = Nmask(timedex);
%glove  = Nglove(timedex);
%sanit  = Nsanit(timedex);
%wipe   = Nwipe(timedex);
%therm  = Ntherm(timedex);
%boot   = Nboot(timedex);
%home   = Nhome(timedex);
%shield = Nshield(timedex);
%print  = Nprint(timedex);

%compute time-series
ts = timeSeries( [time hospital] ); 

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
%errorbar(days, p(:,10), sqrt(p(:,10) .* (1-p(:,10)) ./ N ),'o')

%synthesizing for plot-output
output = [days N p];

save 'orgType.dat' output
