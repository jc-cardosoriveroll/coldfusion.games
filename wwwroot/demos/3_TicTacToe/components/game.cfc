<cfcomponent>

	<cffunction name="getFullUrl" access="remote" return="any">
		<!---
		<cfset local.Canonical = '#getPageContext().getRequest().getScheme()#://#cgi.server_name#/#cgi.script_name#?#cgi.query_string#'>
		--->
		<cfset local.Canonical = '#getPageContext().getRequest().getScheme()#://#cgi.server_name#/#cgi.script_name#/'>
		<cfreturn local.Canonical>
	</cffunction>

</cfcomponent>