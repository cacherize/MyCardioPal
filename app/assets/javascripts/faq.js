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

  $('#faqList li').on('mouseenter', '.faqQuestion', function(){
    $(this).children('.faqActions').stop().slideDown(600);
  });
  $('#faqList li').on('mouseleave', '.faqQuestion', function(){
    $(this).children('.faqActions').stop().slideUp(600);
  });

  $("#faqList").on('click', ".faqEditLink, .faqCancelEditLink", function(e){
    var el = $(this);

    $.get(this.href, function(data){
      el.closest('li').html(data);
    });
    e.preventDefault();
  });

  $('#faqList').on('click', '#faqSubmitBtn', function(){
    var form = $(this).closest('form'),
        questionValue = form.find("#faq_question").val(),
        answerValue = form.find("#faq_answer").val();

    if (questionValue == '' || answerValue == '') {
      alert('Fill in all fields')
      return false;
    }
  });
}