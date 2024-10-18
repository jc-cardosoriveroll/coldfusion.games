function parseMessage(message){

    /* always update user list */
    updateUserList();


    let clientid = document.getElementById("clientid");
    /* Get ClientID from Data to identify Self */
    if (typeof message.clientid !== 'undefined') {
        clientid.innerHTML = message.clientid;  
    }

    if (message.type == 'data'){
        //let other = message.data.subscriberInfo;
        switch (message.data.action){
            case "refreshUsers" : updateUserList(); break;
        }
    }

    console.log(message);

    /* always update user list */
    updateUserList();
}

function updateUserList(){
    clearUserList();
    let clientid = document.getElementById("clientid");
    $.get('remote/async.cfm?action=users', function(r) {
        let users = JSON.parse(r);
        users.forEach(function(user) {
            if (user.clientid != clientid.innerHTML)
            {
                // Example usage:
                const ulElement = document.getElementById('onlineUsers');
                const valueToFind = user.clientid;
                const found = searchForValueInLI(ulElement, valueToFind);

                if (!found) {
                    const liElement = document.createElement('li');
                    liElement.textContent = user.clientid;                
                    liElement.setAttribute("onclick", "handleClick('" + user.clientid + "')");                
                    ulElement.appendChild(liElement);
                } 

            }
        });
    });
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

function searchForValueInLI(listElement, valueToSearch) {
    // Get all LI elements within the list
    const liElements = listElement.querySelectorAll('li');
  
    // Iterate through each LI element
    for (const li of liElements) {
      // Get the text content of the LI element
      const liText = li.textContent.trim();
  
      // Check if the value matches
      if (liText === valueToSearch) {
        // If found, return true
        return true;
      }
    }
  
    // If not found after iterating through all elements, return false
    return false;
  }