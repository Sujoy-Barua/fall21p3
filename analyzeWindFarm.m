function [ c1, c2, c3, c4, c5 ] = analyzeWindFarm( filenameWind, filenameWave, filenameBuoy, windSpeedMin, windSpeedMax, waveHeightMax, waveHeightRisk, deckHeight )
% Function to complete Task 1. Evaluates the 5 constraints on the location of a
% wind farm.
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
%         waveHeightMax: for constraints 2 & 3 -- maximum wave height (m)
%        waveHeightRisk: for constraint 3 -- maximum wave height risk (%)
%            deckHeight: for constraint 4 -- height of the deck that supports 
%                        the turbine base (m)
%
%   return values:
%                    c1: boolean values corresponding to whether the wind 
%                        farm location passes constraint #1
%                    c2: boolean values corresponding to whether the wind 
%                        farm location passes constraint #2
%                    c3: boolean values corresponding to whether the wind 
%                        farm location passes constraint #3
%                    c4: boolean values corresponding to whether the wind 
%                        farm location passes constraint #4
%                    c5: boolean values corresponding to whether the wind 
%                        farm location passes constraint #5

%% YOUR CODE HERE



end

