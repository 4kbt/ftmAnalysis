%Incoming
% time in column 1, logicals in all other columns


function accum = timeSeries(d)

	days = floor(min(d(:,1))):floor(max(d(:,1)));

	accum = [];

	for t = days

		intraday = d( d(:,1) >= t & d(:,1)< (t+1) , 2:end);

		accum = [accum ; t rows(intraday) sum(intraday, 1) ];	

	end

endfunction
