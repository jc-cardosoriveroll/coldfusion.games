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
				"pxy" :
					[
						{"p11" : "0"},
						{"p12" : "0"},
						{"p13" : "0"},
						{"p21" : "0"},
						{"p22" : "0"},
						{"p23" : "0"},
						{"p31" : "0"},
						{"p32" : "0"},
						{"p33" : "0"}
					]
			}>

		<cfreturn this>
	</cffunction>

</cfcomponent>