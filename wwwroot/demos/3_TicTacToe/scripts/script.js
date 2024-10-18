function parseMessage(message){
    // Always log to console raw check
    console.log(message);

    // Containers to store/display key user ID
    let clientid = document.getElementById("clientid");
    let publisherid = document.getElementById("publisherid");

    // Get ClientID to identify Self
    if (typeof message.clientid !== 'undefined') {
        clientid.innerHTML = message.clientid;  
    }
    // Get PublisherId to identify Sender
    if (typeof message.publisherid !== 'undefined') {
        if (message.publisherid !== 0){
            publisherid.innerHTML = message.publisherid;  
        }
    }

    // Manage Messages (core)    
    if (typeof message.type !== 'undefined'){

        // Server Events (system)
        if (message.type == 'response' && typeof message.reqType !== 'undefined') {
            switch (message.reqType){
                case "subscribeTo" : 
                    updateUserList();
                break;
            }
        }

        // Data Events (publishers)
        if (message.type == 'data' && typeof message.action !== 'undefined') {
            switch (message.action){
                case "refreshUsers" : 
                    updateUserList(); 
                break;
            }
        }
    }
}


// function to update User list with a "clickable" ID 
function updateUserList(){
    console.log("refreshing user list...");
    // always clear the list first 
    const ulElement = document.getElementById('onlineUsers');
    ulElement.textContent = '';
    // set container for remote async call
    let clientid = document.getElementById("clientid");
    $.get('remote/async.cfm?action=users', function(r) {
        let users = JSON.parse(r);
        users.forEach(function(user) {
            if (user.clientid != clientid.innerHTML)
            {
                // first make sure element doesn't alrady exist
                const ulElement = document.getElementById('onlineUsers');
                const valueToFind = user.clientid;
                const found = searchForValueInLI(ulElement, valueToFind);

                if (!found) {
                    // append element to list when not found (new)
                    const liElement = document.createElement('li');
                    liElement.textContent = user.clientid;                
                    liElement.setAttribute("onclick", "handleClick('" + user.clientid + "','start')");                
                    ulElement.appendChild(liElement);
                } 
            }
        });
    });
}


// Helper Function to see if a value is already in a "LI" list
function searchForValueInLI(listElement, valueToSearch) {
    const liElements = listElement.querySelectorAll('li');
    for (const li of liElements) {
      const liText = li.textContent.trim();
      if (liText === valueToSearch) { return true; }}
    return false;
}

function handleClick(target,action){
    alert("send invite to " + target + " to " + action + " the game...");
    ws.publish("websocket",action);
}
