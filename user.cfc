<cfcomponent>


	<!--- Other functions removed from here for brevity --->
	<!--- Other functions removed from here for brevity --->
	<!--- Other functions removed from here for brevity --->
	<!--- Other functions removed from here for brevity --->


	<cfscript>

		// Functions for creating and storing authentication token cookies on the local users machine
		// Note that the application.secret_key is stored in the config file and was created by 
		// generateSecretKey('DESEDE', 256);

		string function createAuthToken(numeric user_id) hint="Create client authentication token to be stored on local users machine" 
		{		 	
		 	// Format is {user_id|||yyyyddmm-hhnnss|||CLIENT.CFID}. We add the date part to ensure the token created is unique every time
		 	LOCAL.encrypted_val = encrypt(
		 		user_id 
		 		& '|||' & dateTimeFormat(now(),'yyyyddmm-hhnnss')
		 		& '|||' & CLIENT.CFID
		 		, application.secret_key, 'DESede', 'Base64'
		 	);

		 	return LOCAL.encrypted_val;
		}

		string function decryptAuthToken(string val) hint="decrypt client authentication token that is stored on the local users machine" 
		{
			// Try to decrypt and return the user ID. If not just return zero
			try{
			 	LOCAL.decrypted_val = decrypt( val, application.secret_key, 'DESede', 'Base64');

			 	// Security check to see it came from the same machine
			 	// Check that the COOKIE CFID matches the actual CLIENT value
			 	if( listLast(LOCAL.decrypted_val, '|||') == CLIENT.CFID ){
				 	// return the user_id from the decrypted value
				 	return listFirst(LOCAL.decrypted_val, '|||');							 		
			 	} 
			 	else {
			 		return -1;	
			 	}
			}
			catch(any e){
				return -1;
			}
		}

	</cfscript>

</cfcomponent>