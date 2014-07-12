class HomeController < ApplicationController
  skip_filter :authenticate
  def index
  end
end
