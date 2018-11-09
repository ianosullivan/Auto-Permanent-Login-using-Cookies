<cfcomponent output="false">

	<cfset THIS.SessionManagement = true />
	<cfset THIS.SessionTimeout = CreateTimeSpan(0,2,0,0) />
	<!--- Set to 1 second while testing CLIENT variables authentication functionality --->
	<!--- <cfset THIS.SessionTimeout = CreateTimeSpan(0,0,0,1) /> --->
	<cfset THIS.clientManagement = true>

	<cfset THIS.datasource = "dubai-fdi"/>
	<cfset THIS.ormEnabled = true />
	<cfset THIS.ormsettings.cfclocation = "application/ORM" />
	<cfset THIS.invokeImplicitAccessor = true>
	
	<cfset THIS.setDomainCookies = false />


	<!--- Layout manager --->
	<cffunction name="OnRequestStart" returntype="boolean" output="true">
		<cfargument
			name="template"
			type="string"
			required="true"
			hint="I am the template requested by the user."
			/>

		<!--- Other stuff removed from here for brevity --->
		<!--- Other stuff removed from here for brevity --->
		<!--- Other stuff removed from here for brevity --->
		<!--- Other stuff removed from here for brevity --->

		<!--- Do client variables login check. If session.user.id is zero then try to populate the session --->
		<!--- <cfinclude template="application/app_cfc/check_client_variables.cfm"> --->
		<cfinclude template="check_client_variables.cfm">

		<!--- Other stuff removed from here for brevity --->
		<!--- Other stuff removed from here for brevity --->
		<!--- Other stuff removed from here for brevity --->
		<!--- Other stuff removed from here for brevity --->

	</cffunction>


	<!--- Other stuff removed from here for brevity --->
	<!--- Other stuff removed from here for brevity --->
	<!--- Other stuff removed from here for brevity --->


</cfcomponent>
