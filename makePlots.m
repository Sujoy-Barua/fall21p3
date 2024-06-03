function [  ] = makePlots( filenameWind, filenameWave, filenameBuoy, windSpeedMin, windSpeedMax, waveHeightMax )

%% Sujoy Barua (sujoysb)
% Partner: none
% Section: 020
% Date: 10/03/2021

%% Function to complete Task 2. Creates a figure with multiple plots that 
% summarizes the environmental conditions for a wind farm.  Saves figure as 
% a .png file.
%
%   parameters: 
%          filenameWind: a string that names the file containing the 
%                        global-model-based average wind speed 
%                        (i.e. 'windSpeedTestCase.csv')
%          filenameWave: a string that names the file containing the 
%                        global-model-based average global wave heights 
%                        (i.e. 'waveHeightTestCase.csv')
%          filenameBuoy: a string that names the file containing the time 
%                        series of wave heights measured by the buoy          
%                        (i.e. 'buoyTestCase.csv')
%          windSpeedMin: for constraint 1 -- minimum wind speed (m/s)
%          windSpeedMax: for constraint 1 -- maximum wind speed (m/s)
%         waveHeightMax: for constraint 2 -- maximum wave height (m)
%
%   return values: none
%
%   notes:
%       Feel free to use different variable names than these if it makes 
%       your code more readable to you.  These are internal to your 
%       function, so it doesn't matter what you call them.

%% Getting lat/lon data
lat = csvread('lat.csv');
lon = csvread('lon.csv');

% Reading in the rest of the data you need...
avgWindSpd = csvread(filenameWind);
avgWaveHgt = csvread(filenameWave);
buLoc = csvread(filenameBuoy,1,0,[1,0,1,3]);
buData = csvread(filenameBuoy, 5, 0);

%% Setting up the figure properties
Fig1 = figure(1);
Fig1.Units = 'normalized';
Fig1.OuterPosition = [0 0 0.5 1];

%% Making Plots

%1st plot
[LON,LAT] = meshgrid(lon,lat); %all possible combination of LON and LAT
subplot(3,2,1) %creating a 3 by 2 subplot and selecting the 1st subplot
contourf(LON,LAT,avgWindSpd, 'LineStyle','none');
colorbar %adds the color bar that shows the corresponding values
xlabel('longitude(deg)'); %labeling of x axis
ylabel('latitude(deg)'); %labeling of y axis
title('Average Wind Speed (m/s) Across Planet'); %titling the plot(subplot)

%2nd plot
subplot(3,2,2) %selecting the 2nd subplot
contourf(LON,LAT,avgWaveHgt, 'LineStyle','none');
colorbar
xlabel('longitude(deg)');
ylabel('latitude(deg)');
title('Average Wave Height (m) Across Planet')

%3rd plot
subplot(3,2,3)
c1 = (avgWindSpd >= windSpeedMin) &...
    (avgWindSpd <= windSpeedMax); %constraint 1
c2 = (avgWaveHgt < waveHeightMax); %constraint 2
c1Wc2 = c1 & c2; %combining constraint 1 and 2 to get output 0 where either
                 %one is false and 1 where both are true.
contourf(LON,LAT,c1Wc2, 'LineStyle','none');
colormap(subplot(3,2,3), flip(gray));
xlabel('longitude(deg)');
ylabel('latitude(deg)');
title('Potential Wind Farm Locations')
hold on; %holding the subplot editing to 'on' to add more to it
latB = lat(buLoc(2));
lonB = lon(buLoc(3));
offset = 7; %it sets how far the square is spread out from the middle
plot([lonB-offset lonB+offset lonB+offset lonB-offset lonB-offset],...
    [latB-offset latB-offset latB+offset latB+offset latB-offset], '-r', 'MarkerSize', 12);
hold off; %releasing the subplot hold

%4th plot
subplot(3,2,4)
histogram(buData(:,2), 'BinWidth',0.5);
xlabel('wave height (m)');
ylabel('number of occurences');
title('Wave Heights at Buoy Location')
grid on; %turns the x and y grids on

%5th plot
subplot(3,2,[5 6]) %selecting the 5th and 6th subplots together to
                   %accommodate a single plot
plot(buData(:,1), buData(:,2));
grid on;
hold on;
plot(buData(:,1), linspace(avgWaveHgt(buLoc(2),buLoc(3)),avgWaveHgt(buLoc(2),buLoc(3)), length(buData(:,1))), '-r');
legend('Buoy-measured','Global average');
xlabel('time (hours)');
ylabel('wave height (m)');
title('Wave Height Comparison: Global to Local (by Sujoy Barua)')
hold off;


%saving figure as a pdf
print('environmentalSummary.pdf', '-dpdf','-fillpage'); %filename, file format, fit to page

end

