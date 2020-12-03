from opcua import ua
from opcua import Client
import time
import logging
import sys
sys.path.insert(0, "..")

# constants
BadNodeIdUnknown = 2150891520
BadNodeIdInvalid = 2150825984
ConnectionRefusedError = 10061
FileNotFoundError = 2

try:
    from IPython import embed
except ImportError:
    import code

    def embed():
        vars = globals()
        vars.update(locals())
        shell = code.InteractiveConsole(vars)
        shell.interact()


class SubHandler(object):

    """
    Subscription Handler. To receive events from server for a subscription
    data_change and event methods are called directly from receiving thread.
    Do not do expensive, slow or network operation there. Create another 
    thread if you need to do such a thing
    """

    def __init__(self, url):
        self.server_url = url

    def datachange_notification(self, node, val, data):
        print("Python: New data change event", node, val)

    def event_notification(self, event):
        print("Python: New event", event)

    def connect(self):
        """
            High level method
            Connect, create and activate session
            """
        logging.basicConfig(level=logging.WARN)
        #logger = logging.getLogger("KeepAlive")
        # logger.setLevel(logging.DEBUG)

        client = Client(self.server_url)
        try:
            client.connect()
            # load definition of server specific structures/extension objects
            client.load_type_definitions()

            # connect opc variables
            varExecute = client.get_node("ns=6;s=::mappRemote:mappRemoteBatch.execute")

            # subscribing to a variable node
            handler = SubHandler(self.server_url)
            sub = client.create_subscription(500, handler)
            handle = sub.subscribe_data_change(varExecute)
            time.sleep(0.1)

            # we can also subscribe to events from server
            sub.subscribe_events()
            # sub.unsubscribe(handle)
            # sub.delete()

            embed()
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
        finally:
            client.disconnect()
