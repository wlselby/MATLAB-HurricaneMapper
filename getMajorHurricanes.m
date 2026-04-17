function majorHurricanes = getMajorHurricanes(allHurricaneData)
% determines only high-intensity major storms
% INPUT:  allHurricaneData - Structure Array for all hurricanes with six fields:
%         name, date, lat, lon, wind, pressure
% RETURN: majorHurricanes
%         - A subset of the Structure Array containing
%           only storms that reached Category 3 or higher
%         - if no major hurricanes are found, return an empty struct()

majorHurricanes = allHurricaneData([]);  % keeps same fields, empty data

for i = 1:length(allHurricaneData)

    [category, ~] = calcCategory(allHurricaneData(i).wind);

    if category >= 3
        majorHurricanes = [majorHurricanes allHurricaneData(i)];
    end

end