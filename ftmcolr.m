load('columnR.dat');

colSmall = colr(3:end,:); %strip headers

%Parse 'approved' column
approved = logical(cellfun(@isequal , colSmall(:,1) , {'x'}));

%Make time numbers again.
time= cell2mat (colSmall(:,2));


%current location of column R
columnR = 3;

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


gown = contains('gown', colr(:,columnR));
n95  = contains('95'  , colr(:,columnR));
mask = contains('mask', colr(:,columnR));



