<cfcomponent extends="CFIDE.websocket.ChannelListener">

    <!--- Websocket function overwriters --->
	<cffunction access="public" return="boolean" name="allowSubscribe">
		<cfargument name="subscriberInfo" type="struct">
		
		<cfreturn true>		
	</cffunction>


	<cffunction name="public" return="any" name="allowPublish">
		<cfargument name="publisherInfo" type="struct">

		<cfset local.data = {"action" : "allowPublish", "publisherInfo" : arguments.publisherInfo}>
		<cfset wsPublish("websocket",serializeJSON(local.data))>		
	</cffunction>

	<cffunction access="public" return="any" name="beforePublish">
		<cfargument name="message" type="any">
		<cfargument name="publisherInfo" type="struct">

		<cfreturn arguments.message>
	</cffunction>

	<cffunction name="getFullUrl" access="remote" return="any">
		<cfset local.Canonical = '#getPageContext().getRequest().getScheme()#://#cgi.server_name#/#cgi.script_name#?#cgi.query_string#'>
		<cfreturn local.Canonical>
	</cffunction>


</cfcomponent>