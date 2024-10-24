<cfif not(isdefined("session.game"))>
    <!---new game options--->
    <ol>
        <li><a href="index.cfm?difficulty=1">Easy (0-9)</a></li>
        <li><a href="index.cfm?difficulty=2">Medium (0-49)</a></li>
        <li><a href="index.cfm?difficulty=3">Hard (0-99)</a></li>
    </ol>
<cfelse>
    <!--- keep playing--->
    Start New Game...
</cfif>
