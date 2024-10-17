<cfcomponent extends="CFIDE.websocket.ChannelListener">

    <!--- Websocket function overwriters --->
	<cffunction access="public" return="boolean" name="allowSubscribe">
		<cfargument name="subscriberInfo" type="struct">

		<!--- When new user let subscribers know they need to refresh user list --->
		<cfset local.data = getSocketUsers(channel="websockets")>
		<cfset wsPublish("websocket",serializeJSON(local.data))>	

		<cfreturn true>		
	</cffunction>

	<cffunction access="public" return="any" name="beforePublish">
		<cfargument name="message" type="any">
		<cfargument name="publisherInfo" type="struct">

		<cfreturn arguments.message>
	</cffunction>


    <!--- custom "internal" helpers --->
    <cffunction name="getSocketUsers" access="private">
        <cfargument name="channel" default="websocket">
        <cfset local.wsUsers = wsGetSubscribers(arguments.channel)>
        <cfreturn local.wsUsers>
    </cffunction>

</cfcomponent>