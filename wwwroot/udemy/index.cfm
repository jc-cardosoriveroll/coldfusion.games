<cfset application.game.init()>
<cfset letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]>

<!----------------- MAIN CONTENT ---------------->
<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <title>Hangman</title>
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

                  <div class="image">
                    <img src="images/step0.png" width="115" height="160" id="hang"> <!--- keep size consistent --->
                  </div>

                  <div class="letters">
                    <cfloop from="1" to="#len(application.game.data.word)#" index="w">
                      <!--- JS will change the image async through ID (default: 0 for empty) --->
                      <img src="images/0_hiRes.png" height="60" width="60" class="letter" id="p#w#">
                    </cfloop>
                  </div>

                  <ul>
                    <cfloop from="1" to="#arraylen(letters)#" index="l">
                      <li>
                        <a class="pick" letter="#letters[l]#">
                            <img src="images/#letters[l]#.png" />
                        </a>
                      </li>
                    </cfloop>
                  </ul>


                </div> <!--- container --->

            </div>
          </div>
          <span class="love">Built with &hearts; by JC. Learn more in our <a href="https://www.udemy.com/course/desarrollo-apps-en-adobe-coldfusion/">Coldfusion Courses.</a></span>
        </div>

      </body>
    </html>
</cfoutput>
