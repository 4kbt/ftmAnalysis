load('columnR.dat');
for ctr = 3:rows(colr); a(ctr) = cell2mat(colr(ctr,2)); end

a = a(3:end); a= a';

s = sort(a);

s = s - 737887+6;

t = -20:1/12:30;

NN = hist(s,t);


output = [mod(t',1), NN'];

save 'hourly.dat' output
