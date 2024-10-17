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

    /* case for Msg Types  */
    if (typeof data2.action !== 'undefined') {
        switch (data2.action) {
            case "newUser":
                alert("refresh the User List");
            break;
        }
    }
}

