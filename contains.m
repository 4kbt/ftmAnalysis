%function that makes case-insensitive hunt for substrings in a cell-column.
function results = contains( searchString , cellArr);

	%Pre-allocate for speed, reliability.
	results = zeros(rows(cellArr), 1);

	for ctr = 1:rows(cellArr)

		%no match by default
		f = {[]};

		%Does entry contain a match?
		if ( size(cellArr(ctr){1,1}) ~= [0 0] )
			f = strfind( tolower(cellArr(ctr)), tolower(searchString));
		end

		%store result
		results(ctr) =  !cellfun(@isequal, f, {[]});
	end

endfunction

