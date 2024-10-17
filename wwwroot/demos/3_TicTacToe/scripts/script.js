function parseMessage(message){
    var data   = JSON.stringify(message).replace(/,"/g,',\n "').replace('{','{\n ').replace('}','\n}');
    document.getElementById("console").innerHTML = data;
}

ws.onopen = function() {
    console.log('WebSocket connection opened with ID:', clientId);
  };