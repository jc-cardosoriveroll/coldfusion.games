<cfwebsocket name   ="ws"
        onMessage 	="parseMessage"
          onClose   ="parseMessage"
        subscribeTo	="websocket" 
              secure= false />


  <!----------------- MAIN CONTENT ---------------->
  <cfoutput>
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <title>TicTacToe</title>
          <!--- Bootstrap/Jquery framework --->
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
          <link rel="stylesheet" href="styles/style.css?uuid=#createUUID()#">
          <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
          <script src="scripts/script.js?uuid=#createUUID()#"></script>
        </head>
        <body>
          <!--- Main Content --->
          <div class="card">
            <div class="card-body">
              <div class="card-window">
  
                  <div class="container">


                    <h1>Welcome to Lobby</h1>
                    <p>Your ID: <span id="clientid"></span>

                     <hr>

                    <h3>Play against:</h3> 
                    <ul id="onlineUsers"></ul>

              </div>
            </div>
            <span class="love">Built with &hearts; by JC. Learn more in our <a href="https://www.udemy.com/course/desarrollo-apps-en-adobe-coldfusion/">Coldfusion Courses.</a></span>
          </div>
  
        </body>
      </html>
  </cfoutput>
  