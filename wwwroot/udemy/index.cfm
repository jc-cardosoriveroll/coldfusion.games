
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
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.blockUI/2.70/jquery.blockUI.min.js" integrity="sha512-eYSzo+20ajZMRsjxB6L7eyqo5kuXuS2+wEbbOkpaur+sA2shQameiJiWEzCIDwJqaB0a4a6tCuEvCOBHUg3Skg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>          
          <script src="scripts/script.js?uuid=#createUUID()#"></script>
        </head>
        <body>

          <div class="card">
            <div class="card-body">
              <div class="card-window" id="container">
  
                  <div id="lobby" class="visible">
                    <h1>Welcome to Tic-Tac-Toe</h1>
                    <hr>
                    <h3>Waiting for Another Player to Connect</h3> 
                    <br>http://coldfusion.games/demos/3_ticTacToe
                  </div>

                  <div id="board" class="hidden">
                      <table class="table">
                        <tr>
                          <td class="cell br" id="p11"><button onclick="pick('p11');">here</button></td>
                          <td class="cell br" id="p12"><button onclick="pick('p12');">here</button></td>
                          <td class="cell b" id="p13"><button onclick="pick('p13');">here</button></td>
                        </tr>
                        <tr>
                          <td class="cell br" id="p21"><button onclick="pick('p21');">here</button></td>
                          <td class="cell br" id="p22"><button onclick="pick('p22');">here</button></td>
                          <td class="cell b" id="p23"><button onclick="pick('p23');">here</button></td>
                        </tr>
                        <tr>
                          <td class="cell r" id="p31"><button onclick="pick('p31');">here</button></td>
                          <td class="cell r" id="p32"><button onclick="pick('p32');">here</button></td>
                          <td class="cell" id="p33"><button onclick="pick('p33');">here</button></td>
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
  