function [  ] = makePlots( filenameWind, filenameWave, filenameBuoy, windSpeedMin, windSpeedMax, waveHeightMax )

% Function to complete Task 2. Creates a figure with multiple plots that 
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

%% Load the data

% Get lat/lon data
lat = csvread('lat.csv');
lon = csvread('lon.csv');

% Read in the rest of the data you need...


%% Figure Setup

% Set up the figure properties so it will be the correct size
Fig1 = figure(1);
Fig1.Units = 'normalized';
Fig1.OuterPosition = [0 0 0.5 1];

%% Make Plots

% Make the plots...


end

