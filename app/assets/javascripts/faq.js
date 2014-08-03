$(document).ready(function(){
  if ($(".faqActions").length > 0) {
    applyAdminActions();
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

function applyAdminActions() {
  if ($("#newFaq .formErrors").length > 0) {
    $(".adminForm").show();
    $(".adminAddLink").hide();
  } else {
    $(".adminForm").hide();
    $(".adminAddLink").show();
  }

  $('#faqList dt').hover(function(){
    $(this).children('.faqActions').stop().slideDown(600);
  }, function(){
    $(this).children('.faqActions').stop().slideUp(600);
  });
}