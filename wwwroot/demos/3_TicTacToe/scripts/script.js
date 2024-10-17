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
    if (data2.req == 'response'){
        switch (data2.reqType){
            case "welcome" :
                /* just subscribed, get a list of connected users */
                alert("hello!");
            break;
        }
    }

}

function unsubscribe(){
    ws.unsubscribe( "websocket" );
}
