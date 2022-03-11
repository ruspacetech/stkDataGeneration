%%% PRELIMINARY STUFF
tic
% ADDING TO PATH (TEMPORARY)
addpath(genpath('lib'));
addpath(genpath('tmp'));


%%% STK LAUNCH
uiApplication = actxserver('STK12.application');
uiApplication.Visible = 1;
root = uiApplication.Personality2;

disp("Started: Systems Tool Kit")


%%% STK SETUP
%{
[scenario, timeVector, dt] = scenarioInfo(root, scenName, scenStartTime, scenStopTime, dt);
[facility, fSensor] = facilityInfo(root, fName, fLocation, fColor, fsName, fsCHA, fsRmin, fsRmax)
%}
% SCENARIO
[scenario, timeVector, dt] = scenarioInfo(root, 'solid',...
    '24 Dec 2021 00:00:00.000', '26 Dec 2021 00:00:00.000', 1);

% FACILITY AND FACILITY SENSOR
[facility, fSensor] = facilityInfo(root, 'rugs', [40.5215 -74.4618 0], [0 255 255],...
    'rugsSensor', 90, 0, 1500);

% SATELLITE AND SATELLITE SENSOR
[satellite, sSensor] = satelliteInfo(root, 'SPICESat', 6371+350, 0, 45, 0, 0, 0,...
    [255 0 0], 'C:\Program Files\AGI\STK 12\STKData\VO\Models\Space\cubesat_3u.dae',...
    'sSensor', 1, 0, 1500);
disp(['Added all STK Objects: ', num2str(toc), ' seconds'])


%%% RESET ANIMATION
root.Rewind;


%%% COMPUTE ACCESS
tic
access = satellite.GetAccessToObject(fSensor);
access.ComputeAccess();
disp(['Computed: Access: ', num2str(toc), ' seconds'])


%%% GET DATA
[aerData] = getAERData(scenario, access, dt);
disp('Data Obtained')

%%% MAKE TEXT FILE
makeTextFile('AERData', aerData)
disp('Text Files Created')

