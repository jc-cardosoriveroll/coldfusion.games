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

    console.log(data2.req);
    console.log(data2.reqType);

    /* Manage server response cases */
    if (data2.type == 'response'){
        switch (data2.reqType){
            case "welcome" :
                let data = getAsyncData("users");
                /* update user list */
                data.forEach(function(user) {
                    console.log(user);
                    const ulElement = document.getElementById('onlineUsers');
                    const liElement = document.createElement('li');
                    liElement.textContent = user.name;
                    ulElement.appendChild(liElement);
                });
            break; 
        }
    }

}

function unsubscribe(data){
    console.log(data);    
}

function getAsyncData(mode){
    switch (mode){
        case "users" :
            let data = [{"name" : "jc"},{"name" : "edith"}];
            return data;
        break;
    }

}