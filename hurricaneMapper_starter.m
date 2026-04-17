%  Name(s): William Selby & Ben Roylance
%  Email(s): wlselby@ncsu.edu   bmroylan@ncsu.edu
%  Date: 4-8-26
%  Lab Section 209
%  Project 3: Hurricane Mapper, Spring 2026

clc ; clear ; close('all');

% get initial user input and initial statements
fprintf('------------------------------\n')
fprintf('%29s\n', 'Animate Specific Hurricane[1]')
fprintf('%29s\n','Animate All Hurricanes[2]')
fprintf('%29s\n','Animate Major Hurricanes[3]')
fprintf('%29s\n','Create Hurricane Report[4]')

animationInput = input('            Select Action: ');

% check if animationInput isn't a selectable option to display the error
if ~ismember(animationInput, [1,2,3,4])

    disp('Exiting Program. Incorrect action selected.')
    return

end

% print next transitional statement
fprintf('------------------------------\n')

% get input for the next year
yearInput = input('                What Year: ');

% check if yearInput isn't a selectable option to display the error
if yearInput ~= 2017 && yearInput ~= 2025

    disp('No data available for that year')
    return

elseif yearInput == 2017

    % assign directory for 2017 data
    dirName = 'data_2017';

elseif yearInput == 2025

    % assign directory for 2025 data
    dirName = 'data_2025';

end

% print analyzing message before opening the input GUI
fprintf('Analyzing hurricanes for %d . . .\n', yearInput)

allHurricaneData = getAllHurricaneData(dirName);

% use this function once per user action to create a figure for animation
createFigureWithBackground();

majorHurricanes = getMajorHurricanes(allHurricaneData);