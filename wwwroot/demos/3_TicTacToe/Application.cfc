<!--- https://www.bennadel.com/blog/726-coldfusion-application-cfc-tutorial-and-application-cfc-reference.htm --->

<!--- "Handle the application." --->
<cfcomponent displayname="Application" output="true" >

    <!--- Set up the application. --->    
	<cfset THIS.Name = "app003" />
	<cfset THIS.ApplicationTimeout = CreateTimeSpan( 1, 0, 0, 0 ) />
	<cfset THIS.SessionManagement = true />
	<cfset THIS.SetClientCookies = true />
    <cfset THIS.serialization.preservecaseforstructkey = true />

	<!--- Websocket specific --->
    <cfset this.wschannels = [ 
		{ 	name: "websocket",  cfclistener: "components.listener" }  
	]>


    <!--- Define the page request properties. --->    
	<cfsetting
        requesttimeout="20"
		showdebugoutput="false"
		enablecfoutputonly="false"
    />

    <!--- "Fires when the application is first created." --->
	<cffunction name="OnApplicationStart" access="public" returntype="boolean" output="false">
        <!--- GAME SPECIFIC COMPONENT------------------->        
        <cfset application.timestamp                   = getHttpTimeString()>
        <cfset application.publishedMessages           = 0>
        <cfset application.publishedPreviousMessages   = 0>
        <cfset application.game					   	   = new components.game()>
        <!----------------------------------------------->
		<cfreturn true />
	</cffunction>

    <!--- "Fires when the session is first created." --->
	<cffunction name="OnSessionStart" access="public" returntype="void" output="false">
		<cfreturn />
	</cffunction>

    <!--- "Fires at first part of page processing." --->
	<cffunction name="OnRequestStart" access="public" returntype="boolean" output="false">
		<cfargument name="TargetPage" type="string" required="true"/>

		<cfif structKeyExists(url,"init")>
			onApplicationStart()>
            <!--- tell everyone to reconnect --->
			<!---
			<cfloop collection="#wsGetAllChannels()#" item="key">
				<cfset wsPublish(key,"FORCE-RECONNECT")>
			</cfloop>
			<cfset onApplicationStop()>
			<cflocation url="/" addtoken="false">
			--->
		</cfif>

		<cfreturn true />
	</cffunction>

    <!--- "Fires after pre page processing is complete." ---> 
	<cffunction name="OnRequest" access="public" returntype="void" output="true" >
		<cfargument name="TargetPage" type="string" required="true" />
		<cfinclude template="#ARGUMENTS.TargetPage#" />
		<cfreturn />
	</cffunction>

    <!--- "Fires after the page processing is complete." --->
	<cffunction name="OnRequestEnd" access="public" returntype="void" output="true">
		<cfreturn />
	</cffunction>

    <!--- "Fires when the session is terminated." --->
	<cffunction name="OnSessionEnd" access="public" returntype="void" output="false">
		<cfargument name="SessionScope" type="struct" required="true"/>
		<cfargument name="ApplicationScope" type="struct" required="false" default="#StructNew()#"/>
		<cfreturn />
	</cffunction>

    <!--- "Fires when the application is terminated." --->
	<cffunction name="OnApplicationEnd" access="public" returntype="void" output="false">
		<cfargument name="ApplicationScope" type="struct" required="false" default="#StructNew()#" />
		<cfreturn />
	</cffunction>

    <!--- "Fires when an exception occures that is not caught by a try/catch." --->
	<cffunction name="OnError" access="public" returntype="void" output="true">
		<cfargument name="Exception" type="any" required="true" />
		<cfargument name="EventName" type="string" required="false" default=""/>
		<cfdump var="#exception#" label="Oops...">
		<cfreturn />
	</cffunction>

</cfcomponent>