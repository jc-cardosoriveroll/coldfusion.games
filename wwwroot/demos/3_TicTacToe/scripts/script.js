// global variables 
window.clientid = 0; 
window.game = 
                {
                    "client1" : "0", "client2" : "0",
                    "p11" : "0", "p12" : "0", "p13" : "0",
                    "p21" : "0", "p22" : "0", "p23" : "0",
                    "p31" : "0", "p32" : "0", "p33" : "0"
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
                    window.game.client1 = window.clientid;
                    msg = {"action" : "newgame", "game" : window.game};
                    ws.publish("websocket",msg);
                    $.blockUI();
                break;
            }
        } 

        // Data Events (only attend messages from "other" publishers)
        if (message.type == 'data' && typeof message.data !== 'undefined') {
            if (window.clientid !== message.publisherid)
            {
                /* expect message.data = {"action" : "X", "game" : game} */
                switch (message.data.action){
                    case "newgame" : 
                        // let the other player know that I have joined and will play
                        window.game.client2 = window.clientid;
                        msg = {"action" : "nextturn", "game" : window.game};
                        console.log(msg);
                        enableUI();
                        //ws.publish("websocket",msg);                                                    
                    break;

                    case "nextturn" :
                        /*
                        $.unblockUI();
                        updateUI();    
                        enableUI();                           
                        alert("your turn");
                        */
                    break;
                }
            }
        }
    }
}



function enableUI(){
    var lobby = document.getElementById("lobby");
    lobby.className = "hidden";
    lobby.remove();

    var board = document.getElementById("board");
    board.className = "visible";
    centerDiv("board");

    $.unblockUI();    
}

function updateUI()
{
    $.ajax({
        method: "GET",
        url: "remote/async.cfm?action=getGame"
      })
    .done(function( msg ) {
        // New Struct Exists, save local identifier for future moves
        var go = JSON.parse(msg); 

        var p11 = document.getElementById("p11");
        var p12 = document.getElementById("p12");
        var p13 = document.getElementById("p13");
        var p21 = document.getElementById("p21");
        var p22 = document.getElementById("p22");
        var p23 = document.getElementById("p23");
        var p31 = document.getElementById("p31");
        var p32 = document.getElementById("p32");
        var p33 = document.getElementById("p33");

        if (go.game.p11 == go.game.p1) { deleteButton("p11"); insertImage("p11","X"); }
        if (go.game.p12 == go.game.p1) { deleteButton("p12"); insertImage("p12","X"); }
        if (go.game.p13 == go.game.p1) { deleteButton("p13"); insertImage("p13","X"); }
        if (go.game.p21 == go.game.p1) { deleteButton("p21"); insertImage("p21","X"); }
        if (go.game.p22 == go.game.p1) { deleteButton("p22"); insertImage("p22","X"); }
        if (go.game.p23 == go.game.p1) { deleteButton("p23"); insertImage("p23","X"); }
        if (go.game.p31 == go.game.p1) { deleteButton("p31"); insertImage("p31","X"); }
        if (go.game.p32 == go.game.p1) { deleteButton("p32"); insertImage("p32","X"); }
        if (go.game.p33 == go.game.p1) { deleteButton("p33"); insertImage("p33","X"); }

        if (go.game.p11 == go.game.p2) { deleteButton("p11"); insertImage("p11","O"); }
        if (go.game.p12 == go.game.p2) { deleteButton("p12"); insertImage("p12","O"); }
        if (go.game.p13 == go.game.p2) { deleteButton("p13"); insertImage("p13","O"); }
        if (go.game.p21 == go.game.p2) { deleteButton("p21"); insertImage("p21","O"); }
        if (go.game.p22 == go.game.p2) { deleteButton("p22"); insertImage("p22","O"); }
        if (go.game.p23 == go.game.p2) { deleteButton("p23"); insertImage("p23","O"); }
        if (go.game.p31 == go.game.p2) { deleteButton("p31"); insertImage("p31","O"); }
        if (go.game.p32 == go.game.p2) { deleteButton("p32"); insertImage("p32","O"); }
        if (go.game.p33 == go.game.p2) { deleteButton("p33"); insertImage("p33","O"); }

    });
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