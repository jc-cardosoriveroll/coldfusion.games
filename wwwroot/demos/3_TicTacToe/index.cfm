<cfwebsocket name   ="ws"
        subscribeTo	="websocket" 
        onMessage 	="parseMessage"
          onClose   ="parseMessage"
          onError   ="parseMessage"
           onOpen   ="parseMessage"
            secure  = false />


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
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/fontawesome.min.css" integrity="sha512-B46MVOJpI6RBsdcU307elYeStF2JKT87SsHZfRSkjVi4/iZ3912zXi45X5/CBr/GbCyLx6M1GQtTKYRd52Jxgw==" crossorigin="anonymous" referrerpolicy="no-referrer" />          
          <link rel="stylesheet" href="styles/style.css?uuid=#createUUID()#">
          <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/js/all.min.js" integrity="sha512-6sSYJqDreZRZGkJ3b+YfdhB3MzmuP9R7X1QZ6g5aIXhRvR1Y/N/P47jmnkENm7YL3oqsmI6AK+V6AD99uWDnIw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
                    <hr>
                    <div id="divToCopy">http://coldfusion.games/demos/3_ticTacToe</div>
                    <i class="fa fa-copy fa-2x" onclick="copyToClipboard()" />
              </div>
            </div>
            <span class="love">Built with &hearts; by JC. Learn more in our <a href="https://www.udemy.com/course/desarrollo-apps-en-adobe-coldfusion/">Coldfusion Courses.</a></span>
          </div>
  
        </body>
      </html>
  </cfoutput>
  