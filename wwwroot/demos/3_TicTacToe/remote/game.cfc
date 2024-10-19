<cfcomponent>

	<cffunction name="init">
		<cfreturn this>
	</cffunction>

	<cffunction name="newgame">
		<cfargument name="p1" hint="clientId for Player1 from websocket">
		<cfargument name="p2" hint="clientId for Player2 from websocket">

		<cfset local.game =
			{
				"id" : createUUID(),
				"p1" : arguments.p1,
				"p2" : arguments.p2,
				"turn" : arguments.p1,
				"step" : 0,
				"p11" : "0",
				"p12" : "0",
				"p13" : "0",
				"p21" : "0",
				"p22" : "0",
				"p23" : "0",
				"p31" : "0",
				"p32" : "0",
				"p33" : "0",
				"state" : "newgame"
			}>
		<cfreturn local.game>
	</cffunction>


	<cffunction name="pickcell" hint="will modify and return this.game object">
		<cfargument name="game" hint="current game object (sent across websocket)">
		<cfargument name="id" hint="id of game to make sure we only modify corresponding">
		<cfargument name="p" hint="id of the player that made the move">
		<cfargument name="cell" hint="position that was chosed by p">

		<!--- Some validations to drive game, this is the core engine --->

		<!--- 1) game does not exist (reset game)--->
		<cfif (arguments.game.p1 neq arguments.p) and (arguments.game.p2 neq arguments.p)>
			<cfset this.state = "reset">
			<cfreturn this> 
		</cfif>

		<!--- 2) It is not the player's turn --->
		<cfif not(isTurn(p))><cfreturn arguments.game></cfif>		

		<!--- Great! All checks passed - Set the cell(s) value --->
		<cfset arguments.game["state"] = "nextturn">
		<cfset changePlayer()>
		<cfset arguments["#arguments.cell#"] = arguments.p>

		<!--- Finally, if all moves have happened, change the state --->

		<cfreturn this>
	</cffunction>

	<cffunction name="isTurn" access="private">
		<cfargument name="game">
		<cfargument name="p">

		<cfif arguments.game.turn eq arguments.p>
			<cfreturn true>
		</cfif>
		<cfreturn false>
	</cffunction>


	<cffunction name="changePlayer" access="private">
		<cfargument name="game">
		<cfif arguments.game.turn eq arguments.p1>
			<cfset arguments.game.turn = arguments.game.p2>
		<cfelse>
			<cfset arguments.game.turn = arguments.game.p1>
		</cfif>
	</cffunction>

</cfcomponent>