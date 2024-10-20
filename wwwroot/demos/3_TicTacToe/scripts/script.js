// global variables 
window.clientid = 0; 
window.game = 
                {
                    "host" : "0",
                    "guest" : "0",
                    "history" : [],
                };
                /* history: [{clientid : "xxx", p : "11"}] */

//$.blockUI();
//enableUI();



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
                    window.game.host = window.clientid;
                    msg = {"action" : "newgame", "game" : window.game};
                    ws.publish("websocket",msg);
                    $.blockUI();
                break;
            }
        } 

        // Data Events (only attend messages from "other" publishers)
        if (message.type == 'data' && typeof message.data !== 'undefined') {

                /* expect message.data = {"action" : "X", "game" : game} */
                switch (message.data.action){
                    case "newgame" : 
                        if (message.publisherid !== window.clientid)
                            { $.unblockUI(); enableUI();}
                        else 
                            { $.blockUI(); }
                    break;

                    case "nextturn" :
                        if (message.publisherid !== window.clientid)
                            { $.unblockUI(); }
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
    window.game.history.push({newmove});
    // broadcast nextturn
    msg = {"action" : "nextturn", "game" : window.game};
    ws.publish("websocket",msg);
}



function enableUI(){
    // hide lobby
    var lobby = document.getElementById("lobby");
    lobby.className = "hidden";
    //center board
    const parentContainer = board.parentElement;
    const parentWidth = parentContainer.offsetWidth; const parentHeight = parentContainer.offsetHeight;
    const divWidth = board.offsetWidth; const divHeight = board.offsetHeight;
    const centerX = (parentWidth - divWidth) / 2; const centerY = (parentHeight - divHeight) / 2;
    board.style.position = 'absolute'; board.style.left = centerX + 'px'; board.style.top = centerY + 'px';
   // show board
   var board = document.getElementById("board");
   board.className = "visible";    
}


function insertImage(pos,image){
    //clear before cleaning.
    while (pos.firstChild) {
        pos.removeChild(pos.firstChild);
      }
    cell = document.getElementById(pos);
    image = document.createElement('img');
    image.src = "images/" + image + ".png";
    cell.appendChild(image);
}
