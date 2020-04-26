load 'residentialAll.dat'

colr = [rawarr(:,1) rawarr(:,6) rawarr(:,47)];

loadApproved = 1
colSmall = colr(3:end,:); %strip headers  

%I'm a bad man. copypasta at work.
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


needsColumn = 3;

Nresidential  = contains('residential', colSmall(:,needsColumn));
residential   = Nresidential(timedex)

ts = timeSeries( [time residential] );

%pick off useful columns                                                        
days = ts(:,1); %time                                                           
N = ts(:,2);    %number of entries for each day                                 
                                                                                
%fraction that hits each search term                                            
p = ts(:,3:end)./N;                                                             
                                                                                
%confidence interval for a population-proportion                                
% https://www.dummies.com/education/math/statistics/how-to-determine-the-confidence-interval-for-a-population-proportion/
%                                                                               
% Link sounds sketchy, result looks legit and common.                           
%                                                                               
                                                                                
%synthesizing for plot-output                                                   
output = [days N p];                                                            
                                                                                
save 'residentialOutput.dat' output    
