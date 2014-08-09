$(document).ready(function(){
  if ($("#workoutForm").length > 0) {
    loadWorkoutForm();
  }
});

function loadWorkoutForm(){
  $("#workout_date").datepicker({
    dateFormat: "m-d-yy",
    prevText: '\u2190',
    nextText: '\u2192',
    beforeShow:function( input, inst )
      {
          var dp = $(inst.dpDiv);
          var offset = $(input).outerWidth(false) - dp.outerWidth(false);
          dp.css('margin-left', offset + 1);
      }
  });

   $(".chosen-select").chosen({
    allow_single_deselect: true,
    no_results_text: "Oops, nothing found!",
    width: '100%'
  });

  $("#workoutActivityFields").on('mouseover', '.activeLink',function(){
    $(".loader").stop().animate({width: '40px'})
  });
  $("#workoutActivityFields").on('mouseout', '.activeLink',function(){
    $(".loader").stop().animate({width: 0})
  });

  $("#workout_activity_id").change(function(){
    if ($(this).val() !== "") {
      $("#workoutActivityFields .fieldErrorMsg").hide();
      $("#workoutDetailFieldsLink").addClass('activeLink');
      $("#fieldPreviewBoxLeft").animate({opacity: 1}, 'slow');
    } else {
      $("#workoutDetailFieldsLink").removeClass('activeLink');
      $("#fieldPreviewBoxLeft").animate({opacity: 0}, 'fast');
    }

    var activityVal = $("#workout_activity_id_chosen .chosen-single span").text();

    $("#fieldPreviewBoxLeft #previewBoxActivity").text(activityVal);
  });
  $("#workout_activity_id").trigger('change')

  $("#workoutDetailFieldsLink").click(function(event){
    if (!$(this).hasClass('activeLink')) {
       $("#workout_activity_id_chosen").effect("highlight", {color: '#fdd'}, 3000);
       $("#workoutActivityFields .fieldErrorMsg").show();
    } else {
      $("#workoutActivityFields").hide();
      $("#workoutDetailFields").fadeIn();
      $("#activityChangeLink").fadeIn();
    }

    event.preventDefault();
  });

  $("#activityChangeLink").click(function(event){
    $(this).hide();
    $("#workoutDetailFields").hide();
    $("#workoutActivityFields").fadeIn();
    event.preventDefault();
  });
}