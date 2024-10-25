<cfcomponent>
    <cffunction name="init">
        <!---- Parameters --->
        <cfparam name="arguments.category" default="Coding">
        <cfparam name="arguments.level" default="1">

        <!--- Set Global Values --->
        <cfset this["data"] = {
                "category" : arguments.category,
                "level" : arguments.level,
                "miss" : []
                "hits" : []
                "show" : []
                "word" : "HELLOWORLD",
                "gameOver" : false,
                "wonOrLost" : "None",
                "hangImg" : "images/step0.png"
            }>

        <cfreturn this>
    </cffunction>
</cfcomponent>