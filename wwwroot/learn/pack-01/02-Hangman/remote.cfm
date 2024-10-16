<cfparam name="url.letter"> <!--- new guess --->

<!--- Run function to determin which positions to show --->
<cfset application.game.playGame(letter=url.letter)>
<cfoutput>#serializeJSON(application.game)#</cfoutput>