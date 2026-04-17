function animatePlotHurricane(hurricaneData)
% plots and animates a specific hurricane
% INPUT: hurricaneData- Structure for a specific hurricane with six fields:
%        name, date, lat, lon, wind, pressure
% OUTPUT: a plot, where each data point of the hurricane is ploted
%         ONE by ONE (so it looks like it is animated),
%         as a dot in MarkerSize 15, and the color of the dot is
%         determined based on the strength of the wind for that data point.
% HINTS: -use the calcCategory() function to get the color of the dots
%        -pause for 0.01 seconds for the animation between points
%        -this function DOES NOT print, it plots
%        -this function does NOT set the background Earth image of the
%         plot, that is done before calling this function in the main
%         script hurricaneMapper.m using createFigureWithBackground.m


%figure out the length of the data array for use in the for loop
numPoints=length(hurricaneData.lat);

%initiate the for loop to iterate through from 1 to the end of the length
%of the array.
    for i=1:numPoints 
        currentLat=hurricaneData.lat(i); %gets latitude for current iteration
        currentLon=hurricaneData.lon(i); %gets longitude for current iteration
        currentWind=hurricaneData.wind(i); %gets wind speed for current iteration

        %use the calc category function to determine the color based off
        %the category of the hurricane (using the current wind speed)
        [~,dotColor]=calcCategory(currentWind);
        
        %plot the information for this iteration as a dot, with marker size
        %15 and the color based off of what we found earlier.
        plot(currentLon, currentLat, '.', 'MarkerSize',15,'Color', dotColor);

        %pause after the dot is plotted
        pause(0.01);

        %force the graph to update
        drawnow;


    end



end
