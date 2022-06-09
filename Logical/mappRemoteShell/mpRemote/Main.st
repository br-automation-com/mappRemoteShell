// -----------------------------------------------------------------------------------------------------------------
// mappRemoteShell helper task
// Version 0.5
// -----------------------------------------------------------------------------------------------------------------
PROGRAM _INIT
	mappRemoteShell.command := 'explorer.exe';
END_PROGRAM

PROGRAM _CYCLIC
	// -----------------------------------------------------------------------------------------------------------------
	// Alive counter is reset every 5s, after 10s it will asumme the connection is lost
	IF mappRemoteShell.alive_counter < 1000 THEN
		mappRemoteShell.alive_counter := mappRemoteShell.alive_counter + 1;
		mappRemoteShell.connected := TRUE;
	ELSE
		mappRemoteShell.connected := FALSE;
	END_IF
	// -----------------------------------------------------------------------------------------------------------------
	// Excecute new command
	IF EDGEPOS(mappRemoteShell.execute) THEN
		IF mappRemoteShell.connected THEN
			mappRemoteShell.status := ERR_FUB_BUSY;
		ELSE
			mappRemoteShell.status := ERR_NOT_CONNECTED;
			mappRemoteShell.execute := FALSE;
			mappRemoteShell.response := 'Remote script is not connected';
		END_IF
	END_IF
	
END_PROGRAM

