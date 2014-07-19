class WorkoutsController < ApplicationController
  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(params[:workout])

    respond_to do |format|
      raise @workout.inspect
      if @workout.save
        format.html{redirect_to @workout, notice: 'Success! Added workout!'}
      else
        format.html{render :new}
      end
    end
  end
end
