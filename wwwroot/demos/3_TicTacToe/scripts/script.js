function parseMessage(message){
    
    /* Make Message a Readable Json and send to console */
    var data1   = JSON.stringify(message).replace(/,"/g,',\n "').replace('{','{\n ').replace('}','\n}');
    console.log(data1);

    var data2 =   JSON.parse(data1);  /* use as obj */
    /* Get ClientID from Data to identify Self */
    if (typeof data2.clientid !== 'undefined') {
        let clientid = document.getElementById("clientid");
        clientid.value = data2.clientid;  
    }

    /* Get PublisherId from Data to identify Source */
    if (typeof data2.publisherid !== 'undefined') {
        let publisherid = document.getElementById("publisherid");
        publisherid.value = data2.publisherid;  
    }

    /* case for Msg Types 
    switch (expression) {
        case value1:

        break;
    }*/
}

