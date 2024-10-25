<cfcomponent>

    <!--------------- INIT CONTAINS ALL --------------->
    <cffunction name="init">
        <!--- Initial Parameters --->
        <cfparam name="arguments.category" default="Coding">
        <cfparam name="arguments.level" default="1">

        <!--- Set Global values --->
        <cfset this["data"] = {
            "category" : arguments.category,
            "level" : arguments.level,
            "miss" : [],
            "hits" : [],
            "show" : [],
            "gameOver" : false,
            "wonOrLost" : "None",
            "hangImg" : "images/step0.png" 
        }>

        <!--- Get Random Word --->
        <cfset this.data["word"] = getWord(level=this.data.level,category=this.data.category,qry=jsontoqry())>

        <!--- Return --->
        <cfreturn this>
    </cffunction>

    <!----------------- HELPER FUNCTIONS --------------->
    <cffunction name="getWord" access="private" hint="gets a word from query">
        <cfargument name="level" default="#this.data.level#">
        <cfargument name="category" default="#this.data.category#">
        <cfargument name="qry" default="#jsontoqry()#">

        <!--- return word --->
        <cfquery name="local.qry" dbtype="query">
            select w
            from arguments.qry 
            where l IN (<cfqueryparam value="#arguments.level#">)
            and c IN (<cfqueryparam value="#arguments.category#">)
        </cfquery>

        <cfset local.word = "">
        <cfif local.qry.recordcount gt 0>
            <cfset local.word = local.qry.w[randrange(1,local.qry.recordcount)]>
        </cfif>

        <cfreturn local.word>
    </cffunction>


    <cffunction name="jsontoqry" access="private" hint="reads json file and converts to query">
        <!--- Read source file --->
        <cffile variable="local.file" action="read" file="#expandpath('data/words.json')#" >
        <cfset local.data = deserializeJSON(local.file)>

        <!--- create new query to simplify data --->
        <cfset local.words = querynew("w,c,l","varchar,varchar,integer")>

        <cfloop from="1" to="#arraylen(local.data)#" index="local.f">
            <cfset local.item = local.data[local.f]>
            <cfset queryaddrow(local.words)>
            <cfset querysetcell(local.words,"w",trim(local.item.word))>
            <cfset querysetcell(local.words,"c",trim(local.item.category))>
            <cfset querysetcell(local.words,"l",local.item.level)>
        </cfloop>

        <cfreturn local.words>
    </cffunction>



</cfcomponent>