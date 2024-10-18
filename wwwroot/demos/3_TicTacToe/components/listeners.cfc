<cfcomponent extends="CFIDE.websocket.ChannelListener">
    <!--- Websocket function overwriters --->
	<cffunction access="public" return="boolean" name="allowSubscribe">
		<cfargument name="subscriberInfo" type="struct">
		<cfreturn true>		
	</cffunction>

	<cffunction access="public" return="any" name="allowPublish">
		<cfargument name="publisherInfo" type="struct">
		<cfset wsPublish("websocket","newGame")>	
		<cfreturn true>
	</cffunction>

	<cffunction access="public" return="any" name="beforePublish">
		<cfargument name="message" type="any">
		<cfargument name="publisherInfo" type="struct">
		<!--- cannot send message here --->
		<cfreturn arguments.message>
	</cffunction>

	<cffunction access="public" return="any" name="beforeSendMessage">
		<cfargument name="message" type="any">
		<cfargument name="subscriberInfo" type="struct">
		<!--- cannot send message here --->
		<cfreturn arguments.message>
	</cffunction>

	<cffunction access="public" return="any" name="afterUnsubscribe">
		<cfargument name="subscriberInfo" type="struct">
		<cfset refresh()>
	</cffunction>

</cfcomponent>