function totalDist=calcDistTraveled(allHurricaneData)
% calcDistTraveled calculates the distance traveled by a certain hurricane
% INPUTS:
%   lat - a vector of latitude coordinates for the hurricane
%   lon - a vector of longitude coordinates for the hurricane
% OUTPUT:
%   totalDist - the total distance traveled by the hurricane

%initialize the variable for totalDist as 0
totalDist=0;

%start a for loop to go through the coordinates in the vectors one at a
%time
    for i=1:(length(lat)-1) %use allHurricaneData to find the lat and lon for the specific hurricane
        x1=allHurricaneData(i).lon; %find the initial values for coords at x and y
        y1=allHurricaneData(i).lat;
        x2=allHurricaneData(i+1).lon; %add one to the index to find the next points coords
        y2=allHurricaneData(i+1).lat;
    
        %use these points in the euclidean distance equation to give the
        %distance traveled by the hurricane.
        newDist=sqrt((x2-x1)^2+(y2-y1)^2);
    
        %now add this new distance to the total distance traveled
        totalDist = totalDist + newDist;
    end

end