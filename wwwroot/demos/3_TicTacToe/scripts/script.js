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
                /* just subscribed, let the other's know */
                ws.publish( "websocket", "here I am" );            
            break;
        }
    }

}

function unsubscribe(data){
    console.log(data);    
}
