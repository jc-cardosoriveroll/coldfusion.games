<cfcomponent>

	<cffunction name="init">
		<cfargument name="p1" hint="clientId for Player1 from websocket">
		<cfargument name="p2" hint="clientId for Player2 from websocket">

		<cfset this.game =
			{
				"id" : createUUID(),
				"p1" : arguments.p1,
				"p2" : arguments.p2,
				"turn" : "p1",
				"step" : 0,
				"p11" : "0",
				"p12" : "0",
				"p13" : "0",
				"p21" : "0",
				"p22" : "0",
				"p23" : "0",
				"p31" : "0",
				"p32" : "0",
				"p33" : "0"
			}>

		<cfreturn this>
	</cffunction>

	<cffunction name="pickcell" hint="will modify and return this.game object">
		<cfargument name="id" hint="id of game to make sure we only modify corresponding">
		<cfargument name="p" hint="id of the player that made the move">
		<cfargument name="cell" hint="position that was chosed by p">

		<cfset this.game["#arguments.cell#"] = arguments.p>
		<cfreturn this>
	</cffunction>

</cfcomponent>