<cfcomponent extends="CFIDE.websocket.ChannelListener">

    <!--- Websocket function overwriters --->
	<cffunction access="public" return="boolean" name="allowSubscribe">
		<cfargument name="subscriberInfo" type="struct">
		<!---
		<cfset wsPublish("websocket","refreshUsers")>		
		--->
		<cfreturn true>		
	</cffunction>

	<cffunction access="public" return="boolean" name="afterUnsubscribe">
		<cfargument name="subscriberInfo" type="struct">
		<cfreturn true>		
	</cffunction>	

	<cffunction access="public" return="any" name="allowPublish">
		<cfargument name="publisherInfo" type="struct">
	</cffunction>

	<cffunction access="public" return="any" name="beforePublish">
		<cfargument name="message" type="any">
		<cfargument name="publisherInfo" type="struct">
		<cfreturn arguments.message>
	</cffunction>

</cfcomponent>