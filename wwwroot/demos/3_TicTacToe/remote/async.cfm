<cfparam name="action" default="">
<cfset local.result = {}>

<cfswitch expression="#action#">
    <cfcase value="wsGetSubscribers">
        <cfset local.result = application.game.wsGetSubscribers("websocket")>
    </cfcase>
</cfswitch>

<cfoutput>#serializeJSON(local.result)#</cfoutput>