<cfcomponent extends="CFIDE.websocket.ChannelListener">

    <!--- Websocket function overwriters --->
	<cffunction access="public" return="boolean" name="allowSubscribe">
		<cfargument name="subscriberInfo" type="struct">

		<cfset local.data = {"action" : "allowSubscribe", "clientid" : arguments.subscriberInfo.clientid}>
		<cfset wsPublish("websocket",serializeJSON(local.data))>		
		<cfreturn true>		
	</cffunction>

	<cffunction access="public" return="any" name="beforePublish">
		<cfargument name="message" type="any">
		<cfargument name="publisherInfo" type="struct">

		<cfreturn arguments.message>
	</cffunction>



</cfcomponent>