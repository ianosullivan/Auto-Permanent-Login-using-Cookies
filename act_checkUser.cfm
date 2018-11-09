
<!--- 
This would be your usual check login file. If the user has logged on successfully create the CLIENT cookie (assuming they have accepted cookies).
--->


<!--- Other stuff removed from here for brevity --->
<!--- Other stuff removed from here for brevity --->
<!--- Other stuff removed from here for brevity --->




<!--- CLIENT VARIABLE // Start --->
<!--- auth_token format is {user_id|||yyyyddmm-hhnnss|||CLIENT.CFID} --->
	<cfset CLIENT.auth_token = $.user.createAuthToken(session.user.id)>
<!--- CLIENT VARIABLES // End --->



<!--- Other stuff removed from here for brevity --->
<!--- Other stuff removed from here for brevity --->
<!--- Other stuff removed from here for brevity --->

