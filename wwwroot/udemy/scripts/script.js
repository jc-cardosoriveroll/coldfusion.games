// global variables 
window.clientid = 0; 
window.game =   { "guest" : "0", "history" : [] };


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
                    ws.publish("websocket2",msg);
                    enableUI();
                    $.blockUI();
                break;
            }
        } 

    };


}



function enableUI(){
    // destroy lobby
    var lobby = document.getElementById("lobby");
    lobby.remove();
    // show board
    var board = document.getElementById("board");
    board.className = "visible";    
}