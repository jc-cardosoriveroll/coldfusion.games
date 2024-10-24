<!--- Select difficulty for new game --->
<cfif isdefined("url.difficulty")>
    <cfset session.game = Application.game.newGame(difficulty=url.difficulty)>
</cfif>

<!--- Evaluate player's guess --->
<cfif isdefined("url.guess") and isdefined("session.game")>
    <cfset session.game = Application.game.evalGuess(game=session.game,guess=url.guess)>
</cfif>

<!--- User wants a new game --->
<cfif isdefined("url.newGame") and isdefined("session.game")>
    <cfset structDelete(session,"game")>    
    <cflocation url="index.cfm?uuid=#createUUID()#" addtoken="false">
</cfif>

<!--- User gives up --->
<cfif isdefined("url.giveUp") and isdefined("session.game")>
    <cfoutput><script>alert("the number was: #session.game.secretNumber#");</script></cfoutput>
    <cfset structDelete(session,"game")>    
    <cflocation url="index.cfm?uuid=#createUUID()#" addtoken="false">
</cfif>


<!----------------- MAIN CONTENT ---------------->
<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
      <head>
            <title>Number Guess</title>
            <meta charset="UTF-8">
            <!--- Bootstrap/Jquery framework --->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
            <link rel="stylesheet" href="styles/style.css?uuid=#createUUID()#">
        </head>
        <body>
        <div class="card">
            <div class="card-body">
                <div class="card-window">
                    <!------ MAIN ----->
                    <cfif not(isdefined("session.game"))>
                        <!--- Logic to start game --->
                        <h1>New Game</h1>
                        <br><a href="index.cfm?difficulty=1" class="btn btn-success levels">EASY (0-9)</a>
                        <br><a href="index.cfm?difficulty=2" class="btn btn-warning levels">MEDIUM (0-49)</a>
                        <br><a href="index.cfm?difficulty=3" class="btn btn-danger levels">DIFFICULT (0-100)</a>
                    <cfelse>
                        <!--- Logic to Guess --->
                        <cfif isdefined("session.game.currentState")>
                            <div class="hint">
                                <h3>#session.game.currentState#</h3>
                            </div>
                        </cfif>
    
                        <div class="row">
                        <cfloop from="0" to="#session.game.maxNumber#" index="n">
                            <div class="unit">
                                <cfif arrayfind(session.game.history,n)>
                                    <cfif n eq session.game.secretNumber>
                                        <span class="bingo">#n#</li>
                                    <cfelse>
                                        <span class="history">#n#</li>
                                    </cfif>
                                <cfelse>
                                    <span class="active"><a href="index.cfm?guess=#n#&uuid=#createUUID()#">#n#</a></span>
                                </cfif>
                            </div>
                        </cfloop>
                        </div>
    
                        <hr>
                        <a href="index.cfm?newGame">New Game</a> <cfif not(session.game.isDone)> | <a href="index.cfm?giveUp">Give Up</a></cfif>
    
                    </cfif>
                </div>
            </div>
            <span class="love">Built with &hearts; by JC. Learn more in our <a href="https://www.udemy.com/course/desarrollo-apps-en-adobe-coldfusion/">Coldfusion Courses.</a></span>
        </div>
    
        <!--- Bootstrap/Jquery Framework --->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        
      </body>
    </html>
    </cfoutput>

