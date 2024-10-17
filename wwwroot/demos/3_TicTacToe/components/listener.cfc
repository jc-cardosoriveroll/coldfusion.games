<cfcomponent extends="CFIDE.websocket.ChannelListener">
	<cffunction access="public" return="boolean" name="allowSubscribe">
		<cfargument name="subscriberInfo" type="struct">

		<!--- When new user has joined send msg to Lobby --->
		<cfset local.msg = {"action" : "newUser", "subscriberInfo" : arguments.subscriberInfo}>	
		<cfset wsPublish("websocket",local.msg)>	

		<cfreturn true>		
	</cffunction>

	<cffunction access="public" return="any" name="beforePublish">
		<cfargument name="message" type="any">
		<cfargument name="publisherInfo" type="struct">

		<cfreturn arguments.message>
	</cffunction>

</cfcomponent>

