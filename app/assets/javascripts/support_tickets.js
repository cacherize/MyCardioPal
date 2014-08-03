$(document).ready(function(){
  if (!$("#support_ticket_reason_other").is(':checked')) {
    $("#otherReasonField").hide();
  } else if ($("#support_ticket_other_reason").parent().hasClass('field_with_errors')) {
   $("#otherReasonField").css('border-color', '#ff3131')
  }
});

$(".radioButtonGroup input[type='radio']").change(function(){
  if ($("#support_ticket_reason_other").is(':checked')) {
    $("#otherReasonField").slideDown();
  } else {
    $("#otherReasonField").slideUp();
  }
});