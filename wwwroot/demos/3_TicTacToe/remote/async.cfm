<cfparam name="action" default="">
<cfset local.result = {}>

<cfswitch expression="#action#">
    <cfcase value="users">
        <cfset local.result = [{"name" : "wiki"},{"name" : "lega"},{"name" : "nat"}]>
        <!---
        <cfset local.result = application.game.getData(channel="websocket")>
        --->
    </cfcase>
</cfswitch>

<cfoutput>#serializeJSON(local.result)#</cfoutput>