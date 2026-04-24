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

% get the data for list options.
allHurricaneData = getAllHurricaneData(dirName);


% chosen animate a hurricane
if animationInput == 1

    % make the list of choices for user selection
    [index, choice] = listdlg("ListString", {allHurricaneData.name}, "SelectionMode","single");

    % user picked cancel
    if choice == 0

        % display error message
        disp("Error, Selection Canceled")

    else

        % use this function once per user action to create a figure for animation
        createFigureWithBackground();

        % slow down to update the graph
        drawnow; pause(.1);

        % animate the selected hurricane
        animatePlotHurricane(allHurricaneData(index))


    end

% animate all hurricanes
elseif animationInput == 2

    % visualizing all hurricanes
    fprintf('Visualizing all hurricanes . . .\n')

    % use this function once per user action to create a figure for animation
    createFigureWithBackground();

    % slow down to update the graph
    drawnow; pause(.1);
    
    % loop through all the data
    for i = 1:numel(allHurricaneData)

        % animate the selected hurricane
        animatePlotHurricane(allHurricaneData(i))


    end

% animate major hurricanes
elseif animationInput == 3

    % visualizing major hurricanes
    fprintf('Visualizing major hurricanes . . .\n')

    % get major hurricanes for proper data
    majorHurricanes = getMajorHurricanes(allHurricaneData);

    % use this function once per user action to create a figure for animation
    createFigureWithBackground();

    % slow down to update the graph
    drawnow; pause(.1);
    
    % loop through all the data
    for i = 1:numel(majorHurricanes)

        % animate the selected hurricane
        animatePlotHurricane(majorHurricanes(i))

    end
% Generate Report
elseif animationInput == 4
   
% use generate report to generate the report, pretty self-explanetary
    generateReport(allHurricaneData, yearInput)

    

end







