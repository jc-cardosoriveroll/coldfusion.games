<cfdirectory directory="#expandpath('/learn')#" name="dir">
<cffile action="read" file="#expandpath('udemy.json')#" variable="u">
<cfset udemy = deserializeJSON(u)>


<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <title>Learn Coldfusion</title>
            <meta charset="UTF-8">
            <!--- Bootstrap/Jquery framework --->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
            <link rel="stylesheet" href="style.css">
        </head>
        <body>
            
        <h1>LEARN ADOBE COLDFUSION</h1>

        <div class="card">
            <div class="card-body">
                <cfloop query="dir">
                    <cfif type eq 'dir'>
                        <cfset tlname = name>
                        <h4>#tlname#
                            <cfloop from="1" to="#arraylen(udemy)#" index="u">
                                <cfif udemy[u].path eq tlname>
                                    - <a href="#udemy[u].link#" target="_blank">UDEMY</a>
                                    <cfif len(udemy[u].coupon) gt 0>
                                        (Coupon: #udemy[u].coupon#)
                                    </cfif>
                                </cfif>
                            </cfloop>
                        </h4>
                        <cfdirectory directory="#expandpath('/learn/' & tlname)#" name="dir2">
                        <ul>
                            <cfloop query="dir2">
                                <cfif type eq 'dir'>
                                    <li><h5><a href="/learn/#tlname#/#name#/index.cfm" target="_blank">#name#</h5></li>
                                </cfif>
                            </cfloop>
                        </ul>
                </cfif>
                </cfloop>
            </div>
        </div>
            

        <!--- Bootstrap/Jquery Framework --->
        <script src="https://code.jquery.com/jquery-3.7.1.slim.js" integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        
        </body>
    </html>
</cfoutput>