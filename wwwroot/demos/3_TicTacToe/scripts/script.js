function parseMessage(message){
    /* Make Message a Readable Json */
    var data1   = JSON.stringify(message).replace(/,"/g,',\n "').replace('{','{\n ').replace('}','\n}');
    let console = document.getElementById("console");
    console.innerHTML = data1;
    /* Get ClientID from Data to identify Self */
    var data2 = JSON.parse(data1);
    let clientid = document.getElementById("clientid");
    clientid.value = data2.clientid;  
    /* we also have publisherid to connect sender */
}

