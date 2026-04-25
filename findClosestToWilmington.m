function [closestStormName, minDist] = findClosestToWilmington(allHurricaneData)
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

minDist= inf;

%loop through the length of the data to find the lat and lon of each line
    for i =1:(length(allHurricaneData)) 
        
        lat=allHurricaneData(i).lat; %get the lat and lon from the hurricane data pack
        lon=allHurricaneData(i).lon;
    
        %if the minimum calculated distance is less than the current distance
        %in miles, it will replace the old distance with the new smaller one
        if min(69*(sqrt(((wilmLat-lat).^2)+(wilmLon-lon).^2))) < minDist
    
            %find distance with euclidean geometry formula. Should be 
            %the same as the equation used for the if statement
            minDist=min(69*(sqrt(((wilmLat-lat).^2)+(wilmLon-lon).^2)));
    
            %find the name to match the new lowest value using indexing
            closestStormName=allHurricaneData(i).name;
        end
        
    
    
    end

end
