<cfcomponent>
    <cffunction name="init">
        <cfreturn this>
    </cffunction>

    <cffunction name="newGame">
        <cfargument name="difficulty" default="1" hint="1-3 easy-hard">

        <!--- Initialize Game --->
        <cfset local.game = {
                                "currentState" : "Start Guessing...",
                                "difficulty" : arguments.difficulty,
                                "history" : [],
                                "isDone" : false;
                            }>

        <!--- Randomize Number --->
        <cfswitch expression="#arguments.difficulty#">
            <cfcase value="2">
                <cfset local.game["maxNumber"] = 49>
            </cfcase>
            <cfcase value="3">
                <cfset local.game["maxNumber"] = 99>
            </cfcase>
            <cfdefaultcase>
                <cfset local.game["maxNumber"] = 9>
            </cfdefaultcase>
        </cfswitch>

        <cfset local.game["secretNumber"] = randrange(0,local.game.maxNumber)>

        <!--- return Game Object --->
        <cfreturn local.game>

    </cffunction>


</cfcomponent>


