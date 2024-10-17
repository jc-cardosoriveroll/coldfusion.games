<cfparam name="url.send" default="">
<cfif len(url.send)>
	<cfset wsPublish("game",url.send)>
</cfif>

<!---
https://github.com/GiancarloGomez/ColdFusion-Realtime-With-WebSockets/blob/master/Application.cfc
--->

<cfscript>
	// get our stats
	channels 	= wsGetAllChannels();
	subscribers = {};
	stats 		= {
		channels 		: channels.len(),
		clients 		: [],
		messages 		: application.publishedMessages,
		subscriptions 	: 0,
		timestamp 		: application.timestamp
	};
	for (channel in channels){
		subscribers[channel] = wsGetSubscribers(channel,true);
		stats.subscriptions += subscribers[channel].len();
		for (sub in subscribers[channel]){
			if (!arrayFind(stats.clients,sub.clientid))
				stats.clients.append(sub.clientid);
		}
	};
	// set to count
	stats.clients = stats.clients.len();
	// output as json
	writeOutput(serializeJSON(stats));
</cfscript>

<cfset data = wsGetSubscribers('websocket')>
<cfdump var="#data#">