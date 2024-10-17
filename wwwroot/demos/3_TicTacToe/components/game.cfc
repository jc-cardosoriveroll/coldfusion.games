<cfcomponent extends="CFIDE.websocket.ChannelListener">

    <!--- Websocket function overwriters --->
	<cffunction access="public" return="boolean" name="allowSubscribe">
		<cfargument name="subscriberInfo" type="struct">

		<cfreturn true>		
	</cffunction>

	<cffunction access="public" return="any" name="beforePublish">
		<cfargument name="message" type="any">
		<cfargument name="publisherInfo" type="struct">

		<!--- When new user let subscribers know they need to refresh user list --->
		<cfset local.data = {"users" : wsGetSubscribers("websocket")}>
		<cfset wsPublish("websocket",serializeJSON(local.data))>	

		<cfreturn arguments.message>
	</cffunction>



</cfcomponent>