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