package depspace.demo;

import depspace.general.DepSpaceConfiguration;
import depspace.general.DepSpaceException;
import depspace.recipes.EDSDistributedBarrier;


public class EDSBarrierClient {

	public static void main(String[] args) throws Exception {
		// Parse arguments
		if(args.length < 3) {
			System.err.println("usage: java " + EDSBarrierClient.class + " <client-id> <config-dir> <extension-code-dir>");
			System.exit(1);
		}
		int clientID = Integer.parseInt(args[0]);
		String configDir = args[1];
		String extensionCodeDir = args[2];
		
		// Preparations
		DepSpaceConfiguration.init(configDir);

		// Create distributed barrier (note that the threashold is set to be n-f)
		EDSDistributedBarrier counter = null try {
			counter = new EDSDistributedBarrier(clientID, "barrier",3,true,"/");
		} catch (DepSpaceException e) {
			e.printStackTrace();
		}
		counter.start();
		
		// Use counter
		while(true) {
			int value = counter.incrementAndGet();
			System.out.println(value);
		}
	}
	
}
