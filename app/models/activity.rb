class Activity < ActiveRecord::Base
  attr_accessible :name, :met, :description, :position, :short_name
end
