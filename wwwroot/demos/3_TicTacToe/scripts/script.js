function parseMessage(message){
    

    let clientid = document.getElementById("clientid");
    /* Get ClientID from Data to identify Self */
    if (typeof message.clientid !== 'undefined') {
        clientid.innerHTML = message.clientid;  
    }

    /* Manage "server" response cases */
    if (message.type == 'response'){
        switch (message.reqType){
            case "subscribeTo" : updateUserList(); break; 
        }
    }

    /* Manage "user" message cases */
    if (message.type == 'data'){
        let other = message.data.subscriberInfo;
        switch (message.data.action){
            case "allowSubscribe" : updateUserList(); break; 
        }
    }

    console.log(message);
}

function updateUserList(){
    clearUserList();
    let clientid = document.getElementById("clientid");
    debounce(function() {
        $.get('remote/async.cfm?action=users', function(r) {
            let users = JSON.parse(r);
            users.forEach(function(user) {
                if (user.clientid != clientid.innerHTML)
                {
                    const ulElement = document.getElementById('onlineUsers');
                    const liElement = document.createElement('li');
                    liElement.textContent = user.clientid;                
                    liElement.id = user.clientid;
                    liElement.setAttribute("onclick", "handleClick('" + user.clientid + "')");                
                    ulElement.appendChild(liElement);
                }
            });
        });
    }, 250);        
    console.log("contacts updated");
}

function clearUserList(){
    const ulElement = document.getElementById('onlineUsers');
    ulElement.textContent = '';
}

function handleClick(id){
    alert(id);
}

function copyToClipboard() {
  const divToCopy = document.getElementById("divToCopy");
  const tempElement = document.createElement("textarea");
  tempElement.value = divToCopy.innerHTML;
  document.body.appendChild(tempElement);
  tempElement.select();
  document.execCommand("copy");
  document.body.removeChild(tempElement);
  alert("copied");
}

// https://davidwalsh.name/javascript-debounce-function
function debounce(func, wait, immediate) {
    var timeout;
    return function() {
        var context = this, args = arguments;
        var later = function() {
            timeout = null;
            if (!immediate) func.apply(context, args);
        };
        var callNow = immediate && !timeout;
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
        if (callNow) func.apply(context, args);
    };
};