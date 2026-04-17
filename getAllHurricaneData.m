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
num_hurricanes = length(theHurricanes);

for i = 1:num_hurricanes

    hurricaneDir = [theHurricanes{i} '.csv'];

    allHurricaneData(i).name = theHurricanes{i};
    

end



end