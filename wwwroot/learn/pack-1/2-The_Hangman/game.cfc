<cfcomponent>
    <!--------------- INIT CONTAINS ALL --------------->
    <cffunction name="init">
        <!--- Initial Parameters --->
        <cfparam name="arguments.category" default="Coding">
        <cfparam name="arguments.level" default="1">

        <!--- Set Image Paths --->
        <cfset this["paths"] = {
            "hang" : "images/steps",
            "large" : "images/letters/480px",
            "small" : "images/letters/24px"
        }>

        <!--- Set Global values --->
        <cfset this["data"] = {
            "category" : arguments.category,
            "level" : arguments.level,
            "miss" : [],
            "hits" : [],
            "show" : [],
            "gameOver" : false,
            "wonOrLost" : "None",
            "hangImg" : this.paths.hang & "/step0.png" 
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
        <cffile variable="local.file" action="read" file="#expandpath('words.json')#" >
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

    <!--------------- PLAYGAME FUNCTIONS ---------------->
    <cffunction name="playGame" access="remote" hint="updates this with eval values">
        <cfargument name="letter" hint="new letter">

        <!--- Update "this" with letter history --->
        <cfset evalHitMiss(letter=arguments.letter)>

        <!--- Update "this" with position display --->
        <cfset evalShow()>

        <!--- Update "this" with status/gameOver --->
        <cfset evalStatus()>

        <!--- Update "this" with hangImage --->
        <cfset evalHangImg()>        

        <cfreturn />
    </cffunction>

    <cffunction name="evalHitMiss" access="private" hint="evals if letter hits or misses word">
        <cfargument name="letter">

        <!--- Check if Letter is hit/miss --->
        <cfif findnocase(arguments.letter,this.data.word)>
            <cfif not(arrayfind(this.data.hits,arguments.letter))>
                <!--- New Unique Hit --->
                <cfset arrayappend(this.data.hits,arguments.letter)>
            </cfif>
        <cfelse>
            <cfif not(arrayfind(this.data.miss,arguments.letter))>
                <!--- New Unique Miss --->
                <cfset arrayappend(this.data.miss,arguments.letter)>
            </cfif>                
        </cfif>

        <!--- Sort --->
        <cfset arraysort(this.data.hits,"textnocase","ASC")>
        <cfset arraysort(this.data.miss,"textnocase","ASC")>

        <cfreturn>
    </cffunction>

    <cffunction name="evalShow" access="private" hint="updates with display images">
        <cfset local.show = []>
        <cfloop from="1" to="#len(this.data.word)#" index="local.w">
            <cfset local.thisLetter = mid(this.data.word,local.w,1)>
            <cfset local.show[local.w] =  this.paths.large & "/0_hires.png"> <!--- default null --->
            <cfif arrayfindnocase(this.data.hits,local.thisLetter)>
                <cfset local.show[local.w] = this.paths.large & "/" & local.thisLetter & "_hires.png">
            </cfif>
        </cfloop>
        <cfset this.data.show = local.show>
    </cffunction>

    <cffunction name="evalStatus" access="private" hint="updates with status">
        <cfif arraylen(this.data.miss) gte 8>
            <!--- check fail first --->
            <cfset this.data.gameOver = true>
            <cfset this.data.wonOrLost = "LOST">
        <cfelse>
            <!--- check win --->
            <cfif arraylen(this.data.hits) eq len(this.data.word)>
                <cfset this.data.gameOver = true>
                <cfset this.data.wonOrLost = "WIN">
            </cfif>
        </cfif>
        <cfreturn />
    </cffunction>

    <cffunction name="evalHangImg" access="private" hint="updates the image to display">
        <cfset this.data.hangImg = this.paths.hang & "/step" & arraylen(this.data.miss) & ".png">
        <cfreturn />
    </cffunction>

    <!------------- PUBLIC CATALOGS -------------------->
    <cffunction name="getAllCategories" access="public" returntype="any" hint="returns unique categories from json">
        <cfargument name="qry" default="#jsontoqry()#">

        <!--- return categories --->
        <cfquery name="local.qry" dbtype="query">
            select c
            from arguments.qry 
            order by c
        </cfquery>

        <cfset local.result = []>
        <cfloop query="local.qry">
            <cfif not(arrayfind(local.result,c))>
                <cfset arrayappend(local.result,c)>
            </cfif>
        </cfloop>

        <cfreturn local.result>
    </cffunction>

    <cffunction name="getAllLetters" access="public" returntype="array" hint="returns alphabet">
        <cfreturn ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]>
    </cffunction>

</cfcomponent>