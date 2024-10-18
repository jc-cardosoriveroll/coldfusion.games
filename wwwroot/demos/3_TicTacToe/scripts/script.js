function parseMessage(message){
    // Always log to console raw check
    console.log(message);

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
                    ws.publish("websocket","newgame");
                break;
            }
        } 

        // Data Events (publishers)
        if (message.type == 'data' && typeof message.data !== 'undefined') {
            switch (message.data){
                case "newgame" : 
                    if (message.publisherid !== clientid.innerHTML && 
                        message.publisherid !== "0" &&
                        clientid.innerHTML !== "")
                    { newgame(clientid.innerHTML,message.publisherid); }
                break;
            }
        }
    }
}

function newgame(p1,p2){
    //actual game is managed in CF Backend 

    const divToRemove = document.getElementById("lobby");
    const parentDiv = divToRemove.parentNode;
    parentDiv.removeChild(divToRemove);

    const game = document.getElementById("game");
    centerDiv("game");
    game.className = "visible";

    $.get( "remote/async.cfm?action=newgame&p1=" + p1 & "&p2=" + p2, function( data ) {
        console.log(data);
    });        
}

function centerDiv(divElement) {
    // Get the parent div's dimensions
    const parentWidth = divElement.parentElement.offsetWidth;
    const parentHeight = divElement.parentElement.offsetHeight;
  
    // Get the child div's dimensions
    const childWidth = divElement.offsetWidth;
    const childHeight = divElement.offsetHeight;
  
    // Calculate the top and left positions to center the child div
    const topPosition = (parentHeight - childHeight) / 2;
    const leftPosition = (parentWidth - childWidth) / 2;
  
    // Set the top and left properties of the child div
    divElement.style.position = 'absolute';
    divElement.style.top = topPosition + 'px';
    divElement.style.left = leftPosition + 'px';
  }