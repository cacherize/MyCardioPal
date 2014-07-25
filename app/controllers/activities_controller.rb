class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(params[:activity])

    respond_to do |format|
      if @activity.save
        format.html{redirect_to root_path, notice: 'Success! Added activity!'}
      else
        format.html{render :new}
      end
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html{redirect_to root_path, notice: 'Success! Updated activity!'}
      else
        format.html{render :edit}
      end
    end
  end
end
