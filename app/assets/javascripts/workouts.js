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

    if ($("#workoutActivityFields").is(":visible")) {
      var activityVal = $("#workout_activity_id_chosen .chosen-single span").text();

      $("#fieldPreviewBoxLeft #previewBoxActivity").text(activityVal);
    } else if ($("#workoutDetailFields").is(":visible")) {
      $("#activityChangeLink").fadeIn();
    }
  });
  $("#workout_activity_id").trigger('change');

  $("#workoutDetailFieldsLink").click(function(event){
    if (!$(this).hasClass('activeLink')) {
       $("#workout_activity_id_chosen").effect("highlight", {color: '#fdd'}, 3000);
       $("#workoutActivityFields .fieldErrorMsg").show();
    } else {
      $("#workoutActivityFields").hide();
      $("#workoutDetailFields").fadeIn();
      $("#activityChangeLink").fadeIn();
      $(".calorieCountField:first").trigger('change');
      
      var id = $("#workout_activity_id").val(),
          activityUrl = '/activities/'+id+'/met';
      $.get(activityUrl, function(data){
        $("#metValue").val(data);
      });
    }

    event.preventDefault();
  });

  $("#activityChangeLink").click(function(event){
    $(this).hide();
    $("#workoutDetailFields").hide();
    $("#workoutActivityFields").fadeIn();
    event.preventDefault();
  });

  $(".calorieCountField").change(function(){
    var weightValue = $("#workout_weight").val(),
        weightUnits = $("#workout_weight_units").val(),
        metValue = $("#metValue").val(),
        totalSeconds = 0;

        totalSeconds += parseFloat(($("#workout_time_hours").val() || 0) * 3600)
        totalSeconds += parseFloat(($("#workout_time_minutes").val() || 0) * 60)
        totalSeconds += parseFloat($("#workout_time_seconds").val() || 0)

    if (weightValue.length && weightUnits.length && (metValue > 0) && (totalSeconds > 0)) {
      var calories = Math.round(calculateBurnedCalories(weightValue, weightUnits, metValue, totalSeconds));
      $("#previewBoxCalorie").text(calories)
      $("#fieldPreviewBoxRight").animate({opacity: 1}, 'slow');
    } else {
      $("#previewBoxCalorie").val('Fill Out Fields');
      $("#fieldPreviewBoxRight").animate({opacity: 0}, 'fast');
    }
  });
  $(".calorieCountField:first").trigger('change');
}

function calculateBurnedCalories(weightValue, weightUnits, metValue, seconds) {
  if (weightUnits == "lb") {
    weightValue = weightValue / 2.2046
  }
  hours = seconds / 3600
  total = (weightValue * metValue) * hours

  return total;
}