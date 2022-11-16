
TYPE
	mappShell_typ : 	STRUCT 
		execute : BOOL;
		command : STRING[200];
		response : STRING[2000];
		status : UINT;
		alive_counter : UINT := 65535;
		connected : BOOL;
	END_STRUCT;
END_TYPE
