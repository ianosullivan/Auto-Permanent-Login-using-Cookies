
<!--- Other stuff removed from here for brevity --->
<!--- Other stuff removed from here for brevity --->
<!--- Other stuff removed from here for brevity --->




<!--- Generate a new secret key for every Appreload. 
	This will cause the cookie decryption to fail AFTER the users session has expired
	It should fail gracefully and it should empty the cookie so it is correctly populated after next successful login.
	By having a new secret key generated for every AppReload this can be used as a way to force users to log back into the system AFTER their session has expired
	Note: Ensure the AppReload code comes BEFORE the check_client_variable code
--->
<cfset application.secret_key = generateSecretKey('DESede')>
<!--- <cfset application.secret_key = 'CJjEyxUvrqfxEwfgSYAlH2LNeaJAbdwO '> --->
