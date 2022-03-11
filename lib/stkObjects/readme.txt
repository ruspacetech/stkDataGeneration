INFORMATION SCRIPTS
	- Scripts that contain information for the analysis
	- Parameters
		- User input variables (formats specified in file)
		- Meant to be edited as a text document (easier to load than MATLAB)
		- File names are *Info.m (* is a stand-in for 'anything')
	- Definitions
		- Used for defining certain variables (those defined in Parameters)
		- Not meant for user inputs (directly editing can cause problems)
	- Specific Scripts
		- scenarioInfo.m		Information for scenario creation (see file for details)
		- facilityInfo.m		Information for facility creation (see file for details)
		- satelliteInfo.m	Information for satellite creation (see file for details)

scenarioInfo.m
	Information for Scenario (object) in Systems Tool Kit
		1) Input Parameters
		2) Definitions derived from Parameters
	Parameters
     		scenName			Scenario Name (char array: name)
     		scenStartTime		Scenario Start Time (char array: date)
							Format: 'dd MMM yyyy HH:mm:ss:SSS'
       	scenStopTime		Scenario Stop Time (char array: date)
							Format: 'dd MMM yyyy HH:mm:ss:SSS'
       	interval			Time Step (double: seconds)
	Definitions
     		scenStartTime		Analysis Start Time (datetime: date)
     		scenStopTime		Analysis Stop Time (datetime: date)
    		dt				Time Step (duration: seconds)
     		timeVector			Time Vector (column list of datetimes)
		scenario			Scenario (object)

facilityInfo.m
	Information for Facility (object) in Systems Tool Kit
		1) Input Parameters
		2) Definitions derived from Parameters
	PARAMETERS
		fName				Facility Name (char array: name)
		fLocation			Facility Location (3x1 double:
							longitude, latitude, altitude)
		fColor			Facility Color (3x1 double: RGB)

		fsName			Facility Sensor Name (char array: name)
		fsCHA				Facility Sensor Cone Half Angle (double: degrees)
		fsRmin			Facility Sensor Range Min (double: km)
		fsRmax			Facility Sensor Range Max (double: km)
	DEFINITIONS
		facility			Facility (object)
		fSensor			Facility Sensor (object)

satelliteInfo.m
	Information for Satellite (object) in Systems Tool Kit
		1) Input Parameters
		2) Definitions derived from Parameters
	PARAMETERS
		sName				Satellite Name (char array: name)
		sSMA				Semimajor Axis (double: km)
		sE				Eccentricity (double: unitless)
		sI				Angle of Inclination (double: deg)
		sAP				Argument of Perigee (double: deg)
		sAN				Ascending Node (double: deg)
		sL				Location in Orbit (double: deg)
		sModel			Satellite Model (char array: model path)

		ssName			Satellite Sensor Name (char array: name)
		ssCHA				Satellite Sensor Cone Half Angle
							(double: degrees)
		ssRmin			Satellite Sensor Range Min (double: km)
		ssRmax			Satellite Sensor Range Max (double: km)

	DEFINITIONS
		satellite			Satellite (object)
		sSensor			Satellite Sensor (object)

