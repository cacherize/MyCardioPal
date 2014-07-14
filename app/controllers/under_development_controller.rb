class UnderDevelopmentController < ApplicationController
  skip_filter :store_location
  skip_filter :authenticate
  skip_filter :redirect_to_under_dev_page
  def index
    respond_to do |format|
      format.html{render layout: 'blank_layout'}
    end
  end
end
