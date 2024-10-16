<!--- Manage Game Events --->
<cfif isdefined("url.newGame")>
    <!--- Request a New Game --->
    <cfset structdelete(session,"game")>
</cfif>

<cfif isdefined("url.giveUp") and isdefined("session.game")>
    <!--- Give up, Show Number and Reset --->
    <cfoutput><script>alert("the number was: #session.game.secretNumber#" );</script> </cfoutput>  
    <cfset structdelete(session,"game")>
</cfif>

<cfif isdefined("url.difficulty")>
    <!--- difficulty has been provided, start a new game --->
    <cfset session.game = application.game.newGame(difficulty=url.difficulty)>
</cfif>

<cfif isdefined("session.game") and isdefined("url.guess")>
    <!--- Guess has been provided, update game object --->
    <cfset session.game = application.game.evalGuess(game=session.game,guess=url.guess)>
</cfif>


<!----------------- MAIN CONTENT ---------------->
<cfoutput>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Number Guessing</title>
    <meta charset="UTF-8">
    <!--- Bootstrap/Jquery framework --->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <cfif not(isdefined("session.game"))>
        <!--- Logic to start game --->
        <h1>New Game</h1>
        <ul>
            <li><a href="index.cfm?difficulty=1">EASY (0-9)</a></li>
            <li><a href="index.cfm?difficulty=2">MEDIUM (0-99)</a></li>
            <li><a href="index.cfm?difficulty=3">DIFFICULT (0-999)</a></li>
        </ul>
    <cfelse>
        <!--- Logic to Guess --->
        <h1>Guess!</h1>

        <cfif isdefined("session.game.currentState")>
            <h3>#session.game.currentState#</h3>
        </cfif>

        <div class="row">
            <cfloop from="0" to="#session.game.maxNumber#" index="n">
                <div class="col-1">
                    <cfif arrayfind(session.game.history,n)>
                        <span class="history">#n#</span>
                    <cfelse>
                        <span class="option"><a href="index.cfm?guess=#n#&uuid=#createUUID()#">#n#</a></span>
                    </cfif>
                </div>
            </cfloop>
        </div>
        <hr>
        <a href="index.cfm?newGame">New Game</a> | <cfif not(session.game.isDone)><a href="index.cfm?giveUp">Give Up</a></cfif>

    </cfif>

    <!--- Bootstrap/Jquery Framework --->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    
  </body>
</html>
</cfoutput>


<!--- Garbage Collector (if game is finish, destroy) --->
<cfif isdefined("session.game") and session.game.isDone>
    <cfset structdelete(session,"game")>
</cfif>    