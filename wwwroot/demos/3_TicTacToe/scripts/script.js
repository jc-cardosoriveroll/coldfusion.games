function parseMessage(message){
    var data   = JSON.stringify(message).replace(/,"/g,',\n "').replace('{','{\n ').replace('}','\n}');
    console.log(data);
}

function updateLobby(message){
    alert(message);
}