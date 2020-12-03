# ----------------------------------------------------------------------------------------
# B&R batch file executer V0.1
# Installation
# - Download and install python 3.9 or above
# - run shell command 'pip install opcua'
# ----------------------------------------------------------------------------------------

# imports
import sys
import subprocess
from opcua import Client

# constants
BadNodeIdUnknown = 2150891520
BadNodeIdInvalid = 2150825984
ConnectionRefusedError = 10061
FileNotFoundError = 2

print('mappBatch started...')

try:
	firstRun = True
	client = Client("opc.tcp://localhost:4840/")

	client.connect()
	client.load_type_definitions()
	print('connected to PLC...')

	# connect opc variables
	varExecute = client.get_node("ns=6;s=::mappRemote:mappRemoteBatch.execute")

	while True:
	    value = varExecute.get_value()
	    if value and firstRun:
	        firstRun = False
	        # Replace 'C:\OpenMV.bat' with the path and name of your batch file
	        subprocess.call([r'C:\OpenMV.bat'])
	    elif not value:
	        firstRun = True

# ----------------------------------------------------------------------------------------
# Handle excpetions
except Exception as e:

	if e.args[0] == ConnectionRefusedError:
    		print("Connection refused, make sure OPC server is running")
	elif e.args[0] == BadNodeIdUnknown or BadNodeIdInvalid:
    		print("mappBatch variable is missing, make sure mappBatch task is running on server")
	elif e.args[0] == FileNotFoundError:
    		print("batch file not found, make sure name and path is correct")
	else:
			print("Unexpected error:", sys.exc_info()[0])
	client.disconnect()
