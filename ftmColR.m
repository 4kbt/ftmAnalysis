pkg load io

%Straight out of xlsread help docs.
%ODS import is glacial.
[numarr txtarr rawarr] = xlsread('data.ods');


%Preformat column r cellarray
colr = [rawarr(:,1) rawarr(:,6) rawarr(:,13), rawarr(:,17), rawarr(:,20)];

%Export.
save 'columnR.dat' colr
