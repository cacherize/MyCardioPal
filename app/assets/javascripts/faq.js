$(document).ready(function(){
  if ($(".formErrors").length > 0) {
    $(".adminForm").show();
    $(".adminAddLink").hide();
  } else {
    $(".adminForm").hide();
    $(".adminAddLink").show();
  }
});

$(".adminAddLink").click(function(e){
  $(".adminForm").slideDown('slow');
  $(this).hide();
  e.preventDefault();
});

$('.formClose').click(function(e){
  $(".adminForm").slideUp('slow', function(){
    $(".adminAddLink").show();
  });
  e.preventDefault();
});