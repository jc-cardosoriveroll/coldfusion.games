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
                    <h3>Waiting for Other Player to Connect</h3> 

                    <div id="divToCopy">http://coldfusion.games/demos/3_ticTacToe</div>

                    <div id="game" class="visible">
                        <table class="table board">
                          <tr>
                            <th class="cell p11" id="p11"></th>
                            <th class="cell p12" id="p12"></th>
                            <th class="cell p13" id="p13"></th>
                          </tr>
                          <tr>
                            <th class="cell p21" id="p21"></th>
                            <th class="cell p22" id="p22"></th>
                            <th class="cell p23" id="p23"></th>
                          </tr>
                          <tr>
                            <th class="cell p31" id="p31"></th>
                            <th class="cell p32" id="p32"></th>
                            <th class="cell p33" id="p33"></th>
                          </tr>
                        </table>
                    </div>

              </div>
            </div>
            <span class="love">Built with &hearts; by JC. Learn more in our <a href="https://www.udemy.com/course/desarrollo-apps-en-adobe-coldfusion/">Coldfusion Courses.</a></span>
          </div>
  
        </body>
      </html>
  </cfoutput>
  