function parseMessage(message){
    // Always log to console raw check
    console.log(message);

    // Containers to store/display key user ID
    let clientid = document.getElementById("clientid");

    // Get ClientID to identify Self
    if (typeof message.clientid !== 'undefined') {
        clientid.innerHTML = message.clientid;  
    }

    // Manage Messages (core)    
    if (typeof message.type !== 'undefined'){

        // Server Events (system)
        if (message.type == 'response' && typeof message.reqType !== 'undefined') {
            switch (message.reqType){
                case "subscribeTo" : 
                    //now that I subscribed, broadcast "newgame" to join available game..
                    ws.publish("websocket","newgame");
                break;
            }
        } 

        // Data Events (publishers)
        if (message.type == 'data' && typeof message.data !== 'undefined') {
            switch (message.data){
                case "newgame" : 
                    if (message.publisherid !== clientid.innerHTML)
                    { newgame(clientid.innerHTML,message.publisherid); }
                break;
            }
        }
    }
}

function newgame(id1,id2){
        //actual game is managed in CF Backend 
        $.get( "remote/async.cfm?action=newgame", function( data ) {
            console.log(data);
        });        
}