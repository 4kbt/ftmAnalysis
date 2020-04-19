loadApproved = 0;
preLoad

tsAll = timeSeries([time]);

loadApproved = 1;
preLoad 
tsApproved = timeSeries([time]);

%semilogy(tsAll(:,1), tsAll(:,2), '1', tsApproved(:,1), tsApproved(:,2))

approvedOut = [tsAll tsApproved];

save 'approvedPlot.dat' approvedOut
