
$(document).ready(function() {

    $( ".pick" ).click(function(){
        /* get values from clicked element */
        var letter = $(this).attr("letter");
        alert("your letter is: " + letter);
    });

});