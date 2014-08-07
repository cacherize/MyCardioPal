$(document).ready(function(){
  if ($("#workoutForm").length > 0) {
    loadWorkoutForm();
  }
});

function loadWorkoutForm(){
  $("#workout_date").datepicker();
}