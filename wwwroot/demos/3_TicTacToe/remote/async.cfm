
<cfset req = getHTTPRequestData()>
<cfset json = deserializeJSON(req)>

<cfparam name="action" default="">
<cfset local.result = {}>

<cfset local.game = createobject("component","game").init()>
<cfswitch expression="#action#">
    <cfcase value="newgame">
        <cfparam name="json.p1">
        <cfparam name="json.p2">
        <cfset local.result = json>
        <!---
        <cfset local.result = local.game.newGame(p1=json.p1,p2=json.p2)>
        --->
    </cfcase>
</cfswitch>

<cfoutput>#serializeJSON(local.result)#</cfoutput>