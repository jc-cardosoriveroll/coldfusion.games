// * script *//
$(document).ready(function(){


    $(".letter").click(function(){
        var letter = $(this).attr("letter")
        alert("Hola! picaste la letra..." + letter);
    });

});

