function parseMessage(message){
    // Always log to console raw check
    console.log(message);

    // Containers to store/display key user ID
    let clientid = document.getElementById("clientid");
    let publisherid = document.getElementById("publisherid");

    // Get ClientID to identify Self
    if (typeof message.clientid !== 'undefined') {
        clientid.innerHTML = message.clientid;  
    }
    // Get PublisherId to identify Sender
    if (typeof message.publisherid !== 'undefined') {
        if (message.publisherid !== 0){
            publisherid.innerHTML = message.publisherid;  
        }
    }

    // Manage Messages (core)    
    if (typeof message.type !== 'undefined'){

        // Server Events (system)
        if (message.type == 'response' && typeof message.reqType !== 'undefined') {
            switch (message.reqType){
                case "subscribeTo" : 
                    //now that I subscribed, broadcast I wan't to play...
                    ws.publish("websocket","play!");
                break;
            }
        } 

        // Data Events (publishers)
        if (message.type == 'data' && typeof message.action !== 'undefined') {
            switch (message.action){
                case "xxx" : 

                break;
            }
        }
    }
}

