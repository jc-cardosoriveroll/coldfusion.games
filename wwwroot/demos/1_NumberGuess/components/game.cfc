<cfcomponent>
    <cffunction name="init">
        <cfreturn this>
    </cffunction>
    
    <cffunction name="newGame" access="public" hint="Start a new Game" returntype="struct">
        <cfargument name="difficulty" default="1" type="numeric" hint="1: 1 digit, 2: 2 digits, 3: 3 digits">

        <!--- Initialize Game --->
        <cfset local.game = {"currentState" : "Start Guessing...",
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

        <!--- Return Game Data --->
        <cfreturn local.game>

    </cffunction>

    <cffunction name="evalGuess" access="public" hint="eval guess and update game object">
        <cfargument name="game" type="struct" hint="current game object">
        <cfargument name="guess" type="numeric" hint="value guessed by player">

        <!--- Make a local copy of Game Object --->
        <cfset local.game = duplicate(arguments.game)>

        <!--- Evaluate by cases (to return a current msg) --->
        <cfif arguments.guess gt local.game.secretNumber>
            <!--- Higher --->
            <cfset local.game["currentState"] = "LOWER than " & arguments.guess >
        <cfelseif arguments.guess lt local.game.secretNumber>
            <!--- Lower --->
            <cfset local.game["currentState"] = "HIGHER than " & arguments.guess >
        <cfelseif arguments.guess eq local.game.secretNumber>
            <!--- Bingo! --->
            <cfset local.game["currentState"] = "BINGO! in " & arraylen(local.game.history)+1 & " attempts">
            <cfset local.game["isDone"] = true>
        </cfif>

        <!--- Add Guess to History --->
        <cfset arrayappend(local.game.history,arguments.guess)>

        <!--- return updated game object --->
        <cfreturn local.game>

    </cffunction>

</cfcomponent>