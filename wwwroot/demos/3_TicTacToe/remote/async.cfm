

<cfparam name="url.action" default="">


<cfswitch expression="#url.action#">
    <cfcase value="newgame">
        <cfparam name="url.p1">
        <cfparam name="url.p2">
        <cfset session.game = createobject("component","game").init(p1=url.p1,p2=url.p2)>
    </cfcase>
    <cfcase value="pickcell">
        <cfparam name="url.id">
        <cfparam name="url.p">
        <cfparam name="url.cell">
        <cfset result = session.game.pickcell(id=url.id,p=url.p,cell=url.cell)>
        <cfswitch expression="#result.game.state#">
            <cfcase value="reset">
                <cfset session.game = createobject("component","game").init(p1=url.p1,p2=url.p2)>
            </cfcase>
            <cfcase value="endgame">

            </cfcase>
        </cfswitch>
    </cfcase>
    <cfcase value="getGame">
        <!--- doesn't require action, it just returns session.game --->
    </cfcase>
</cfswitch>

<cfif isdefined("session.game")>
<cfoutput>#serializeJSON(session.game)#</cfoutput>
</cfif>