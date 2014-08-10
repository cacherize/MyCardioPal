class Activity < ActiveRecord::Base
  attr_accessible :name, :met, :description, :position, :short_name
  validates_presence_of [:name, :description, :short_name, :met], message: "is required"

  has_many :workouts
end
