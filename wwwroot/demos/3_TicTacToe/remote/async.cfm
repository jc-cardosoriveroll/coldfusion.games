

<cfparam name="url.action" default="">


<cfswitch expression="#url.action#">
    <cfcase value="newgame">
        <cfparam name="url.p1">
        <cfparam name="url.p2">
        <cfset session.game = createobject("component","game").init(p1=url.p1,p2=url.p2)>
    </cfcase>
</cfswitch>

<cfif isdefined("session.game")>
<cfoutput>#serializeJSON(session.game)#</cfoutput>
</cfif>