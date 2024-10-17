<cfcomponent>
    <cffunction name="init">

        <cfreturn this>
    </cffunction>

    <cffunction name="wsGetSubscribers">
        <cfargument name="channel" default="websocket">
        <cfset local.wsUsers = wsGetSubscribers(arguments.channel)>
        <cfreturn local.wsUsers>
    </cffunction>

</cfcomponent>