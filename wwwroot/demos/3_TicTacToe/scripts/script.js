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

        // Data Events (publishers)
        if (message.type == 'data' && typeof message.action !== 'undefined') {
            switch (message.action){
                case "newGame" : 
                    alert("new game, with...");
                break;
            }
        }
    }
}

