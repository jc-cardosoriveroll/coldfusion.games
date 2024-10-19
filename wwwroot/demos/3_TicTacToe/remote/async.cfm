

<cfparam name="url.action" default="">
<cfset local.result = {}>

<cfswitch expression="#url.action#">
    <cfcase value="newgame">
        <cfset local.result = createobject("component","game").init(p1=url.p1,p2=url.p2)>
    </cfcase>
</cfswitch>

<cfoutput>#serializeJSON(local.result)#</cfoutput>