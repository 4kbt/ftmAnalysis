pkg load io

%Straight out of xlsread help docs.
%ODS import is glacial.
[numarr txtarr rawarr] = xlsread('data.ods');


%Preformat column r cellarray
colr = [rawarr(:,1) rawarr(:,4) rawarr(:,18)];

%Export.
save 'columnR.dat' colr
