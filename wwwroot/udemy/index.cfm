<cfif isdefined("form.category") and isdefined("form.level")>
    <cfset Application.game.init(category=form.category,level=form.level)>
</cfif>

<!---- Get Additional Data --->
<cfset cats = application.game.getAllCategories()>
<cfset letters = application.game.getAllLetters()>

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

                  <!--- Select Level/Category --->
                  <div class="setup">
                    <form method="post" action="index.cfm" name="settings">
                      <div class="row">
                        <div class="col-2">&nbsp;</div>
                        <div class="col-3">
                          <h5>Level:</h5>
                          <select name="level" class="form-control">
                            <option value="1" <cfif application.game.data.level eq 1> selected </cfif>>Easy</option>
                            <option value="2" <cfif application.game.data.level eq 2> selected </cfif>>Medium</option>
                            <option value="3" <cfif application.game.data.level eq 3> selected </cfif>>Hard</option>
                          </select>
                        </div>
                        <div class="col-3">
                          <h5>Category:</h5>
                          <select name="category" class="form-control">
                              <cfloop from="1" to="#arraylen(cats)#" index="c">
                                  <option value="#cats[c]#" <cfif application.game.data.category eq cats[c]> selected </cfif> >
                                      #cats[c]#
                                  </option>
                              </cfloop>
                          </select>
                        </div>
                        <div class="col-2">
                          <h5>&nbsp;</h5>
                          <input type="submit" value="NEW GAME" class="btn btn-primary">
                        </div>
                        <div class="col-2">&nbsp;</div>
                    </form>
                  </div>



                </div> <!--- container --->

            </div>
          </div>
          <span class="love">Built with &hearts; by JC. Learn more in our <a href="https://www.udemy.com/course/desarrollo-apps-en-adobe-coldfusion/">Coldfusion Courses.</a></span>
        </div>

      </body>
    </html>
</cfoutput>
