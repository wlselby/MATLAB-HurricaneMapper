function [minDist, closestStormName] = findClosestToWilmington(allHurricaneData)
% findClosestToWilmington: finds the minimum distance between a hurricane
% and wilmington.
% INPUTS:
%   lat - a vector of latitude coordinates for the hurricane
%   lon - a vector of longitude coordinates for the hurricane
% OUTPUT:
%   minDist - the lowest distance the hurricane ever was from wilmington

%input coordinates for wilmington as given in the instructions
wilmLat= 34.22;
wilmLon= -77.94;

%initialize minDist with a large number to start, so that any point on the
%graph will be closer to wilmington than the initial value, and it will
%update.

minDist= 999999999999999999999999999999999999999;

%create a loop to go through all of the points in the hurricane
    for i = 1:length(lat)
        %use the euclidean distance formula, but with the coordinates for
        %wilmington as the initial points, and whatever coords are at i as the
        %final points.
        %use the data from allHurricaneData to index into the  lat and lon
        %for the specific hurricane
        x2=allHurricaneData(i).lon;
        y2=allHurricaneData(i).lat;
        x1=wilmLon;
        y1=wilmLat;
        %plug values into formula
        distance=sqrt((x2-x1)^2+(y2-y1)^2);
    
        %check if the just found distance is smaller than the current min
        %distance
        if distance < minDist
            minDist=distance; %if it is less, make that value the new minDist
            closestStormName=allHurricaneData(i).name;
        end

        
    end
end
