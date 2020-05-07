pkg load io

if(~exist("rawarr"))
	%Straight out of xlsread help docs.
	%ODS import is glacial.
	[numarr txtarr rawarr] = xlsread('approvals.ods');

end

approvals = zeros(rows(rawarr), 1);
edits     = zeros(rows(rawarr), 1);
removals  = zeros(rows(rawarr), 1);
dupeups   = zeros(rows(rawarr), 1);


for ctr = 1:rows(rawarr)
	if(cellfun(@isequal, rawarr(ctr,2), {"x"}))
		approvals(ctr) = 1;
	end

	%DupeUps
	if(cellfun(@isequal, rawarr(ctr,4), {"D"}))
		dupeups(ctr) = 1;
	end
	if(cellfun(@isequal, rawarr(ctr,4), {"DU"}))
		dupeups(ctr) = 1;
	end


	if(cellfun(@isequal, rawarr(ctr,9), {"Edit an existing donation site"}))
		edits(ctr) = 1;
	end
	if(cellfun(@isequal, rawarr(ctr,9), {"Remove an existing donation site"}))
		removals(ctr) = 1;
	end
	
end

interval = 200;

accum = 0;
numApprovals = [];

for ctr = 1:rows(approvals)

	accum = accum + [ approvals(ctr) dupeups(ctr) edits(ctr) removals(ctr)];

	if(mod(ctr,interval) == 0 )
		numApprovals = [numApprovals; ctr, accum/interval];
		accum = 0;
	end

end

save 'approvals.dat' numApprovals
