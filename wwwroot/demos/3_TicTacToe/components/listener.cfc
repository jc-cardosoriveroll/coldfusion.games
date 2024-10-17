<cfcomponent extends="CFIDE.websocket.ChannelListener">
	<cffunction access="public" return="boolean" name="allowSubscribe">
		<cfargument name="subscriberInfo" type="struct">

		<!--- When new user let subscribers know they need to refresh user list --->
		<cfset wsPublish("websocket","wsGetSubscribers")>	

		<cfreturn true>		
	</cffunction>

	<cffunction access="public" return="any" name="beforePublish">
		<cfargument name="message" type="any">
		<cfargument name="publisherInfo" type="struct">

		<cfreturn arguments.message>
	</cffunction>

</cfcomponent>

