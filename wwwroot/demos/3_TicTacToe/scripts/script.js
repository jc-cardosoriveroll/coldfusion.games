function parseMessage(message){
    var data1   = JSON.stringify(message).replace(/,"/g,',\n "').replace('{','{\n ').replace('}','\n}');
    let console = document.getElementById("console");
    console.innerHTML = data1;

    var data2 = JSON.parse(message);
    let clientid = document.getElementById("clientid");
    clientid.value = data2.clientid;  
}

