// global variables 
window.clientid = 0; 
window.game =   {
                    "guest" : "0",
                    "history" : [],
                };

function parseMessage(message){
    // Always log to console raw check
    console.log(message);

    // Get ClientID to identify Self
    if (typeof message.clientid !== 'undefined') {
        window.clientid = message.clientid;  
    }

    // Manage Messages (core)    
    if (typeof message.type !== 'undefined'){

        // Server Events (system)
        if (message.type == 'response' && typeof message.reqType !== 'undefined') {
            switch (message.reqType){
                case "subscribeTo" : 
                    //now that I subscribed, broadcast "newgame" to join available game..
                    window.game.guest = window.clientid;
                    msg = {"action" : "play", "game" : window.game};
                    ws.publish("websocket",msg);
                    enableUI();
                    $.blockUI();
                break;
            }
        } 

        // Data Events (only attend messages from "other" publishers)
        if (message.type == 'data' && typeof message.data !== 'undefined') {

                /* expect message.data = {"action" : "X", "game" : game} */
                switch (message.data.action){
                    case "play" : 
                        window.game = message.data.game;
                        
                        for (const elem of window.game.history) {
                            console.log(JSON.stringify(elem));
                        };

                        if (message.publisherid !== window.clientid)
                            {  $.unblockUI(); }
                        else 
                            { $.blockUI(); }
                    break;

                }
        }
    }
}


function pick(pos){
    // add to history array    
    let newmove = {"clientid" : window.clientid, "pos" : pos};
    window.game.history.push(newmove);
    // broadcast nextturn
    msg = {"action" : "play", "game" : window.game};
    ws.publish("websocket",msg);
}


function enableUI(){
    // hide lobby
    var lobby = document.getElementById("lobby");
    lobby.className = "hidden";
   // show board
   var board = document.getElementById("board");
   board.className = "visible";    
}
