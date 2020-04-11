load('columnR.dat');

colSmall = colr(3:end,:); %strip headers

%Parse 'approved' column
approved = logical(cellfun(@isequal , colSmall(:,1) , {'x'}));

%Make time numbers again.
Ntime= cell2mat (colSmall(:,2));

%Make time in April units

Ntime = Ntime - 737887+6;

%handle out-of-order timestamps (has its own systematics, but alternative is worse)
[S timedex] = sort(Ntime);
time = Ntime(timedex);
