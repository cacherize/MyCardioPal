$(document).ready(function(){
  if (!$("#support_ticket_reason_other").is(':checked')) {
    $("#otherReasonField").hide();
  }
});

$(".radioButtonGroup input[type='radio']").change(function(){
  if ($("#support_ticket_reason_other").is(':checked')) {
    $("#otherReasonField").slideDown();
  } else {
    $("#otherReasonField").slideUp();
  }
});