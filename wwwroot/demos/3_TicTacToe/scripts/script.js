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



function centerDiv(div) {
    const divElement = document.getElementById(div); // Replace 'myDiv' with the actual ID of your <div>
    const parentContainer = divElement.parentElement;
    const parentWidth = parentContainer.offsetWidth; const parentHeight = parentContainer.offsetHeight;
    const divWidth = divElement.offsetWidth; const divHeight = divElement.offsetHeight;
    const centerX = (parentWidth - divWidth) / 2; const centerY = (parentHeight - divHeight) / 2;
    divElement.style.position = 'absolute'; divElement.style.left = centerX + 'px'; divElement.style.top = centerY + 'px';
  }