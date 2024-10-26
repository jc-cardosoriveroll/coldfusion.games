<cfcomponent extends="CFIDE.websocket.ChannelListener">
    <!--- Websocket function overwriters --->
	<cffunction access="public" return="any" name="allowPublish">
		<cfargument name="publisherInfo" type="struct">
		<cfset wsPublish("websocket2","newGame")>	
		<cfreturn true>
	</cffunction>
</cfcomponent>