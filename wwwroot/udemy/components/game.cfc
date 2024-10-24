<cfcomponent>
    <cffunction name="init">
        <cfreturn this>
    </cffunction>

    <cffunction name="newGame" access="public" hint="use this to start the game" returntype="struct">
        <cfargument name="difficulty" default="1" hint="1-3 easy-hard">

        <!--- Initialize Game --->
        <cfset local.game = {
                                "currentState" : "Start Guessing...",
                                "difficulty" : arguments.difficulty,
                                "history" : [],
                                "isDone" : false
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

    <cffunction name="evalGuess" access="public" hint="used to evaluate if num is higher, lower or equal">
        <cfargument name="game" type="struct" hint="current game object">
        <cfargument name="guess" type="numeric" hint="actual guess number">

        <!--- Make a local copy --->
        <cfset local.game = duplicate(arguments.game)>

        <!--- Evaluate by cases --->
        <cfif arguments.guess gt local.game.secretNumber>
            <cfset local.game["currentState"] = "LOWER than " & arguments.guess>
        <cfelseif arguments.guess lt local.game.secretNumber>
            <cfset local.game["currentState"] = "GREATER than " & arguments.guess>
        <cfelseif arguments.guess eq local.game.secretNumber>
            <cfset local.game["currentState"] = "BINGO in " & arraylen(local.game.history)+1 & " attempts">
            <cfset local.game["isDone"] = true>
        </cfif>

        <!--- Add Guess to History --->
        <cfset arrayappend(local.game.history,arguments.guess)>

        <!--- return --->
        <cfreturn local.game>
    </cffunction>


</cfcomponent>


