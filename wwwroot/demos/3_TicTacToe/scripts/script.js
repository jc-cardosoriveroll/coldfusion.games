window.gameid = document.getElementById("gameid").value;
window.clientid = document.getElementById("clientid").value;


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
                    ws.publish("websocket","newgame");
                    $.blockUI();
                break;
            }
        } 

        // Data Events (only attend messages from "other" publishers: alt selectors)
        if (message.type == 'data' && typeof message.data !== 'undefined') {
            if (message.publisherid !== window.clientid && 
                message.publisherid !== "0" &&
                window.clientid !== "")
                {
                    switch (message.data){
                        case "newgame" : 
                            newgame(window.clientid,message.publisherid);
                        break;

                        case "nextturn" :
                            $.unblockUI();
                            updateUI();    
                            enableUI();                           
                            alert("your turn");
                        break;
                    }
                }
            }
        }
}

function newgame(p1,p2){
    enableUI();
    $.ajax({
        method: "GET",
        url: "remote/async.cfm?init=true&action=newgame&p1=" + p1 + "&p2=" + p2
      })
        .done(function( msg ) {
            // New Struct Exists, save local identifier for future moves
            var go = JSON.parse(msg).game; 
            window.gameid = go.id;             
        });
}


function pick(cell)
{
    $.ajax({
        method: "GET",
        url: "remote/async.cfm?action=pickcell&id=" + window.gameid + "&cell=" + cell + "&p=" + window.clientid
      })
        .done(function( msg ) {
            var go = JSON.parse(msg).game; 
            updateUI(go);
            ws.publish("websocket",go.state);
            $.blockUI();
        });
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

function updateUI(game)
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