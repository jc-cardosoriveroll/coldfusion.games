function parseMessage(message){
    var data   = JSON.stringify(message).replace(/,"/g,',\n "').replace('{','{\n ').replace('}','\n}');
    document.getElementById("console").innerHTML = data;
}

