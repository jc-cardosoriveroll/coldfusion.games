<cfparam name="action" default="">
<cfset local.result = {}>

<cfset local.game = createobject("component","../compoonents/game").init()>
<cfswitch expression="#action#">
    <cfcase value="newgame">
        <cfparam name="url.p1">
        <cfparam name="url.p2">
        <cfset local.result = local.game.newGame(p1=url.p1,p2=url.p2)>
    </cfcase>
</cfswitch>

<cfoutput>#serializeJSON(local.result)#</cfoutput>