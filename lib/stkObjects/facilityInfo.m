function [facility, fSensor] = facilityInfo(root, fName, fLocation, fColor, fsName, fsCHA, fsRmin, fsRmax)
%%% FACILITY INFORMATION
%   Information for Facility (object) in Systems Tool Kit
%       1) Input Parameters
%       2) Definitions derived from Parameters
%
%   PARAMETERS
%       fName           Facility Name (char array: name)
%       fLocation       Facility Location (3x1 double:
%                           longitude, latitude, altitude)
%       fColor          Facility Color (3x1 double: RGB)
%       
%       fsName          Facility Sensor Name (char array: name)
%       fsCHA           Facility Sensor Cone Half Angle (double: degrees)
%       fsRmin          Facility Sensor Range Min (double: km)
%       fsRmax          Facility Sensor Range Max (double: km)
%
%   DEFINITIONS
%       facility        Facility (object)
%       fSensor         Facility Sensor (object)
%


%%% DEFINITIONS
% FACILITY (OBJECT)
facility = root.CurrentScenario.Children.New('eFacility', fName);

% FACILITY PROPERTIES
facility.Position.AssignGeodetic(fLocation(1), fLocation(2), fLocation(3));
facility.Graphics.Color = rgb2StkColor(fColor);

disp("Created: Facility")

% FACILITY SENSOR (OBJECT)
fSensor = facility.Children.New('eSensor', fsName);

% FACILITY SENSOR PROPERTIES
fSensor.CommonTasks.SetPatternSimpleConic(fsCHA, 1);
fsRange = fSensor.AccessConstraints.AddConstraint('eCstrRange');
fsRange.EnableMin = true;
fsRange.EnableMax = true;
fsRange.min = fsRmin;
fsRange.max = fsRmax;

% Graphics Stuff
fSensor.Graphics.Projection.UseConstraints = true;
fSensor.Graphics.Projection.UseDistance = true;

disp("Created: Facility Sensor")


end
