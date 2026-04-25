function hurricanePlot = plotHurricaneData(hurricaneData, hurricaneYear, varargin)
% A funciton that takes the data from a given season's hurricane and
% produces a plot for the hurricane's wind or pressure, or both based on 
% user input
%
% HAD TO DO SOLO RESEARCH ON DATETIME AFTER MENTIONED IN A PREVIOUS CLASS
% SESSION, SOURCE USED: 
% https://www.mathworks.com/help/matlab/matlab_prog/plot-dates-and-times.html
%
% INPUT:  allHurricaneData - Structure Array for all hurricanes with six fields:
%         name, date, lat, lon, wind, pressure
%           
%         hurricaneYear - a double value to use when compiling the data for
%         the x axis, not included with allHurricaneData         
%
%         varargin - Cell Array containing either {'w'}, {'p'}, or {} to plot
%         the wind, pressure, or both for a hurricane.
%
% OUTPUT: hurricanePlot - a plot of either wind, presure, or both versus
%         the time of the hurricane

%organize the daa from the given hurricane index, convert the dates to a
%datetime format to graph later
dates = datetime(hurricaneData.date, 'InputFormat', 'dd-MMM');
dates.Year = hurricaneYear;

% organize the numeric data
wind = [hurricaneData.wind];
pressure = [hurricaneData.pressure];

% if statements to check through the input data for number of given
% arguments to determine the type of graph we make
hold on;


if nargin == 1 || isempty(varargin)
    % Plot BOTH using two y-axes
    yyaxis left
    hurricanePlot(1) = scatter(dates, wind, 'o', 'filled');
    ylabel('Wind Speed (mph)');
    
    yyaxis right
    hurricanePlot(2) = scatter(dates, pressure, 's', 'filled');
    ylabel('Pressure (mb)');
    
elseif strcmpi(varargin{1}, 'w')
    % Plot ONLY Wind
    hurricanePlot = scatter(dates, wind, 'o', 'filled');
    ylabel('Wind Speed (mph)');
    
elseif strcmpi(varargin{1}, 'p')
    % Plot ONLY Pressure
    hurricanePlot = scatter(dates, pressure, 's', 'filled');
    ylabel('Pressure (mb)');
end

% format the x axis to fit the dates data, adjusted to include the working
% year the data was taken from
xtickformat('dd-MMM-yyyy');
xlabel('Date');
grid on;
title(['Data for Hurricane ', hurricaneData(1).name]);
hold off;

end