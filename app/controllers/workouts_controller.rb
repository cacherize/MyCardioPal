class WorkoutsController < ApplicationController
  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(params[:workout])

    respond_to do |format|
      if @workout.save
        format.html{redirect_to @workout, notice: 'Success! Added workout!'}
      else
        format.html{render :new}
      end
    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])

    respond_to do |format|
      if @workout.update_attributes(params[:workout])
        format.html{redirect_to @workout, notice: "Success! Updated workout!"}
      else
        format.html{render :edit}
      end
    end
  end
end
