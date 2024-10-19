// global variables 
window.clientid = 0; 
window.game = 
                {
                    "client1" : "0", "client2" : "0",
                    "history" : [],
                };
                /* history: [{clientid : "xxx", p : "11"}] */

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
                    window.game.client1 = window.clientid;
                    msg = {"action" : "newgame", "game" : window.game};
                    ws.publish("websocket",msg);
                    $.blockUI();
                    enableUI();
                break;
            }
        } 

        // Data Events (only attend messages from "other" publishers)
        if (message.type == 'data' && typeof message.data !== 'undefined') {
                $.unblockUI();

                /* expect message.data = {"action" : "X", "game" : game} */
                switch (message.data.action){
                    case "newgame" : 
                        // let the other player know that I have joined and will play
                        window.game.client2 = window.clientid;
                        msg = {"action" : "nextturn", "game" : window.game};
                        ws.publish("websocket",msg);                                                    
                    break;

                    case "nextturn" :
                        if (window.game.history.length == 0)
                        {
                            if (window.game.clientid == window.clientid)
                            {
                                alert("start game");
                            }
                            else
                            {
                                alert("not your turn");
                            }
                        }
                        else
                        {
                            lastmove = window.game.history[window.game.history.length - 1];
                            alert("last move:" & JSON.stringify(lastmove));
                        }
                        //msg = {"action" : "nextturn", "game" : window.game};
                    break;
                }
        }
    }
}

function pick(pos){
    let newmove = {"clientid" : window.clientid, "pos" : pos};
    window.game.history.push({newmove});
}


function enableUI(){
    var lobby = document.getElementById("lobby");
    lobby.className = "hidden";
    lobby.remove();

    var board = document.getElementById("board");
    board.className = "visible";
    centerDiv("board");
}


function insertImage(pos,image){
    cell = document.getElementById(pos);
    image = document.createElement('img');
    image.src = "images/" + image + ".png";
    cell.appendChild(image);
}

function deleteButton(divElement) {
    while (divElement.firstChild) {
      divElement.removeChild(divElement.firstChild);
    }
  }

function centerDiv(div) {
    const divElement = document.getElementById(div); // Replace 'myDiv' with the actual ID of your <div>
    const parentContainer = divElement.parentElement;
    const parentWidth = parentContainer.offsetWidth; const parentHeight = parentContainer.offsetHeight;
    const divWidth = divElement.offsetWidth; const divHeight = divElement.offsetHeight;
    const centerX = (parentWidth - divWidth) / 2; const centerY = (parentHeight - divHeight) / 2;
    divElement.style.position = 'absolute'; divElement.style.left = centerX + 'px'; divElement.style.top = centerY + 'px';
  }