<!--- New normal game --->
<cfif isdefined("url.difficulty")>
    <cfset session.game = Application.game.newGame(difficulty=url.difficulty)>
</cfif>

<!--- New forced game (delete existing) --->
<cfif isdefined("url.newGame") and isdefined("session.game")>
    <cfset structdelete(session,"game")>
    <cflocation url="index.cfm" addtoken="false">
</cfif>

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

                        <!--- MAIN --->
                        <cfif not(isdefined("session.game"))>
                            <!---new game options--->
                            <h1>New Game</h1>
                            <br><a href="index.cfm?difficulty=1" class="btn btn-success">Easy (0-9)</a></li>
                            <br><a href="index.cfm?difficulty=2" class="btn btn-warning">Medium (0-49)</a></li>
                            <br><a href="index.cfm?difficulty=3" class="btn btn-danger">Hard (0-99)</a></li>
                        <cfelse>
                            <!--- keep playing--->

                            <div class="unit">
                                <cfloop from="0" to="#session.game.maxNumber#" index="n">
                                    <cfif arrayfind(session.game.history,n)>
                                        <cfif n eq session.game.secretNumber>
                                            <span class="bingo">#n#</span>
                                        <cfelse>
                                            <span class="history">#n#</span>
                                        </cfif>
                                    </cfif>
                                </cfloop>
                            </div>


                            <a href="index.cfm?newGame">New Game</a>

                        </cfif>            
                    </div>
                </div>
            </div>

            <!--- Bootstrap/Jquery Framework --->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
      </body>
    </html>
    </cfoutput>