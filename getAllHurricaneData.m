function allHurricaneData = getAllHurricaneData(dirName)
% This function reads a main file containing hurricane names and then
% extracts the corresponding data from individual CSV files for each one.
% INPUT:  dirName - char array (the name of the folder containing the
%                   data files, e.g., 'data_2017' or 'data_2025').
% RETURN: allHurricaneData - A Structure Array containing the data for all
%                            hurricanes for a specific year with
%                            the following six fields:
%                            name - char array with the name
%                            date - cell array with the recorded dates
%                            lats - vector of doubles with latitude coordinates
%                            lons - vector of doubles with longitude coordinates
%                            wind - vector of doubles for the wind speeds
%                            pressure - vector of doubles for the pressures
% HINT:  it is ok to hardcode here the name of the main file
%        allHurricanes.txt, since it is the same for both years

theHurricanes = readcell([dirName '/allHurricanes.txt']);
num_hurricanes = numel(theHurricanes);

for i = 1:num_hurricanes

    dirData = readcell([dirName, '/', theHurricanes{i}, '.csv']);

    % store each column as a column cell array (or convert to table)

    allHurricaneData(i).name     = dirData{2,2};
    allHurricaneData(i).date     = dirData(2:end,3);
    allHurricaneData(i).lat      = cell2mat(dirData(2:end,5));
    allHurricaneData(i).lon      = cell2mat(dirData(2:end,6));
    allHurricaneData(i).wind     = cell2mat(dirData(2:end,7));
    allHurricaneData(i).pressure = cell2mat(dirData(2:end,8));


end


end