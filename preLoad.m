load('columnR.dat');

colSmall = colr(3:end,:); %strip headers

%Parse 'approved' column
%approved = logical(cellfun(@isequal , colSmall(:,1) , {'x'}));

approved = zeros(rows(colSmall),1);
for ctr = 1:rows(colSmall)
	if(~cellfun(@isequal, colSmall(ctr,1), {[]}))
		apChar = colSmall(ctr,1){1,1}(end);

		if(isequal(apChar, 'x'))
			approved(ctr) = 1;
		end
	end
end

approved = logical(approved);

if(loadApproved == 1 )
	colSmall = colSmall(approved,:);
end

%Make time numbers again.
Ntime= cell2mat (colSmall(:,2));

%Make time in April units

Ntime = Ntime - 737887+6;

%handle out-of-order timestamps (has its own systematics, but alternative is worse)
[S timedex] = sort(Ntime);
time = Ntime(timedex);
