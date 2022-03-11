function [aerData] = getAERData(scenario, access, dt)

% AER Data Provider
accessAER = access.DataProviders.Item('AER Data').Group.Item('BodyFixed').Exec(scenario.StartTime, scenario.StopTime, dt);

% AER Data
accessNumber = num2str(cell2mat(accessAER.DataSets.GetDataSetByName('Access Number').GetValues), '%03d');
times = cell2mat(accessAER.DataSets.GetDataSetByName('Time').GetValues);
azimuth = num2str(cell2mat(accessAER.DataSets.GetDataSetByName('Azimuth').GetValues), '%+03.4f');
elevation = num2str(cell2mat(accessAER.DataSets.GetDataSetByName('Elevation').GetValues), '%02.4f');
range = num2str(cell2mat(accessAER.DataSets.GetDataSetByName('Range').GetValues), '%04.4f');

for i = 1:1:accessAER.Interval.Count-1
    accessNumber = [accessNumber; num2str(cell2mat(accessAER.Interval.Item(cast(i,'int32')).DataSets.GetDataSetByName('Access Number').GetValues), '%03d')];
    times = [times; num2str(cell2mat(accessAER.Interval.Item(cast(i,'int32')).DataSets.GetDataSetByName('Time').GetValues))];
    azimuth = [azimuth; num2str(cell2mat(accessAER.Interval.Item(cast(i,'int32')).DataSets.GetDataSetByName('Azimuth').GetValues), '%+03.4f')];
    elevation = [elevation; num2str(cell2mat(accessAER.Interval.Item(cast(i,'int32')).DataSets.GetDataSetByName('Elevation').GetValues), '%02.4f')];
    range = [range; num2str(cell2mat(accessAER.Interval.Item(cast(i,'int32')).DataSets.GetDataSetByName('Range').GetValues), '%04.4f')];
    
end

% Output
count = length(accessNumber);
aerData = [accessNumber, repmat(' ',[count 1]),...
    times(:,1:24), repmat(' ',[count 1]),...
    azimuth, repmat(' ',[count 1]),...
    elevation, repmat(' ',[count 1]),...
    range];

end

%{
%%% SOURCES OF ERROR (with explanation and solution)

1) Arrays being concatenated are not consistent (wrong sizes)
    -Usually because something is taking up more space than expected
        -Access Number          [1:999] index
        -Elevation angle        [0:90] degrees
        -Azimuth angle          [-180:180] degrees
        -Range                  [-9999:9999] km
    -These are the expected sizes, if you go beyond this, you need to
    change the format spec in the num2str for the ones going out of bounds
    -I was VERY generous with the digits and precision so this SHOULDN'T be
    a problem unless you are computing 1k+ access windows or want to point
    your ground station with 1e-5 or better accuracy (neither of which
    should be happening with this problem though)

%}
