<cfcomponent extends="CFIDE.websocket.ChannelListener">

    <!--- Websocket function overwriters --->
	<cffunction access="public" return="boolean" name="allowSubscribe">
		<cfargument name="subscriberInfo" type="struct">
		
		<cfreturn true>		
	</cffunction>

	<cffunction access="public" return="any" name="allowPublish">
		<cfargument name="publisherInfo" type="struct">
		<!---
		<cfset local.data = {"action" : "allowPublish", "publisherInfo" : arguments.publisherInfo}>
		<cfset wsPublish("websocket",serializeJSON(local.data))>		
		--->
	</cffunction>

	<cffunction access="public" return="any" name="beforePublish">
		<cfargument name="message" type="any">
		<cfargument name="publisherInfo" type="struct">

		<cfreturn arguments.message>
	</cffunction>

</cfcomponent>