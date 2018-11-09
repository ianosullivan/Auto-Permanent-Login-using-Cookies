<cfscript>
/* 
If SESSION.user.id is zero 
AND 
if CLIENT.auth_token is defined. 

If the user_id is returned from the decryption of the client value set the session variables required for this app
*/
if( SESSION.user.id == 0 && isDefined('CLIENT.auth_token') ){

	// Attempt to decrypt the client value
	client_user_id = application.cfcs.user.decryptAuthToken(CLIENT.auth_token);

	// If the user ID returned is not -1 then we have a valid user_id so proceed to populate the required session variables
	if(client_user_id != -1){
		// Get the user object and populate the session variables
		valid_user = entityLoadByPK('users', client_user_id);

		session.user.id = valid_user.id;		
		session.user.logged_in = true;  // Used throughout the system. This is cfparam'ed to false in Application.cfc 
		
		session.user.admin = valid_user.is_admin == "YES" ? true : false;  // Used throughout the system 
		session.user.first_name = valid_user.firstname;  // Used throughout the system 
		session.user.full_name = valid_user.FullName; // Used throughout the system 
	}
	else{
		// Delete the client variable as the parsing of it failed 
		deleteclientvariable('auth_token');


		// If not an AJAX request just do a page reload
		if ( !isDefined('ajax') ){
			location (APPLICATION.settings.site_url, false);
		}
		else {
			// If an ajax request we want to force the page to reload via a JS script
			writeOutput('<script>window.location.reload();</script>');
			abort;
		}
	}
}
</cfscript>