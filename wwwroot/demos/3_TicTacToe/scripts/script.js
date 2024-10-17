function parseMessage(message){
    
    /* Make Message a Readable Json and send to console */
    var data   = JSON.parse(message);

    let clientid = document.getElementById("clientid");
    /* Get ClientID from Data to identify Self */
    if (typeof data.clientid !== 'undefined') {
        clientid.innerHTML = data.clientid;  
    }

    /* Manage "server" response cases */
    if (data.type == 'response'){
        switch (data.reqType){
            case "subscribeTo" : updateUserList(); break; 
        }
    }

    console.log(data);

}

function updateUserList(){
    let clientid = document.getElementById("clientid");
    $.get('remote/async.cfm?action=users', function(r) {
        let users = JSON.parse(r);
        users.forEach(function(user) {
            if (user.clientid != clientid.innerHTML)
            {
                const ulElement = document.getElementById('onlineUsers');
                const liElement = document.createElement('li');
                liElement.textContent = user.clientid;
                liElement.id = user.clientid;
                ulElement.appendChild(liElement);
            }
        });
    });
}