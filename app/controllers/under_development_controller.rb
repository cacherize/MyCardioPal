class UnderDevelopmentController < ApplicationController
  skip_filter :store_location
  skip_filter :authenticate
  def index
    respond_to do |format|
      format.html{render layout: 'blank_layout'}
    end
  end
end
