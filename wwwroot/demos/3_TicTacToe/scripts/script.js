// global variables 
window.clientid = 0; 
window.game =   {
                    "guest" : "0",
                    "history" : [],
                };

function parseMessage(message){
    // Always log to console raw check
    //console.log(message);

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

                switch (message.data.action){
                    case "play" : 
                        // UPDATE DATA
                        window.game = message.data.game;

                        // DRAW BOARD
                        for (const elem of window.game.history) {
                            cell = window.document.getElementById(elem.pos);
                            if (elem.clientid == window.game.guest){
                                cell.innerHTML = "<img src='images/O.png' />";}
                            else {
                                cell.innerHTML = "<img src='images/X.png' />";}
                        };

                        // EVALUATE WIN
                        let temp = {"p11" : 0, "p12" : 0, "p13" : 0, "p21" : 0, "p22" : 0, "p23" : 0, "p31" : 0, "p32" : 0, "p33" : 0};
                        for (const elem of window.game.history) { 
                            temp[elem.pos] = elem.clientid };
                        console.log(temp);

                        // ENABLE UI BASED ON TURN
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
    // destroy lobby
    var lobby = document.getElementById("lobby");
    lobby.remove();
    // show board
    var board = document.getElementById("board");
    board.className = "visible";    
}
