
$(document).ready(function() {

    $( ".pick" ).click(function(){
        /* get values from clicked element */
        var letter = $(this).attr("letter");


        /* Call Async URL with data */
        $.get( "remote/async.cfm?letter=" + letter, function( data ) {
            /* ----------------------------------------------- */
                /* expect a data response like: 
                {"data":
                    {"hits":["a"],"word":"India","category":"Countries","wonOrLost":"None"
                    ,"miss":["b"],"gameOver":false,"hangImg":"images/step1.png","level":"1"
                    ,"show":["images/0_hires.png","images/0_hires.png","images/0_hires.png","images/0_hires.png","images/a_hires.png"] }}             
            /* ----------------------------------------------- */

            /* always good practice to debug in console */
            console.log(data);
            var game = $.parseJSON(data);
            console.log(game);
        });


        

    });

});