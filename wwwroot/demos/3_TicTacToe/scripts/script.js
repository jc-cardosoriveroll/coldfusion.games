function parseMessage(message){
    
    /* Make Message a Readable Json and send to console */
    var data1   = JSON.stringify(message).replace(/,"/g,',\n "').replace('{','{\n ').replace('}','\n}');
    console.log(data1);

    var data2 =   JSON.parse(data1);  /* use as obj */
    /* Get ClientID from Data to identify Self */
    if (typeof data2.clientid !== 'undefined') {
        let clientid = document.getElementById("clientid");
        clientid.innerHTML = data2.clientid;  
    }

    /* Manage server response cases */
    if (data2.type == 'response'){
        switch (data2.reqType){
            case "subscribeTo" :
                $.get('remote/async.cfm?action=users', function(r) {
                    let users = JSON.parse(r);
                    users.forEach(function(user) {
                        const ulElement = document.getElementById('onlineUsers');
                        const liElement = document.createElement('li');
                        liElement.textContent = user.name;
                        ulElement.appendChild(liElement);
                    });
                });
             
            break; 
        }
    }

}


function unsubscribe(data){
    console.log(data);    
}
