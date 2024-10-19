// global variables 
window.clientid = 0; 
window.game = 
                {
                    "client1" : "0", "client2" : "0",
                    "p11" : "0", "p12" : "0", "p13" : "0",
                    "p21" : "0", "p22" : "0", "p23" : "0",
                    "p31" : "0", "p32" : "0", "p33" : "0",
                    "turn" : "0"
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
                updateUI();

                /* expect message.data = {"action" : "X", "game" : game} */
                switch (message.data.action){
                    case "newgame" : 
                        // let the other player know that I have joined and will play
                        window.game.client2 = window.clientid;
                        window.game.turn = message.data.client1;
                        msg = {"action" : "nextturn", "game" : window.game};
                        ws.publish("websocket",msg);                                                    
                    break;

                    case "nextturn" :
                        if (message.game.turn == window.clientid)
                        {
                            msg = {"action" : "nextturn", "game" : window.game};
                            ws.publish("websocket",msg);                                                    
                        }
                    break;
                }
        }
    }
}

function pick(pos){
    if (pos == "p11") { window.game.p11 == window.clientid; }
    if (pos == "p12") { window.game.p12 == window.clientid; }
    if (pos == "p13") { window.game.p13 == window.clientid; }
    if (pos == "p21") { window.game.p21 == window.clientid; }
    if (pos == "p22") { window.game.p22 == window.clientid; }
    if (pos == "p23") { window.game.p23 == window.clientid; }
    if (pos == "p31") { window.game.p31 == window.clientid; }
    if (pos == "p32") { window.game.p32 == window.clientid; }
    if (pos == "p33") { window.game.p33 == window.clientid; }
}

function enableUI(){
    var lobby = document.getElementById("lobby");
    lobby.className = "hidden";
    lobby.remove();

    var board = document.getElementById("board");
    board.className = "visible";
    centerDiv("board");
}

function updateUI()
{
    var p11 = document.getElementById("p11");
    var p12 = document.getElementById("p12");
    var p13 = document.getElementById("p13");
    var p21 = document.getElementById("p21");
    var p22 = document.getElementById("p22");
    var p23 = document.getElementById("p23");
    var p31 = document.getElementById("p31");
    var p32 = document.getElementById("p32");
    var p33 = document.getElementById("p33");

    if (window.game.p11 == window.game.client1) { deleteButton("p11"); insertImage("p11","X"); }
    if (window.game.p12 == window.game.client1) { deleteButton("p12"); insertImage("p12","X"); }
    if (window.game.p13 == window.game.client1) { deleteButton("p13"); insertImage("p13","X"); }
    if (window.game.p21 == window.game.client1) { deleteButton("p21"); insertImage("p21","X"); }
    if (window.game.p22 == window.game.client1) { deleteButton("p22"); insertImage("p22","X"); }
    if (window.game.p23 == window.game.client1) { deleteButton("p23"); insertImage("p23","X"); }
    if (window.game.p31 == window.game.client1) { deleteButton("p31"); insertImage("p31","X"); }
    if (window.game.p32 == window.game.client1) { deleteButton("p32"); insertImage("p32","X"); }
    if (window.game.p33 == window.game.client1) { deleteButton("p33"); insertImage("p33","X"); }

    if (window.game.p11 == window.game.client2) { deleteButton("p11"); insertImage("p11","O"); }
    if (window.game.p12 == window.game.client2) { deleteButton("p12"); insertImage("p12","O"); }
    if (window.game.p13 == window.game.client2) { deleteButton("p13"); insertImage("p13","O"); }
    if (window.game.p21 == window.game.client2) { deleteButton("p21"); insertImage("p21","O"); }
    if (window.game.p22 == window.game.client2) { deleteButton("p22"); insertImage("p22","O"); }
    if (window.game.p23 == window.game.client2) { deleteButton("p23"); insertImage("p23","O"); }
    if (window.game.p31 == window.game.client2) { deleteButton("p31"); insertImage("p31","O"); }
    if (window.game.p32 == window.game.client2) { deleteButton("p32"); insertImage("p32","O"); }
    if (window.game.p33 == window.game.client2) { deleteButton("p33"); insertImage("p33","O"); }

}

function insertImage(pos,image){
    cell = document.getElementById(pos);
    image = document.createElement('img');
    image.src = "/images/" + image + ".png";
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