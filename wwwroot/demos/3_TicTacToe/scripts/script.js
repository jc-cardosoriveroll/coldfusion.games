function parseMessage(message){
    // Always log to console raw check
    console.log(message);

    // Point to gameId to determine behaviour
    const game = document.getElementById("game");

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
                    if (game.id == "0")
                    { ws.publish("websocket","newgame"); }
                break;
            }
        } 

        // Data Events (publishers)
        if (message.type == 'data' && typeof message.data !== 'undefined') {
            switch (message.data){
                case "newgame" : 
                    if (game.id == "0")
                    {
                        if (message.publisherid !== clientid.innerHTML && 
                            message.publisherid !== "0" &&
                            clientid.innerHTML !== "")
                        { newgame(clientid.innerHTML,message.publisherid); }
                    }
                break;
            }
        }
    }
}

function newgame(p1,p2){
    //actual game is managed in CF Backend (state machine)
    const lobby = document.getElementById("lobby");
    lobby.className = "hidden";

    const board = document.getElementById("board");
    board.className = "visible";

    const game = document.getElementById("game");


    $.ajax({
        method: "GET",
        url: "remote/async.cfm?init=true&action=newgame&p1=" + p1 + "&p2=" + p2
      })
        .done(function( msg ) {
            // New Struct Exists, save local identifier for future moves
            let go = JSON.parse(msg).game; 
            //Now that we have set game ID we can start ping-pong
            game.innerHTML = go.id;              
        });
}