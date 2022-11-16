
ACTION TimeZone: 
	// -------------------------------------------------------------------------------------------------------------
	// Read time zone information
	fctCfgGetTimeZone.enable := cmdReadTimeZone;
	fctCfgGetTimeZone();
	IF fctCfgGetTimeZone.status = ERR_OK OR fctCfgGetTimeZone.status <> ERR_FUB_BUSY THEN
		cmdReadTimeZone := FALSE;
	
		IF fctCfgGetTimeZone.status = ERR_OK THEN
			plcTimeZone := fctCfgGetTimeZone.timezoneID;
		END_IF
	END_IF
	
	// -------------------------------------------------------------------------------------------------------------
	// Sync windows time zone to PLC
	IF EDGEPOS(cmdSyncTimeZone) THEN
		mappRemoteShell.command := 'tzutil /g';
		mappRemoteShell.execute := TRUE;
	END_IF
	
	// Command execute finished
	IF EDGENEG(mappRemoteShell.execute) THEN
		timezoneID := 0;
		winTimeZone := mappRemoteShell.response;
		
		IF winTimeZone = 'Dateline Standard Time' THEN
			timezoneID := 5;
		ELSIF winTimeZone = 'UTC-11' THEN
			timezoneID := 10;
		ELSIF winTimeZone = 'Aleutian Standard Time' THEN
			timezoneID := 15;
		ELSIF winTimeZone = 'Hawaiian Standard Time' THEN
			timezoneID := 15;
		ELSIF winTimeZone = 'Alaskan Standard TimeELSIF winTimeZone = ' THEN
			timezoneID := 20;
		ELSIF winTimeZone = 'UTC-09' THEN
			timezoneID := 20;
		ELSIF winTimeZone = 'UTC-08' THEN
			timezoneID := 25;
		ELSIF winTimeZone = 'Pacific Standard Time (Mexico)' THEN
			timezoneID := 25;
		ELSIF winTimeZone = 'Pacific Standard Time' THEN
			timezoneID := 25;
		ELSIF winTimeZone = 'US Mountain Standard Time' THEN
			timezoneID := 30;
		ELSIF winTimeZone = 'Mountain Standard Time' THEN
			timezoneID := 35;
		ELSIF winTimeZone = 'Mountain Standard Time (Mexico)' THEN
			timezoneID := 40;
		ELSIF winTimeZone = 'Yukon Standard Time' THEN
			timezoneID := 40;
		ELSIF winTimeZone = 'Central Standard Time (Mexico)' THEN
			timezoneID := 45;
		ELSIF winTimeZone = 'Central Standard Time' THEN
			timezoneID := 50;
		ELSIF winTimeZone = 'Central America Standard Time' THEN
			timezoneID := 50;
		ELSIF winTimeZone = 'Easter Island Standard Time' THEN
			timezoneID := 50;
		ELSIF winTimeZone = 'Canada Central Standard Time' THEN
			timezoneID := 55;
		ELSIF winTimeZone = 'SA Pacific Standard Time' THEN
			timezoneID := 60;
		ELSIF winTimeZone = 'Eastern Standard Time (Mexico)' THEN
			timezoneID := 65;
		ELSIF winTimeZone = 'Eastern Standard Time' THEN
			timezoneID := 65;
		ELSIF winTimeZone = 'Haiti Standard Time' THEN
			timezoneID := 70;
		ELSIF winTimeZone = 'Cuba Standard Time' THEN
			timezoneID := 70;
		ELSIF winTimeZone = 'US Eastern Standard Time' THEN
			timezoneID := 75;
		ELSIF winTimeZone = 'Turks And Caicos Standard Time' THEN
			timezoneID := 75;
		ELSIF winTimeZone = 'Venezuela Standard Time' THEN
			timezoneID := 85;
		ELSIF winTimeZone = 'Central Brazilian Standard Time' THEN
			timezoneID := 85;
		ELSIF winTimeZone = 'SA Western Standard Time' THEN
			timezoneID := 85;
		ELSIF winTimeZone = 'Pacific SA Standard Time' THEN
			timezoneID := 85;
		ELSIF winTimeZone = 'Paraguay Standard Time' THEN
			timezoneID := 90;
		ELSIF winTimeZone = 'Atlantic Standard Time' THEN
			timezoneID := 90;
		ELSIF winTimeZone = 'Newfoundland Standard Time' THEN
			timezoneID := 95;
		ELSIF winTimeZone = 'Greenland Standard Time' THEN
			timezoneID := 100;
		ELSIF winTimeZone = 'Tocantins Standard Time' THEN
			timezoneID := 100;
		ELSIF winTimeZone = 'E. South America Standard Time' THEN
			timezoneID := 105;
		ELSIF winTimeZone = 'Argentina Standard Time' THEN
			timezoneID := 110;
		ELSIF winTimeZone = 'SA Eastern Standard Time' THEN
			timezoneID := 110;
		ELSIF winTimeZone = 'Montevideo Standard Time' THEN
			timezoneID := 110;
		ELSIF winTimeZone = 'Magallanes Standard Time' THEN
			timezoneID := 110;
		ELSIF winTimeZone = 'Bahia Standard Time' THEN
			timezoneID := 110;
		ELSIF winTimeZone = 'Saint Pierre Standard Time' THEN
			timezoneID := 110;
		ELSIF winTimeZone = 'UTC-02' THEN
			timezoneID := 115;
		ELSIF winTimeZone = 'Azores Standard Time' THEN
			timezoneID := 120;
		ELSIF winTimeZone = 'Cape Verde Standard Time' THEN
			timezoneID := 125;
		ELSIF winTimeZone = 'UTC' THEN
			timezoneID := 130;
		ELSIF winTimeZone = 'GMT Standard Time' THEN
			timezoneID := 130;
		ELSIF winTimeZone = 'Greenwich Standard Time' THEN
			timezoneID := 130;
		ELSIF winTimeZone = 'Sao Tome Standard Time' THEN
			timezoneID := 130;
		ELSIF winTimeZone = 'Morocco Standard Time' THEN
			timezoneID := 135;
		ELSIF winTimeZone = 'W. Europe Standard Time' THEN
			timezoneID := 140;
		ELSIF winTimeZone = 'Central Europe Standard Time' THEN
			timezoneID := 145;
		ELSIF winTimeZone = 'Romance Standard Time' THEN
			timezoneID := 150;
		ELSIF winTimeZone = 'W. Central Africa Standard Time' THEN
			timezoneID := 155;
		ELSIF winTimeZone = 'Central European Standard Time' THEN
			timezoneID := 160;
		ELSIF winTimeZone = 'Jordan Standard Time' THEN
			timezoneID := 165;
		ELSIF winTimeZone = 'GTB Standard Time' THEN
			timezoneID := 165;
		ELSIF winTimeZone = 'Middle East Standard Time' THEN
			timezoneID := 165;
		ELSIF winTimeZone = 'E. Europe Standard Time' THEN
			timezoneID := 165;
		ELSIF winTimeZone = 'Syria Standard Time' THEN
			timezoneID := 165;
		ELSIF winTimeZone = 'West Bank Standard Time' THEN
			timezoneID := 165;
		ELSIF winTimeZone = 'Kaliningrad Standard Time' THEN
			timezoneID := 167;
		ELSIF winTimeZone = 'FLE Standard Time' THEN
			timezoneID := 175;
		ELSIF winTimeZone = 'Egypt Standard Time' THEN
			timezoneID := 180;
		ELSIF winTimeZone = 'South Africa Standard Time' THEN
			timezoneID := 185;
		ELSIF winTimeZone = 'Israel Standard Time' THEN
			timezoneID := 190;
		ELSIF winTimeZone = 'South Sudan Standard Time' THEN
			timezoneID := 190;
		ELSIF winTimeZone = 'Sudan Standard Time' THEN
			timezoneID := 190;
		ELSIF winTimeZone = 'Libya Standard Time' THEN
			timezoneID := 190;
		ELSIF winTimeZone = 'Namibia Standard Time' THEN
			timezoneID := 190;
		ELSIF winTimeZone = 'E. Africa Standard Time' THEN
			timezoneID := 195;
		ELSIF winTimeZone = 'Arabic Standard Time' THEN
			timezoneID := 200;
		ELSIF winTimeZone = 'Turkey Standard Time' THEN
			timezoneID := 200;
		ELSIF winTimeZone = 'Arab Standard Time' THEN
			timezoneID := 205;
		ELSIF winTimeZone = 'Belarus Standard Time' THEN
			timezoneID := 205;
		ELSIF winTimeZone = 'Russian Standard Time' THEN
			timezoneID := 210;
		ELSIF winTimeZone = 'Volgograd Standard Time' THEN
			timezoneID := 210;
		ELSIF winTimeZone = 'Iran Standard Time' THEN
			timezoneID := 215;
		ELSIF winTimeZone = 'Arabian Standard Time' THEN
			timezoneID := 220;
		ELSIF winTimeZone = 'Astrakhan Standard Time' THEN
			timezoneID := 220;
		ELSIF winTimeZone = 'Azerbaijan Standard Time' THEN
			timezoneID := 230;
		ELSIF winTimeZone = 'Caucasus Standard Time' THEN
			timezoneID := 230;
		ELSIF winTimeZone = 'Russia Time Zone 3' THEN
			timezoneID := 230;
		ELSIF winTimeZone = 'Mauritius Standard Time' THEN
			timezoneID := 230;
		ELSIF winTimeZone = 'Saratov Standard Time' THEN
			timezoneID := 230;
		ELSIF winTimeZone = 'Georgian Standard Time' THEN
			timezoneID := 230;
		ELSIF winTimeZone = 'Afghanistan Standard Time' THEN
			timezoneID := 235;
		ELSIF winTimeZone = 'West Asia Standard Time' THEN
			timezoneID := 245;
		ELSIF winTimeZone = 'Pakistan Standard Time' THEN
			timezoneID := 245;
		ELSIF winTimeZone = 'Ekaterinburg Standard Time' THEN
			timezoneID := 245;
		ELSIF winTimeZone = 'Qyzylorda Standard Time' THEN
			timezoneID := 245;
		ELSIF winTimeZone = 'India Standard Time' THEN
			timezoneID := 250;
		ELSIF winTimeZone = 'Sri Lanka Standard Time' THEN
			timezoneID := 250;
		ELSIF winTimeZone = 'Nepal Standard Time' THEN
			timezoneID := 255;
		ELSIF winTimeZone = 'Central Asia Standard Time' THEN
			timezoneID := 270;
		ELSIF winTimeZone = 'Bangladesh Standard Time' THEN
			timezoneID := 270;
		ELSIF winTimeZone = 'Omsk Standard Time' THEN
			timezoneID := 270;
		ELSIF winTimeZone = 'Myanmar Standard Time' THEN
			timezoneID := 280;
		ELSIF winTimeZone = 'SE Asia Standard Time' THEN
			timezoneID := 285;
		ELSIF winTimeZone = 'Altai Standard Time' THEN
			timezoneID := 285;
		ELSIF winTimeZone = 'W. Mongolia Standard Time' THEN
			timezoneID := 285;
		ELSIF winTimeZone = 'North Asia Standard Time' THEN
			timezoneID := 290;
		ELSIF winTimeZone = 'N. Central Asia Standard Time' THEN
			timezoneID := 290;
		ELSIF winTimeZone = 'Tomsk Standard Time' THEN
			timezoneID := 290;
		ELSIF winTimeZone = 'North Asia East Standard Time' THEN
			timezoneID := 295;
		ELSIF winTimeZone = 'China Standard Time' THEN
			timezoneID := 295;
		ELSIF winTimeZone = 'Ulaanbaatar Standard Time' THEN
			timezoneID := 300;
		ELSIF winTimeZone = 'W. Australia Standard Time' THEN
			timezoneID := 305;
		ELSIF winTimeZone = 'Singapore Standard Time' THEN
			timezoneID := 310;
		ELSIF winTimeZone = 'Taipei Standard Time' THEN
			timezoneID := 315;
		ELSIF winTimeZone = 'Transbaikal Standard Time' THEN
			timezoneID := 320;
		ELSIF winTimeZone = 'Tokyo Standard Time' THEN
			timezoneID := 320;
		ELSIF winTimeZone = 'North Korea Standard Time' THEN
			timezoneID := 325;
		ELSIF winTimeZone = 'Korea Standard Time' THEN
			timezoneID := 325;
		ELSIF winTimeZone = 'Yakutsk Standard Time' THEN
			timezoneID := 330;
		ELSIF winTimeZone = 'Cen. Australia Standard Time' THEN
			timezoneID := 335;
		ELSIF winTimeZone = 'AUS Central Standard Time' THEN
			timezoneID := 335;
		ELSIF winTimeZone = 'E. Australia Standard Time' THEN
			timezoneID := 345;
		ELSIF winTimeZone = 'AUS Eastern Standard Time' THEN
			timezoneID := 350;
		ELSIF winTimeZone = 'West Pacific Standard Time' THEN
			timezoneID := 355;
		ELSIF winTimeZone = 'Tasmania Standard Time' THEN
			timezoneID := 360;
		ELSIF winTimeZone = 'Vladivostok Standard Time' THEN
			timezoneID := 360;
		ELSIF winTimeZone = 'Bougainville Standard Time' THEN
			timezoneID := 365;
		ELSIF winTimeZone = 'Magadan Standard Time' THEN
			timezoneID := 365;
		ELSIF winTimeZone = 'Norfolk Standard Time' THEN
			timezoneID := 365;
		ELSIF winTimeZone = 'Sakhalin Standard Time' THEN
			timezoneID := 365;
		ELSIF winTimeZone = 'Central Pacific Standard Time' THEN
			timezoneID := 365;
		ELSIF winTimeZone = 'Russia Time Zone 10' THEN
			timezoneID := 365;
		ELSIF winTimeZone = 'Russia Time Zone 11' THEN
			timezoneID := 370;
		ELSIF winTimeZone = 'New Zealand Standard Time' THEN
			timezoneID := 370;
		ELSIF winTimeZone = 'Fiji Standard Time' THEN
			timezoneID := 375;
		ELSIF winTimeZone = 'UTC+12' THEN
			timezoneID := 375;
		ELSIF winTimeZone = 'UTC+13' THEN
			timezoneID := 380;
		ELSIF winTimeZone = 'Tonga Standard Time' THEN
			timezoneID := 380;
		ELSIF winTimeZone = 'Samoa Standard Time' THEN
			timezoneID := 380;
		END_IF
		
		cmdSyncTimeZone := FALSE;
	END_IF
	
	// -------------------------------------------------------------------------------------------------------------
	// Set time zone information
	IF timezoneID <> 0 THEN
		fctCfgSetTimeZone.enable := TRUE;
		fctCfgSetTimeZone.timezoneID := timezoneID;
		
		IF fctCfgSetTimeZone.status <> ERR_FUB_BUSY AND fctCfgSetTimeZone.status <> ERR_FUB_ENABLE_FALSE THEN
			timezoneID := 0;		
			fctCfgSetTimeZone.enable := FALSE;
		END_IF
	END_IF
	fctCfgSetTimeZone();
	
END_ACTION
