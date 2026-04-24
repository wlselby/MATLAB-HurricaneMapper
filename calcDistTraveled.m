function totalDist=calcDistTraveled(allHurricaneData)
% calcDistTraveled calculates the distance traveled by a certain hurricane
% INPUTS:
%   lat - a vector of latitude coordinates for the hurricane
%   lon - a vector of longitude coordinates for the hurricane
% OUTPUT:
%   totalDist - the total distance traveled by the hurricane

%initialize the variable for distTwo as 0  
distTwo=0;


% initialize totalDist as []

totalDist = [];

%start a for loop to go through the coordinates in the vectors one at a
%time

[~, c] = size({allHurricaneData.name});

for j = 1:c

    lat = allHurricaneData(j).lat;
    lon = allHurricaneData(j).lon;




    for i=1:(numel(lat)-1) %use allHurricaneData to find the lat and lon for the specific hurricane
        
        
        x1=lon(i); %find the initial values for coords at x and y
        y1=lat(i);
        x2=lon(i+1); %add one to the index to find the next points coords
        y2=lat(i+1);
    
        %use these points in the euclidean distance equation to give the
        %distance traveled by the hurricane.
        distOne=sqrt((x2-x1)^2+(y2-y1)^2);
    
        %now add this new distance to the total distance traveled
        distTwo = distTwo + distOne;


    end



    totalDist = [totalDist; distTwo];
   
    %initialize the variable for distTwo as 0  
    distTwo=0;

    
end

%account for the degree change
totalDist = totalDist*69;

end