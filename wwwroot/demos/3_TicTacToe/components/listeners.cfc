<cfcomponent extends="CFIDE.websocket.ChannelListener">
    <!--- Websocket function overwriters --->
	<cffunction access="public" return="boolean" name="allowSubscribe">
		<cfargument name="subscriberInfo" type="struct">
		<cfset wsPublish("websocket","refreshUsers")>		
		<cfreturn true>		
	</cffunction>
	
	<cffunction access="public" return="any" name="allowPublish">
		<cfargument name="publisherInfo" type="struct">
		<cfset wsPublish("websocket","refreshUsers")>	
		<cfreturn true>
	</cffunction>
	<!---

	<cffunction access="public" return="any" name="beforePublish">
		<cfargument name="message" type="any">
		<cfargument name="publisherInfo" type="struct">
		<cfset refresh()>
		<cfreturn arguments.message>
	</cffunction>

	<cffunction access="public" return="any" name="beforeSendMessage">
		<cfargument name="message" type="any">
		<cfargument name="subscriberInfo" type="struct">
		<cfset refresh()>
		<cfreturn arguments.message>
	</cffunction>

	<cffunction access="public" return="any" name="afterUnsubscribe">
		<cfargument name="subscriberInfo" type="struct">
		<cfset refresh()>
	</cffunction>
	--->
	<cffunction access="private" return="any" name="refresh">
		<cfset wsPublish("websocket","refreshUsers")>	
	</cffunction>
</cfcomponent>