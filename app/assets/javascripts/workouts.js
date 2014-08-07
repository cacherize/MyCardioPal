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
}