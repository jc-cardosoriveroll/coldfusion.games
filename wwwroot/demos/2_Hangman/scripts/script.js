

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

            /* now update visual elements  */
            game.data.show.forEach(showLetter); 
            $("#hang").attr("src",game.data.hangImg);

            /* simple game status Feedback & Reset */
            if (game.data.gameOver) {  
                if (confirm("You: " + game.data.wonOrLost + " word was: " + game.data.word + " - Play again?") == true) 
                    {location.href = "index.cfm?init"; }}

        });        

    });

    /* function to display each letter at each position */
    function showLetter(value, index, array) {
        var pos = index + 1;    /* +1 because index starts in 0 */
        $("#p" + pos).attr("src", value); 
    }

 
});

       
