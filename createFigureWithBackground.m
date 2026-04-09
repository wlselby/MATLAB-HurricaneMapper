function createFigureWithBackground()
% create figure, add background image of to axes
% the limits of the axes are approximate for this quadrant
% of the Earth in the Atlantic Ocean, image obtain from
% https://visibleearth.nasa.gov
% DO NOT MODIFY THIS FUNCTION, use it ONCE BEFORE plotting.

% Load image
imgFile = 'north-atlantic-basin.JPG';

I = imread(imgFile);
I = flipud(I);

% Choose approximate longitude/latitude range for this image
x_min = -115;   % westernmost longitude (deg)
x_max =  15;   % easternmost longitude (deg)
y_min =    0;   % southernmost latitude (deg)
y_max =   70;   % northernmost latitude (deg)


% Plot background image with lon/lat axes
figure;
image([x_min x_max], [y_min y_max], I);  % map image to lon/lat extent
set(gca, 'YDir', 'normal');              % latitude increases upward
xlabel('Longitude (deg)');
ylabel('Latitude (deg)');
hold on;  %plotting AFTER this function is called will show on the same figure

% Wilmington, NC Coordinates
wilmLat = 34.22;
wilmLon = -77.94;
plot(wilmLon, wilmLat, 'rp', 'MarkerSize',20, 'MarkerFaceColor', 'r')

% Optional: make aspect ratio nicer
axis([x_min x_max y_min y_max]);
%axis equal;

end

