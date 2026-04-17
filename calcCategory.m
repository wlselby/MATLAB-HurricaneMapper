function [category, color] = calcCategory(wind)
% based on wind strength determines hurricane category and color
% INPUT: wind - a number for the wind speed (mph) of
% particular hurricane data point
% RETURNS: category - an integer between 0-5 for hurricane category
% based on wind speed
% color - triple value RGB color
%
% category 0: <=38, color [0 1 1], turquoise
% category 0: 39-73, color [0.25 1 0], green
% category 1: 74-95, color [1 1 0], yellow
% category 2: 96-110, color [1 0.75 0], orange
% category 3: 111-129, color [1 0 0], red
% category 4: 130-156, color [0.75 0 1], violet
% category 5: >= 157, color [1 0 1], pink

%create an if ladder to figure out what category based on comparison of
%input wind speed to different category level winds
%also, asign a color to the category with its numeric code, depending on
%category.

if wind <= 38
    category = 0;
    color = [0 1 1];

elseif wind <= 73
    category = 0;
    color = [0.25 1 0];

elseif wind <= 95
    category = 1;
    color = [1 1 0];

elseif wind <= 110
    category = 2;
    color = [1 0.75 0];

elseif wind <= 129
    category = 3;
    color = [1 0 0];

elseif wind <= 156
    category = 4;
    color = [0.75 0 1];

else
    category = 5;
    color = [1 0 1];

end

end
