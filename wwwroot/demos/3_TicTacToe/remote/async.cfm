
<cfset req = getHTTPRequestData().content>

<cfparam name="action" default="">
<cfset local.result = {}>

<!---
<cfset local.game = createobject("component","game").init()>
--->
<cfswitch expression="#action#">
    <cfcase value="newgame">
        <cfset local.result = req>
        <!---
        <cfset local.result = local.game.newGame(p1=json.p1,p2=json.p2)>
        --->
    </cfcase>
</cfswitch>

<cfoutput>#serializeJSON(local.result)#</cfoutput>