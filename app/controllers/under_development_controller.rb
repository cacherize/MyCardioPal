class UnderDevelopmentController < ApplicationController
  skip_filter :store_location
  skip_filter :authenticate
  def index
  end
end
