

<cfparam name="url.action" default="">


<cfset game = createobject("component","game").init()>

<cfswitch expression="#url.action#">
    <cfcase value="newgame">
        <cfparam name="p1">
        <cfparam name="p2">
        <cfset result = game.newgame(p1=p1,p2=p2)>        
    </cfcase>
    <cfcase value="pickcell">
        <cfparam name="game">
        <cfparam name="id">
        <cfparam name="p">
        <cfparam name="cell">
        <cfset result = game.pickcell(id=id,p=p,cell=cell,game=deserializeJSON(game))>
    </cfcase>
    <cfcase value="getGame">
        <!--- doesn't require action, it just returns session.game --->
    </cfcase>
</cfswitch>

<cfif isdefined("session.game")>
<cfoutput>#serializeJSON(session.game)#</cfoutput>
</cfif>