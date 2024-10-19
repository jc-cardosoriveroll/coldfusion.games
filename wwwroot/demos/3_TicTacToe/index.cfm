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
              <div class="card-window" id="container">
  
                  <div id="lobby" class="visible">
                    <h1>Welcome to Tic-Tac-Toe Lobby</h1>
                    <p>Your ID: <span id="clientid"></span>
                    <h3>Waiting for Another Player to Connect</h3> 
                    <br>http://coldfusion.games/demos/3_ticTacToe
                  </div>

                  <div id="board" class="hidden">
                      <table>
                        <tr>
                          <td class="cell br"><button id="p11" class="pick">here</button></td>
                          <td class="cell br"><button id="p12" class="pick">here</button></td>
                          <td class="cell b"><button id="p13" class="pick">here</button></td>
                        </tr>
                        <tr>
                          <td class="cell br"><button id="p21" class="pick">here</button></td>
                          <td class="cell br"><button id="p22" class="pick">here</button></td>
                          <td class="cell b"><button id="p23" class="pick">here</button></td>
                        </tr>
                        <tr>
                          <td class="cell r"><button id="p31" class="pick">here</button></td>
                          <td class="cell r"><button id="p32" class="pick">here</button></td>
                          <td class="cell"><button id="p33" class="pick">here</button></td>
                        </tr>
                      </table>
                  </div>
                  <span id="game" class="hidden"></span>

              </div>
            </div>
            <span class="love">Built with &hearts; by JC. Learn more in our <a href="https://www.udemy.com/course/desarrollo-apps-en-adobe-coldfusion/">Coldfusion Courses.</a></span>
          </div>

        </body>
      </html>
  </cfoutput>
  