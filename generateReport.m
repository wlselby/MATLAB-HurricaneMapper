function generateReport(allHurricaneData, year)
% A function to take the data from the all hurricane data and convert it
% into a neatly detailed .txt file.
%
% INPUTS: allHurricaneData - A Structure Array containing the data for all
%                            hurricanes for a specific year with
%                            the following six fields:
%                            name - char array with the name
%                            date - cell array with the recorded dates
%                            lats - vector of doubles with latitude coordinates
%                            lons - vector of doubles with longitude coordinates
%                            wind - vector of doubles for the wind speeds
%                            pressure - vector of doubles for the pressures
% OUTPUT: hurricaneReport.txt - a text document that displays relevent data
%                            for each hurricane in a season, including name,
%                            dates/duration, max wind, max pressure, category,
%                            distance traveled, and the closest hurricane and
%                            distance to Wilmington, NC

% get matrix for the total distance traveled for each hurricane
totalDist = calcDistTraveled(allHurricaneData);

% get the closest storm and the closest distance it came
[closestStormName, minDist] = findClosestToWilmington(allHurricaneData);

% open the new file
fid = fopen('hurricaneReport.txt', 'w');

% print som pretty introduction lines
fprintf(fid, '*****************************************************************************************\n');
fprintf(fid, 'Hurricanes Report for %d\n', year);
fprintf(fid, '*****************************************************************************************\n');
fprintf(fid, '      Names,       Dates      , Max Wind, Max Pressure, Category, Distance:\n');
fprintf(fid, '*****************************************************************************************\n');

% loop through all the hurricane data for the season and pick out all the
% parts we need to format and print in a report
for i = 1:numel(allHurricaneData)

    fprintf(fid, '%12s, %6s to %6s, %8d, %12d, %7d, %10.2f\n', convertCharsToStrings(allHurricaneData(i).name), allHurricaneData(i).date{1}, allHurricaneData(1).date{end}, max(allHurricaneData(i).wind), max(allHurricaneData(i).pressure), calcCategory(allHurricaneData(i).wind), totalDist(i));


end

% print the stats for the closest storm
fprintf(fid, '*****************************************************************************************\n');
fprintf(fid, 'Closest to Wilmington was %s.\n', closestStormName);
fprintf(fid, 'It passed within approximately %.2f miles,\n', minDist);
fprintf(fid, '*****************************************************************************************\n');

% close the new file when done
fclose(fid);