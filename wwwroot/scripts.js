$(document).ready(function(){
    $(".link").click(function(){
      var url = $(this).attr("data-url"); // Get the URL from the button's data-url attribute
      $.ajax({
        url: url,
        success: function(data) {
          $("#modalContent").html(data); // Replace the modal content with the fetched data
          $("#myModal").css("display", "block");
        }
      });
    });
  
    $(".close").click(function(){
      $("#myModal").css("display", "none");
    });
  });
